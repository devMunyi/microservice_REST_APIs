<?php
date_default_timezone_set("Africa/Nairobi");

$thismin_ = date('i');
$thishour_ = date('H');
$thisday_=date('d');
$thisdayname_=date('D');
//$thismonthname_ = date('M');
$thismonth_ = date('m');
$thisyear_ = date('Y');
//$thisfulldate_ = date('Y-m-d H:i:s');
$thisfulldate_ = date('Y-m-d H:i');


 class Database {
     //Db params
     private $host = "localhost";
     private $db_name = "microservice_db";
     private $username = "root"; 
     private $password = ""; 
     private $conn;
     
     //DB connect 
     public function connect (){
         $this->conn = null; 
         try{
            $this->conn = new PDO('mysql:host='.$this->host.';dbname='.$this->db_name,
             $this->username, $this->password);
             $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
         } catch(PDOException $e){
            echo("Connection Error: ". $e->getMessage());
         }

         return $this->conn;
     }

 }
