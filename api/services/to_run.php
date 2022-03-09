<?php 
    //Headers 
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json'); 

    include_once("../../config/Database.php");
    include_once("../../models/Service.php");
    include_once("../../models/Logs.php"); 

    //Instantiate DB & connect 
    $database = new Database(); 
    $db = $database->connect(); 

    //Instantiate Service object 
    $service = new Service($db);

    //Instantiate Logs class object 
    $logs = new Logs($db);
    
    //Set dependency bind parameters
    $service->thisfulldate = $thisfulldate_; 

    //Service query 
    $result = $service->services_to_run();

    //Get row count 
    $count = $result->rowCount(); 

    //check if any service 
    if($count > 0){
        //Service array 
        $services_arr = array("success" => true, "count" => $count);
        $services_arr['data'] = array(); 
        
        while($row = $result->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            
            $curl = curl_init();

             curl_setopt_array($curl, array(
                 CURLOPT_URL => $service_address,
                 CURLOPT_RETURNTRANSFER => true,
                 CURLOPT_ENCODING => '',
                 CURLOPT_MAXREDIRS => 10,
                 CURLOPT_TIMEOUT => 0,
                 CURLOPT_FOLLOWLOCATION => true,
                 CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                 CURLOPT_CUSTOMREQUEST => 'GET',
             ));
     
             $response = curl_exec($curl);
     
             curl_close($curl);
             //echo $response;
     
             //Set logs properties 
             $logs->text = $response;
             $logs->service_id = $id;

             //Insert logs/response to the database 
             $logs->addlogs();

            if($unit === "MINUTES" && (int) $frequency > 0 ){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency minutes");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }elseif($unit === "HOURS" && (int) $frequency > 0){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency hours");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }elseif($unit === "DAYS" && (int) $frequency > 0){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency days");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }elseif($unit === "WEEKS" && (int) $frequency > 0){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency weeks");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }elseif($unit === "MONTHS" && (int) $frequency > 0){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency months");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }elseif($unit === "YEARS" && (int) $frequency > 0){
                //update next run time 
                $r_timestamp_ = date_create($r_timestamp);
                date_modify($r_timestamp_, "$frequency months");
                $next_r_timestamp_ =  date_format($r_timestamp_, "Y-m-d H:i:s");

                $service->update_next_r_timestamp($id, $next_r_timestamp_);
            }else{
                //implies not a repetitive service
                //update is_executed column to 'Yes'
                $service->is_executed($id, 'Yes');
            }
            

            $service_item = array(
                "id" => $id, 
                "service_address" => $service_address, 
                "run timestamp" => $r_timestamp, 
                "unit" => $unit, 
                "frequency" => $frequency,
                "is_executed" => $is_executed, 
                "added_at" => $added_at,
                "updated_at" =>$updated_at,
                "status" => $status,
             );

             //push to "data" 
             array_push($services_arr["data"], $service_item);
        }

        //Turn to JSON & output 
        echo json_encode($services_arr);
    }else{
        echo json_encode(
            array("success" => false, "message" => "No service to run at the current time")
        );
    }

?>