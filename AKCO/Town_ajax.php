<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string

require_once('session.php'); 

$Town = sprintf("SELECT * FROM town WHERE AutoNo='%d'",$_POST['CNo']);
$conn = new Dbhandler();
$Town_rs = $conn->conn()->query($Town) or die($conn->conn()->error);
$Town_num = $Town_rs->num_rows;
$htmlstring="<option value=''>選擇鄉市鎮</option>";
if($Town_num>0){
    while($Town_rows=mysqli_fetch_assoc($Town_rs)){
        $htmlstring=$htmlstring."<option value='".$Town_rows['townNo']."'>".$Town_rows['Name']."</option>";
    }
    $retcode=array("c"=>"1","m"=>$htmlstring);
} else {
    $retcode=array("c"=>"0","m"=>'找不到相關資料');
}
echo json_encode($retcode, JSON_UNESCAPED_UNICODE);

return ;
