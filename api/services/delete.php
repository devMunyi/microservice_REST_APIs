<?php 
    //Headers 
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json'); 
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With'); 

    include_once("../../config/Database.php");
    include_once("../../models/Service.php"); 

    //Instantiate DB & connect 
    $database = new Database(); 
    $db = $database->connect(); 

    //Instantiate Service object 
    $service = new Service($db); 

    //Get raw id data 
    $data = json_decode(file_get_contents("php://input"));

    //Set ID for column to delete
    if(!isset($data->service_id) || $data->service_id < 0){
        die(json_encode(array("success" => false, "message" => "ID for Service address to delete is required")));
    }else{
        $service->id = $data->service_id;
        //update status column to a static value of 0 
        $service->status = 0;
    }
    
    //Delete service 
    if($service->delete()){
        echo json_encode(array("success" => true, "message" => "Service was deleted")); 
    }else{
        echo json_encode(array("success" => false, "message" => "Service not deleted"));
    }
?>