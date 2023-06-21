<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8');

require_once('session.php'); 

if (isset($_GET['email'])) {
    $email = $_GET['email'];
    $conn = new Dbhandler();
    $query = "SELECT MemberID FROM `members` WHERE `email`='".$email."'";
    $result=$conn->conn()->query($query);
    $row=$result->num_rows;
    if ($row==0) {
        echo 'true';
        return ;
    }   
}
echo 'false';
return;
?>