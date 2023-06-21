<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string
require_once('session.php');

if (isset($_SESSION['Member']) && $_SESSION['Member']!="") {
    $memberid=$_SESSION['Member'];
    $addressid=$_POST['addressid'];
    //先將預設收件人取消
    $query=sprintf("UPDATE addbook SET setdefault = '0' WHERE MemberID='%d' AND setdefault ='1';",$memberid);
    $conn = new Dbhandler();
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    //新增收件人設定為預設收件人
    $query=sprintf("UPDATE addbook SET setdefault = '1' WHERE addressid='%d';",$addressid);
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    if ($result) {
        $retcode=array("c"=>"1","m"=>'收件人已經變更。');
    } else {
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>