<?php 
    //Headers 
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json'); 
    header('Access-Control-Allow-Methods: PUT');
    header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With'); 

    include_once("../../config/Database.php");
    include_once("../../models/Service.php");
    include_once("../../helpers/functions.php"); 

    //Instantiate DB & connect 
    $database = new Database(); 
    $db = $database->connect(); 

    //Instantiate Service object 
    $service = new Service($db);
    
    
    //Get raw added data 
    $data = json_decode(file_get_contents("php://input"));

    //Set ID to update
    if(!isset($data->service_id) || (int) $data->service_id < 0){
        die(json_encode(array("success" => false, "message" => "ID for Service address to update is required")));
    }else{
        $service->id = $data->service_id;
    }

    //Now the data itself
    if(!isset($data->service_address)){
        die(json_encode(array("success" => false, "message" => "Service address is required")));
    }

    if(!isset($data->r_timestamp)){
        die(json_encode(array("success" => false, "message" => "Date and time is required")));    
       
    }

    if(strlen($data->r_timestamp) !== 19){
        die(json_encode(array("success" => false, "message" => "Please enter a valid timestamp")));    
       
    }

    if(!isset($data->unit)){
        die(json_encode(array("success" => false, "message" => "Unit is required and should be more than 3 characters.")));      
    }


    //validating unit entered
    $allowed_units_arr  = ['MINUTES', 'HOURS', 'DAYS', 'MONTHS', 'YEARS'];
    $allowed_units = implode(",", $allowed_units_arr);


    if((unit_type($data->unit, $allowed_units_arr)) == 0){
        die(json_encode(array("success" => false, "message" => "The added unit is not allowed. Only $allowed_units"))); 
    }



    if(!isset($data->frequency) || strlen($data->frequency) !== 1 && strlen($data->frequency) !== 2){
        die(json_encode(array("success" => false, "message" => "Frequency is required and should be 1 or 2 digits")));      
    }
    
    $service->service_address = $data->service_address;
    $service->r_timestamp = $data->r_timestamp;
    $service->unit = $data->unit; 
    $service->frequency = $data->frequency;
    
    //update service 
    if($service->update()){
        echo json_encode(array("success" => true, "message" => "Service was updated")); 
    }else{
        echo json_encode(array("success" => false, "message" => "Service not updated"));
    }
?>