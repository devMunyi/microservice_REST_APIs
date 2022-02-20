<?php 
    //Headers 
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json'); 
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With'); 

    include_once("../../config/Database.php");
    include_once("../../models/Service.php"); 

    //Instantiate DB & connect 
    $database = new Database(); 
    $db = $database->connect(); 

    //Instantiate Service object 
    $service = new Service($db);
    
    
    //Get raw added data 
    $data = json_decode(file_get_contents("php://input"));
    
    if(!isset($data->service_address)){
        die(json_encode(array("success" => false, "message" => "Service address is required")));
    }

    if(!isset($data->r_timestamp)){
        die(json_encode(array("success" => false, "message" => "Date and time is required")));    
       
    }

    if(strlen($data->r_timestamp) !== 19){
        die(json_encode(array("success" => false, "message" => "Please enter a valid timestamp")));    
       
    }

    if(!isset($data->unit) || strlen($data->unit) < 4){
        die(json_encode(array("success" => false, "message" => "Unit is required and should be more than 3 characters.")));      
    }

    if(!isset($data->frequency) ||  strlen($data->frequency) !== 1 && strlen($data->frequency) !== 2){
        die(json_encode(array("success" => false, "message" => "Frequency is required and should be 1 or 2 digits")));      
    }
    
    $service->service_address = $data->service_address;
    $service->r_timestamp = $data->r_timestamp;
    $service->unit = $data->unit; 
    $service->frequency = $data->frequency;
    
    //add service 
    if($service->add()){
        echo json_encode(array("success" => true, "message" => "Service was added")); 
    }else{
        echo json_encode(array("success" => false, "message" => "Service not added"));
    }
?>