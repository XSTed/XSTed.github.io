<?php require_once "session.php"; ?>
<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<?php
//驗證是否帳號登入
if (!isset($_SESSION["Member"])) {
  $sPath = "login.php?sPath=orderlist";
  header(sprintf("Location:%s", $sPath));
}
?>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
  <?php require_once "header.php"; ?>
  <title>AK CO. OrderList Practice Full Stack Order List</title>
  <link rel="stylesheet" href="./static/css/product.css">
  <style type="text/css">
    .accordion-header a {
      text-decoration: none;
    }

    #accordion_order td {
      text-align: center;
      vertical-align: middle;
      font-size: 16px;
    }

    .collapse {
      padding-right: 0px;
    }

    .table> :not(caption)>*>* {
      border-bottom-width: 0px;
    }
  </style>
</head>

<body>
  <?php require_once "navBar.php"; ?>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2">
        <!-- 產品類別 -->
        <?php require_once("sidebar.php"); ?>
      </div>

      <div class="col-md-10">
        <!--引入訂單查詢-->
        <?php // require_once("order_content.php"); 
        ?>
        <?php
        //建立訂單查詢
        $maxRows_rs = 5; //分業設定數量
        $pageNum_rs = 0; //起啟頁=0
        if (isset($_GET['pageNum_order_rs'])) {
          $pageNum_rs = $_GET['pageNum_order_rs'];
        }
        $startRow_rs = $pageNum_rs * $maxRows_rs;
        $queryFirst = sprintf("SELECT *,uorder.create_date as udate FROM uorder,addbook WHERE uorder.MemberID='%d' AND uorder.addressid=addbook.addressid ORDER BY uorder.create_date DESC", $_SESSION['MemberID']);
        $conn = new Dbhandler();
        $query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
        $order_rs = $conn->conn()->query($query) or die($conn->conn()->error);
        $i = 21; //控制第一筆訂單開啟
        ?>
        <h3>AK CO:訂單查詢</h3>
        <?php if ($order_rs->num_rows != 0) { ?>
          <div class="accordion" id="accordion_order">
            <?php while ($data01 = mysqli_fetch_assoc($order_rs)) { ?>
              <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne<?php echo $i; ?>">
                  <a class="accordion-button <?php echo ($i != 21) ? 'collapsed' : ''; ?>" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<?php echo $i; ?>" href="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                    <div class="table-responsive-md" style="width:100%;">
                      <table class="table">
                        <thead>
                          <tr>
                            <td width="10%">訂單編號</td>
                            <td width="20%">下單日期時間</td>
                            <td width="15%">付款方式</td>
                            <td width="15%">訂單狀態</td>
                            <td width="10%">收件人</td>
                            <td width="20%">地址</td>
                            <td width="10%">備註</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td><?php echo $data01['orderid']; ?></td>
                            <td><?php echo $data01['udate']; ?></td>
                            <td><?php echo epayCode($data01['howpay']); ?></td>
                            <td><?php echo processCode($data01['status']); ?></td>
                            <td><?php echo $data01['cname']; ?></td>
                            <td><?php echo $data01['address']; ?></td>
                            <td><?php echo $data01['remark']; ?></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </a>
                </h2>
                <?php
                //處理訂單詳細商品資料列表
                $subQuery = sprintf("SELECT * FROM cart,product,product_img WHERE cart.orderid='%s' AND cart.p_id=product.p_id AND product.p_id=product_img.p_id AND product_img.sort='1' ORDER BY cart.create_date DESC", $data01['orderid']);
                $details_rs = $conn->conn()->query($subQuery) or die($conn->conn()->error);
                $ptotal = 0;
                ?>
                <div id="collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 21) ? 'show' : ''; ?>" aria-labelledby="headingOne<?php echo $i; ?>" data-parent="#accordion_order">
                  <div class="accordion-body">
                    <div class="table-responsive-md" style="width:100%;">
                      <table class="table table-hover" style="text-decoration:none !important;">
                        <thead>
                          <tr class="table-primary">
                            <td width="10%">產品編號</td>
                            <td width="10%">圖片</td>
                            <td width="25%">名稱</td>
                            <td width="15%">價格</td>
                            <td width="10%">數量</td>
                            <td width="15%">小計</td>
                            <td width="15%">狀態</td>
                          </tr>
                        </thead>
                        <tbody>
                          <?php while ($data02 = mysqli_fetch_assoc($details_rs)) { ?>
                            <tr>
                              <td><?php echo $data02['p_id']; ?></td>
                              <td><img src="product_img/<?php echo $data02['img_file']; ?>" alt="<?php echo $data02['p_name']; ?>" class="img-fluid"></td>
                              <td><?php echo $data02['p_name']; ?></td>
                              <td>
                                <h4>$<?php echo $data02['p_price']; ?></h4>
                              </td>
                              <td>
                                <h4><?php echo $data02['qty']; ?></h4>
                              </td>
                              <td>
                                <h4>
                                  $<?php echo $data02['p_price'] * $data02['qty']; ?></h4>
                              </td>


                              <td><?php echo processCode($data02['status']); ?></td>
                            </tr>
                          <?php $ptotal += $data02['p_price'] * $data02['qty'];
                          } ?>
                        </tbody>
                        <tfoot>
                          <tr>
                            <td colspan="7">累計:<?php echo $ptotal; ?></td>
                          </tr>
                          <tr>
                            <td colspan="7">運費:100</td>
                          </tr>
                          <tr>
                            <td colspan="7" class="color_red">總計:<?php echo $ptotal + 100; ?></td>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <hr>

            <?php $i++;
            } ?>
          </div>

        <?php } else { ?>
          <div class="alert alert-info" role="alert">
            抱歉!目前還沒有任何的訂單。
          </div>
        <?php  } ?>

      </div>
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
        $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "order_rs");
        ?>
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
          </ul>
        </nav>
      </div>
    </div>
  </div>

  <hr>

  <!--聯絡資訊-->
  <?php require_once("footer.php") ?>

</body>

</html>