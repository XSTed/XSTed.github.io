<!-- 建立購物車資料查詢 -->
<?php
$SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND orderid IS NULL AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product_img.sort=1 ORDER BY cartid DESC";
$conn = new Dbhandler();
$cart_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
$ptotal = 0; //設定累加的變數，初始為0
?>
<h3>AK CO：購物車</h3>
<?php if ($cart_rs->num_rows != 0) { ?>
    <a href="product.php" style="color:white;text-decoration:none;"><button type="button" name="btn01" id="btn01" class="btn-11">繼續購物</button></a>
    <button type="button" name="btn02" id="btn02" class="btn-11" onclick="window.history.go(-1)">回到上一頁</button>
    <button type="button" name="btn03" id="btn03" class="btn-11" onclick="btn_confirmLink('確定清空購物車?','shopcart_del.php?mode=2');">清空購物車</button>
    <a href="checkout.php" style="color:white;text-decoration:none;"><button type="button" name="btn01" id="btn01" class="btn-11">前往結帳</button></a>
    <div class="table-responsive-md">
        <table class="table table-hover mt-3">
            <thead>
                <tr class="table-dark">
                    <td width="10%">產品編號</td>
                    <td width="10%">圖片</td>
                    <td width="15%">名稱</td>
                    <td width="10%">規格</td>
                    <td width="15%">價格</td>
                    <td width="10%">數量</td>
                    <td width="15%">小計</td>
                    <td width="15%">下次再買</td>
                </tr>
            </thead>
            <tbody>
                <?php while ($cart_data = mysqli_fetch_assoc($cart_rs)) { ?>
                    <tr>
                        <td><?php echo $cart_data['p_id']; ?></td>
                        <td><img src="product_img/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" class="img-fluid"></td>
                        <td><?php echo $cart_data['p_name']; ?></td>
                        <td><?php echo $cart_data['p_spec']; ?></td>
                        <td>
                            <h4 class="pt-1">$<?php echo $cart_data['p_price']; ?></h4>
                        </td>
                        <td>
                            <div class="input-group">
                                <input type="number" class="form-control" name="qty[]" id="qty[]" value="<?php echo $cart_data['qty']; ?>" min="1" max="49" cartid="<?php echo $cart_data['cartid']; ?>" required>
                            </div>
                        </td>
                        <td>
                            <h4 class="pt-1">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></h4>
                        </td>
                        <td><button type="button" id="btn[]" name="btn[]" class="btn-11" onclick="btn_confirmLink('確定刪除本資料?','shopcart_del.php?mode=1&cartid=<?php echo $cart_data['cartid']; ?>');">取消</button></td>
                    </tr>
                <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                } ?>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7">累計：<?php echo $ptotal; ?></td>
                </tr>
                <tr>
                    <td colspan="7">運費:100</td>
                </tr>
                <tr>
                    <td colspan="7" class="color_red">總計：<?php echo $ptotal + 100; ?></td>
                </tr>
            </tfoot>
        </table>
    </div>
<?php } else { ?>
    <div class="alert alert-warning" role="alert">
        抱歉!目前購物車沒有相關產品。
    </div>
<?php } ?>