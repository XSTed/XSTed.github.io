<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string
require_once('session.php'); 

if (isset($_SESSION['MemberID']) && $_SESSION['MemberID']!="") {
    $MemberID=$_SESSION['MemberID'];
    $Username=$_POST['Username'];
    $mobile=$_POST['mobile'];
    $myzip=$_POST['myzip'];
    $address=$_POST['address'];
    //先將預設收件人取消
    $conn = new Dbhandler();
    $query=sprintf("UPDATE addbook SET setdefault = '0' WHERE MemberID='%d' AND setdefault ='1';",$MemberID);
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    //新增收件人設定為預設收件人
    $query="INSERT INTO addbook (setdefault, MemberID, Username, mobile, myzip, address) VALUES ('1', '".$MemberID."','".$Username."','".$mobile."','".$myzip."','".$address."')";
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    if ($result) {
        $retcode=array("c"=>"1","m"=>'收件人資訊已經新增。');
    } else {
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>