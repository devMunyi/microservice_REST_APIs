<?php 
    //Headers 
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json'); 

    include_once("../../config/Database.php");
    include_once("../../models/Service.php"); 

    //Instantiate DB & connect 
    $database = new Database(); 
    $db = $database->connect(); 

    //Instantiate Service object 
    $service = new Service($db); 

    //Get ID 
    $service->id = isset($_GET["id"]) ? $_GET["id"] : die(
        //json_encode(array("success" => false,"message" => "Id required"))
    );

    //Service query 
    $result = $service->get_one_byid();

    //Get row count 
    $count = $result->rowCount(); 

    //check if any service 
    if($count > 0){
        //Service array 
        $services_arr = array("success" => true, "count" => $count);
        $services_arr['data'] = array(); 
        
        while($row = $result->fetch(PDO::FETCH_ASSOC)){
            extract($row); 

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
            array("success" => false, "message" => "No service found")
        );
    }

?>