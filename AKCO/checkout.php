<?php require_once "session.php"; ?>
<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<?php
if (!isset($_SESSION["Member"])) {
    $sPath = "login.php?sPath=checkout";
    header(sprintf("Location: %s", $sPath));
}
?>
<!Doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁的標頭 -->
    <?php require_once("header.php"); ?>
    <title>AK CO CheckOut Practice Full Stack</title>
    <link rel="stylesheet" href="./static/css/product.css">
    <style type="text/css">
        table.table td,
        table.table th {
            padding: 0.75rem;
            vertical-align: middle;
            border-bottom: none;
            color: aliceblue;
            vertical-align: middle;
        }

        /* 輸入有錯誤時，顯示紅框 */
        table input:invalid {
            border: solid red 3px;
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
            ;
        }

        .table-responsive-md table tfoot td {
            text-align: center;
        }

        .table-responsive-md table tr:hover {
            background-color: rgba(249, 249, 255, 0.21);
        }

        #exampleModal .recipientTbody td {
            color: #262626;
        }

        /* 11 */
        /* .btn-11 {
            border: none;
            background: linear-gradient(153deg, rgb(12, 0, 108) 0%, rgb(168, 210, 255) 100%);
            color: #fff;
            overflow: hidden;
            margin-top: -36px;
            transition: all 0.3s;
            box-shadow: 3px 3px 3px lightblue;
        }

        .btn-11:hover {
            text-decoration: none;
            color: #fff;
            background: linear-gradient(333deg, rgb(192, 252, 255) 0%, rgb(9, 0, 129) 100%);
            box-shadow: 1px 1px 1px lightblue;
        }

        .btn-11:before {
            position: absolute;
            content: '';
            display: inline-block;
            top: -180px;
            left: 0;
            width: 30px;
            height: 100%;
            background-color: #fff;
        }

        .btn-11:hover {
            opacity: .7;
        }

        .btn-11:active {
            box-shadow: 6px 6px 9px 0 rgba(255, 255, 255, .3),
                -6px -6px 9px 0 rgba(116, 125, 136, .2),
                inset -6px -6px 9px 0 rgba(255, 255, 255, .2),
                inset 6px 6px 9px 0 rgba(0, 0, 0, .2);
        } */

        .nav.nav-tabs {
            position: relative;
            top: -40px;
            left: 0px;
        }

        #myTabContent {
            position: relative;
            top: -30px;
            left: 12px;
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
                <?php
                //取得收件者地址資料
                $SQLstring = sprintf("SELECT *,city.Name AS ctName,town.Name AS toName FROM addbook,city,town WHERE MemberID='%d' AND setdefault='1' AND addbook.myzip=town.Post AND town.AutoNo=city.AutoNo", $_SESSION["MemberID"]);
                $conn = new Dbhandler();
                $addbook_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                if ($addbook_rs && $addbook_rs->num_rows != 0) {
                    $data = mysqli_fetch_assoc($addbook_rs);
                    $Username = $data['Username'];
                    $mobile = $data['mobile'];
                    $myzip = $data['myzip'];
                    $address = $data['address'];
                    $ctName = $data['ctName'];
                    $toName = $data['toName'];
                } else {
                    $Username = "";
                    $mobile =  "";
                    $myzip = "";
                    $address = "";
                    $ctName =  "";
                    $toName =  "";
                }
                ?>

                <h3>AK CO：會員<?php echo $_SESSION['Username']; ?>結帳</h3>
                <div class="row justify-content-center">
                    <div class="card col-md-5">
                        <h4 class="card-header" style="color:#007bff;"><i class="fas fa-truck fa-flip-horizontal me-1"></i>配送資訊</h4>
                        <div class="card-body pl-3 pt-3 pb-2">
                            <h4 class="card-title">收件人資訊：</h4>
                            <h5 class="card-title">姓名：<?php echo $Username; ?></h5>
                            <p class="card-text">電話：<?php echo $mobile; ?></p>
                            <p class="card-text">郵遞區號：<?php echo $myzip . $ctName . $toName; ?></p>
                            <p class="card-text">地址：<?php echo $address; ?></p>
                            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">選擇其他收件人</button>
                        </div>
                    </div>

                    <div class="card col-md-6 ms-3">
                        <div class="card-header" style="color:#000;"><i class="far fa-credit-card me-1"></i>付款方式訊</div>
                        <div class="card-body pl-3 pt-2 pb-2">
                            <!--  -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" style="color: #007bff !important; font-size: 14pt;">貨到付款</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" style="color: #007bff !important; font-size: 14pt;">信用卡</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false" style="color: #007bff !important; font-size: 14pt;">銀行轉帳</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" id="disabled-tab" href="#epay" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false" style="color: #007bff !important; font-size: 14pt;">電子支付</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                    <h4 class="card-title">收件人資訊：</h4>
                                    <h5 class="card-title">姓名：<?php echo $Username; ?></h5>
                                    <p class="card-text">電話：<?php echo $mobile; ?></p>
                                    <p class="card-text">郵遞區號：<?php echo $myzip . $ctName . $toName; ?></p>
                                    <p class="card-text">地址：<?php echo $address; ?></p>
                                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#staticBackdrop">選擇其他收件人</button>

                                </div>
                                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                                    <h4 class="card-title pt-3">選擇付款帳戶</h4>
                                    <table class="table">

                                        <thead>
                                            <tr>
                                                <th scope="col" width="5%">#</th>
                                                <th scope="col" width="25%">信用卡系統</th>
                                                <th scope="col" width="35%">發卡銀行</th>
                                                <th scope="col" width="35%">信用卡號</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><input type="radio" name="creditCard" id="creditCard[]" checked /></th>
                                                <td><img src="images/Visa_Inc._logo.svg" alt="visa" class="img-fluid"></td>
                                                <td>玉山商業銀行</td>
                                                <td>1234 ****</td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><input type="radio" name="creditCard" id="creditCard[]" /></th>
                                                <td><img src="images/MasterCard_Logo.svg" alt="master" class="img-fluid"></td>
                                                <td>玉山商業銀行</td>
                                                <td>1234 ****</td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><input type="radio" name="creditCard" id="creditCard[]" /></th>
                                                <td><img src="images/UnionPay_logo.svg" alt="unionpay" class="img-fluid"></td>
                                                <td>玉山商業銀行</td>
                                                <td>1234 ****</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <hr>
                                    <button type="button" class="btn btn-outline-success">使用新信用卡付款</button>
                                </div>
                                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                                    <h4 class="card-title pt-3">ATM匯款資訊：</h4>
                                    <img src="images/Cathay-bk-rgb-db.svg" alt="cathay" class="img-fluid">
                                    <h5 class="card-title">title匯款銀行：國泰世華銀行 銀行代碼：013</h5>
                                    <h5 class="card-title">姓名：馬斯克</h5>
                                    <p class="card-text">匯款帳號：1234-4567-7890-1234</p>
                                    <p class="card-text">備註：匯款完成後，需要1、2個工作天，待系統入款完成後，將以簡訊通知訂單完成付款。</p>
                                </div>
                                <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
                                    <h4 class="card-title pt-3">選擇電子支付方式：</h4>
                                    <table class="table">

                                        <thead>
                                            <tr>
                                                <th scope="col" width="5%">#</th>
                                                <th scope="col" width="25%">電子支付系統</th>
                                                <th scope="col" width="70%">電子支付公司</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><input type="radio" name="epay" id="epay[]" checked /></th>
                                                <td><img src="images/Apple_Pay_logo.svg" alt="applepay" class="img-fluid"></td>
                                                <td>Apple Pay</td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><input type="radio" name="epay" id="epay[]" /></th>
                                                <td><img src="images/Line_pay_logo.svg" alt="linepay" class="img-fluid"></td>
                                                <td>Line Pay</td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><input type="radio" name="epay" id="epay[]" /></th>
                                                <td><img src="images/JKOPAY_logo.svg" alt="jkopay" class="img-fluid"></td>
                                                <td>JKOPAY</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- 建立購物車資料查詢 -->
                <?php
                $SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND orderid IS NULL AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product_img.sort=1 ORDER BY cartid DESC";
                $conn = new Dbhandler();
                $cart_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                $ptotal = 0; //設定累加的變數，初始為0
                ?>
                <div class="table-responsive-md" style="width: 100%;">
                    <table class="table table-hover mt-3">
                        <thead>
                            <tr class="table-dark" style="color: white;">
                                <td width="10%">產品編號</td>
                                <td width="10%">圖片</td>
                                <td width="20%">名稱</td>
                                <td width="10%">規格</td>
                                <td width="15%">價格</td>
                                <td width="15%">數量</td>
                                <td width="20%">小計</td>
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
                                        <h4><?php echo $cart_data['qty']; ?></h4>
                                    </td>
                                    <td>
                                        <h4 class="pt-1">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></h4>
                                    </td>
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
                            <tr>
                                <td colspan="7">
                                    <button type="button" id="btn04" name="btn04" class="btn-11">
                                        <i class="fas fa-cart-arrow-down pr-2"></i>確認結帳
                                    </button>
                                    <button type="button" id="btn-05" name="btn-05" class="btn-11" onclick="window.history.go(-1)">
                                        <i class="fas fa-undo-alt pr-2"></i>回上一頁
                                    </button>
                                </td>
                            </tr>
                        </tfoot>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <?php require_once "footer.php"; ?>
    <?php
    //取得所有收件人資料
    $SQLstring = sprintf("SELECT *,city.Name AS ctName,town.Name AS toName FROM addbook,city,town WHERE MemberID='%d' AND addbook.myzip=town.Post AND town.AutoNo=city.AutoNo", $_SESSION["MemberID"]);
    $conn = new Dbhandler();
    $addbook_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
    ?>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">收件人資訊：</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="row">
                            <div class="col">
                                <input type="text" name="Username" id="Username" class="form-control" placeholder="收件者姓名">
                            </div>
                            <div class="col">
                                <input type="number" name="mobile" id="mobile" class="form-control" placeholder="收件者電話">
                            </div>
                            <div class="col">
                                <select name="myCity" id="myCity" class="form-control">
                                    <option value="">請選擇市區</option>
                                    <?php $city = "SELECT * FROM `city` WHERE STATE=0";
                                    $city_rs = $conn->conn()->query($city) or die($conn->conn()->error);
                                    while ($city_rows = mysqli_fetch_assoc($city_rs)) { ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col">
                                <select name="myTown" id="myTown" class="form-control">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="hidden" name="myzip" id="myzip" value="">
                                <label for="address" id="add_label" name="add_label">郵遞區號：</label>
                                <input type="text" name="address" id="address" class="form-control" placeholder="地址">
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-center">
                            <div class="col-auto">
                                <button type="button" class="btn btn-success" id="recipient" name="recipient">新增收件人
                                </button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <div class="row">
                        <table class="table">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">收件者姓名</th>
                                    <th scope="col">電話</th>
                                    <th scope="col">地址</th>
                                </tr>
                            </thead>
                            <tbody class="recipientTbody">
                                <?php while ($data = mysqli_fetch_assoc($addbook_rs)) { ?>
                                    <tr>
                                        <th scope="row"><input type="radio" name="gridRadios" id="gridRadios[]" value="<?php echo $data['addressid'] ?>" <?php echo ($data['setdefault']) ? 'checked' : ''; ?>></th>
                                        <td><?php echo $data['Username']; ?></td>
                                        <td><?php echo $data['mobile']; ?></td>
                                        <td><?php echo $data['myzip'] . $data['ctName'] . $data['toName'] . $data['address']; ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="loading" name="loading" style="display: none; position: fixed;width: 100%;height: 100%;top: 0;left: 0;background-color: rgba(255,255,255,0.5);z-index: 9999;"> <i class="fas fa-spinner fa-spin fa-5x fa-fw" style="position: absolute;top: 50%;left: 50%;"></i></div>


    <script type="text/javascript">
        $(function() {
            //系統進行結帳處理
            $('#btn04').click(function() {
                const msg = "系統將進行結帳處理，請確認產品金額與收件人是否正確！";
                if (!confirm(msg)) {
                    return false;
                }
                $("#loading").show();
                const addressid = $('input[name=gridRadios]:checked').val();
                $.ajax({
                    url: 'addorder.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.href = "index.php";
                        } else {
                            alert("Database response error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                })
            });
            $('input[name=gridRadios]').change(function() {
                const addressid = $(this).val();
                $.ajax({
                    url: 'changeaddr.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database response error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                })
            });
            $('#recipient').click(function() {
                let validate = 0,
                    msg = "";
                const Username = $("#Username").val();
                const mobile = $("#mobile").val();
                const myzip = $("#myzip").val();
                const address = $("#address").val();
                if (Username == "") {
                    msg = msg + "收件人不得為空白!;\n";
                    validate = 1;
                }
                if (mobile == "") {
                    msg = msg + "電話不得為空白!;\n";
                    validate = 1;
                }
                if (myzip == "") {
                    msg = msg + "郵遞區號不得為空白!;\n";
                    validate = 1;
                }
                if (address == "") {
                    msg = msg + "地址不得為空白!;\n";
                    validate = 1;
                }
                if (validate) {
                    alert(msg);
                    return false;
                }
                $.ajax({
                    url: 'addbook.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        Username: Username,
                        mobile: mobile,
                        myzip: myzip,
                        address: address,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database response error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                })
            });
            //取得縣市碼後查詢鄉鎮市名稱放入#myTown
            $("#myCity").change(function() {
                let CNo = $('#myCity').val();
                if (CNo == "") {
                    return false;
                }
                $.ajax({ //將鄉鎮市的名稱從後台資料庫取回
                    url: 'Town_ajax.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        CNo: CNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myTown').html(data.m);
                        } else {
                            alert("Database response error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //選鄉鎮市後，查詢郵遞區號放入#myZip,#add_label
            $("#myTown").change(function() {
                let AutoNo = $('#myTown').val();
                if (AutoNo == "") {
                    $('#myzip').val("");
                    $('#add_label').html("");
                    return false;
                }
                $.ajax({ //將鄉鎮市的名稱從後台資料庫取回
                    url: 'Zip_ajax.php',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        AutoNo: AutoNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myzip').val(data.Post);
                            $('#add_label').html('郵遞區號：' + data.Post + data.Cityname + data.Name);
                        } else {
                            alert("Database response error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
        })
    </script>
</body>

</html>