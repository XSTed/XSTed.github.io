<?php
//建立product藥粧商品rs
$maxRows_rs = 12;  //分頁設定數量
$pageNum_rs = 0;   //啟始頁
if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}
$startRow_rs = $pageNum_rs * $maxRows_rs;
if (isset($_GET['search_name'])) {
    //使用關鍵字查詢
    //SQL 資料庫查詢LIKE 相似性 p_name LIKE '%BB%' ，前後文字都沒關係，只要中間有BB即將資料印出
    $queryFirst = sprintf("SELECT * FROM product,product_img,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid=pyclass.classid AND (product.p_name LIKE '%s' OR product.p_price LIKE '%s') ORDER BY product.p_id DESC", '%' . $_GET['search_name'] . '%', '%' . $_GET['search_name'] . '%');
} elseif (isset($_GET['level']) && $_GET['level'] == 1) {
    //使用第一層類別查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid=pyclass.classid AND pyclass.uplink='%d' ORDER BY product.p_id DESC", $_GET['classid']);
} elseif (isset($_GET['classid'])) {
    //使用產品類別查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid='%d' ORDER BY product.p_id DESC", $_GET['classid']);
} else {
    //列出產品product資料查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id ORDER BY product.p_id DESC");
}


$query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
$conn = new Dbhandler();
$pList01 = $conn->conn()->query($query) or die($conn->conn()->error);

$i = 1;  //控制每列row產生

$results = array();

while ($row = mysqli_fetch_assoc($pList01)) {
    $result = array(
        'id' => $row['p_id'],
        'name' => $row['p_name'],
        'price' => $row['p_price'],
        'image' => 'product_img/' . $row['img_file'],
        'description' => mb_substr($row['p_intro'], 0, 30, "utf-8"),
        'link' => 'goods.php?p_id=' . $row['p_id']
    );

    array_push($results, $result);
}

echo json_encode($results);
