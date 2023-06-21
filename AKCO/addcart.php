<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8');

require_once('session.php'); 

if (isset($_GET['p_id']) && isset($_GET['p_spec']) && isset($_GET['qty'])) {
    $p_id = $_GET['p_id'];
    $p_spec = $_GET['p_spec'];
    $qty = $_GET['qty'];
    $u_ip=$_SERVER['REMOTE_ADDR'];
    $query = "INSERT INTO cart (p_id, p_spec, qty, ip) VALUES (".$p_id.", '".$p_spec."', ".$qty.", '".$u_ip."');";
    $conn = new Dbhandler();
    $result=$conn->conn()->query($query) or die($conn->conn()->error);
    if ($result) {
        $retcode=array("c"=>"1","m"=>'謝謝您!產品以加入購物車中。');
    } else {
        $retcode=array("c"=>"0","m"=>'抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>