<?php require_once "session.php"; ?>
<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<!Doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁的標頭 -->
    <?php require_once("header.php"); ?>
    <title>AK CO Cart Practice Full Stack</title>
    <link rel="stylesheet" href="./static/css/product.css">
    <style type="text/css">
        /* 輸入有錯誤時，顯示紅框 */
        table input:invalid {
            border: solid red 3px;
        }

        table td {
            color: aliceblue;
            vertical-align: middle;
        }

        table .table-warning td {
            color: #555;
        }

        h3 {
            text-align: center;
            color: aliceblue;
        }

        .table-responsive-md table td {
            text-align: center;
        }

        .table-responsive-md table tfoot td {
            text-align: center;
        }

        .table-responsive-md table tr:hover {
            background-color: rgba(249, 249, 255, 0.21);
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

                <!-- 引入網頁的sidebar -->
                <?php require_once("sidebar.php"); ?>

            </div>

            <div class="col-md-10">

                <!-- 購物車內容模組 -->
                <?php require_once("cart_content.php"); ?>

            </div>
        </div>
    </div>

    <?php require_once "footer.php"; ?>

    <script type="text/javascript">
        //將變更的數量寫入後臺資料庫
        $("input").change(function() {
            let qty = $(this).val();
            const cartid = $(this).attr("cartid");
            if (qty <= 0 || qty >= 50) {
                alert("更改數量需大於0以上，以及小於50以下。");
                return false;
            }
            $.ajax({
                url: 'change_qty.php',
                type: 'post',
                dataType: 'json',
                data: {
                    cartid: cartid,
                    qty: qty,
                },
                success: function(data) {
                    if (data.c == true) {
                        // alert(data.m);
                        window.location.reload();
                    } else {
                        alert(data.m);
                    }
                },
                error: function(data) {
                    alert("系統目前無法連接到後台資料庫。");
                }
            });
        });
    </script>
</body>

</html>