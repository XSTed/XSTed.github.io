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
$pList01 = $conn->conn()->query($query) or die($conn->conn()->error);

$i = 1;  //控制每列row產生
?>
<?php if ($pList01->num_rows != 0) { ?>
    <?php while ($pList01_Rows = mysqli_fetch_assoc($pList01)) { ?>
        <?php if ($i % 4 == 1) { ?>

            <div class="row text-center mb-3"> <?php } ?>

            <div class="card col-md-3"><a href="product.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                    <img src="product_img/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>"></a>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $pList01_Rows['p_name']; ?></h5>
                    <p class="card-text"><?php echo mb_substr($pList01_Rows['p_intro'], 0, 60, "utf-8"); ?>...</p>
                    <p class="card-text">NT<?php echo number_format($pList01_Rows['p_price']); ?></p>
                    <p class="card-text spec"><?php echo $pList01_Rows['p_spec']; ?></p>
                    <a href="product_content.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>更多資訊</a>
                    <button type="button" id="button01[]" name="button01[]" class="btn-11" onclick="addcart(<?php echo $pList01_Rows['p_id']; ?>)" style="top:-18px;">加入購物車</button>
                </div>
            </div>
            <?php if ($i % 4 == 0 || $i == $pList01->num_rows) { ?>
            </div>
        <?php } ?>

    <?php $i++;
    } ?>
    <div class="row mt-2">
        <div class="col-md-12">
            <?php
            //取得目前頁數
            if (isset($_GET['totalRows_rs'])) {
                $totalRows_rs = $_GET['totalRows_rs'];
            } else {
                $all_rs = $conn->conn()->query($queryFirst) or die($conn->conn()->error);
                $totalRows_rs = $all_rs->num_rows;
            }
            $totalPages_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
            //呼叫分頁功能函數
            $prev_rs = "&laquo;";
            $next_rs = "&raquo;";
            $separator = "|";
            $max_links = 20;
            $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
            ?>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                </ul>
            </nav>
        </div>
    </div>
<?php } else { ?>
    <div class="modalNoProduct">
        <div class="modal-content">
            <span class="closeNoProduct">關閉&times;</span>
            <p>抱歉，沒有相關產品。</p>
        </div>
    </div>
<?php } ?>