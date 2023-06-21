<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string
require_once('session.php'); 

if (isset($_SESSION["MemberID"]) && $_SESSION["MemberID"]!="") {
    $MemberID=$_SESSION["MemberID"];
    $addressid=$_POST['addressid'];
    $ip=$_SERVER['REMOTE_ADDR'];
    $orderid=strtotime('now').rand(100000,999999); //自行產生訂單編號
    $query=sprintf("INSERT INTO uorder (orderid, MemberID, addressid, howpay, status) VALUES ('%s', '%d','%d','1','1');",$orderid,$MemberID,$addressid);
    $conn = new Dbhandler();
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    if ($result) {
        $query=sprintf("UPDATE cart SET orderid = '%s', MemberID='%d' WHERE ip ='%s' AND orderid IS NULL;",$orderid,$MemberID,$ip);
        $result=$conn->conn()->query($query) or die($conn->conn()->error);
        $SQLstring=sprintf("DELETE FROM cart WHERE ip='%s' AND `orderid` IS NULL",$_SERVER['REMOTE_ADDR']);
        $result=$conn->conn()->query($SQLstring) or die($conn->conn()->error);
        $retcode=array("c"=>"1","m"=>'謝謝您，系統已經完成結帳，請在首頁查閱訂單處理狀態。');
    } else {
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>