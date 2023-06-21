<?php require_once "session.php"; ?>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <?php require_once "header.php"; ?>
    <title>AK CO. Sign Up</title>
    <link rel="stylesheet" href="./static/css/account.css">
    <script type="text/javascript" src="./static/commlib.js"></script>
    <style>
        .input-group>.form-control {
            width: 100%;
        }

        span.error-tips,
        span.error-tips::before {
            font-family: "Font Awesome 5 Free";
            color: red;
            font-weight: 900;
            content: "\f00d";
        }

        span.valid-tips,
        span.valid-tips::before {
            font-family: "Font Awesome 5 Free";
            color: greenyellow;
            font-weight: 900;
            content: "\f00c";
        }

        .error-container {
            position: relative;
            top: -35px;
            left: 205px;
        }
    </style>
</head>

<body>
    <?php require_once "navBar.php"; ?>

    <div class="container-fluid">
        <div class="row">

            <section id="parallaxSection">
                <div class="parallaxContainer">
                    <div class="hero">
                        <div class="accountText">
                            <h1 class="coolColor" data-text="註冊" style="top:-6px;">註冊</h1>
                        </div>
                        <div class="parallax-layer layer-6"></div>
                        <div class="parallax-layer layer-5"></div>
                        <div class="parallax-layer layer-4"></div>
                        <div class="parallax-layer sportsCar-1"></div>
                        <div class="parallax-layer sportsCar-2"></div>
                        <div class="parallax-layer layer-1"></div>
                    </div>
                </div>
                <form id="signup" name="signup" method="POST" action="includes/signup.inc.php">
                    <div class="account">
                        <div class="inputBox">
                            <input type="text" name="username" id="username" class="form-input">
                            <label for="username" style="z-index: -9999;" class="form-label">請輸入您的名稱</label>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="pwd" id="pwd" class="form-input">
                            <label for="password" style="z-index: -9999;" class="form-label">請輸入您的密碼</label>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="repeat_pwd" id="repeat_pwd" maxlength="21" class="form-input">
                            <label for="password" style="z-index: -9999;" class="form-label">請再次確認您的密碼</label>
                        </div>
                        <div class="inputBox">
                            <input type="email" name="email" id="email" maxlength="30" class="form-input">
                            <label for="email" style="z-index: -9999;" class="form-label">請輸入您的信箱</label>
                        </div>
                        <div class="inputBox">
                            <input type="text" class="form-input" id="mobile" name="mobile" class="form-input">
                            <label for="mobile" style="z-index: -9999;" class="form-label">請輸入您的手機號碼</label>
                        </div>
                        <div class="inputBox">
                            <select name="myCity" id="myCity" class="form-control" style="width: 183px;height: 42px;top: 18px;">
                                <option value="">請選擇市區</option>
                                <?php $city = "SELECT * FROM `city` WHERE STATE=0";
                                $conn = new Dbhandler();
                                $city_rs = $conn->conn()->query($city);
                                while ($city_rows = mysqli_fetch_assoc($city_rs)) { ?>
                                    <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
                                <?php } ?>
                            </select>
                            <select name="myTown" id="myTown" class="form-control" style="width: 183px;height: 42px;top: -24px;left: 186px;">
                                <option value="">請選擇地區</option>
                            </select>
                            <label for="address" class="form-label" id="zipcode" name="zipcode" style="position:absolute;top:60px;">郵遞區號：地址</label>
                        </div>
                        <div class="inputBox">
                            <input type="hidden" id="myZip" name="myZip" value="" />
                            <input type="text"  class="form-input" id="address" name="address" class="form-input"  placeholder="請輸入後續地址">
                        </div>
                        <div class="inputBox" style="height: 120px;">
                            <input type="hidden" id="captcha" name="captcha" value="" />
                            <a href="javascript:void(0);" title="按我更新認證碼" onclick="getCaptcha();"><canvas id="can"></canvas></a>
                            <input type="text" class="form-control" id="recaptcha" name="recaptcha">
                            <label for="recaptcha" style="z-index: -9999;" class="form-label">請輸入認證碼</label>
                        </div>
                        <div class="inputBox">
                            <input type="submit" value="註冊" name="submit">
                        </div>
                        <div class="group">
                            <a href="login.php">已是會員? 登入!</a>
                            <input type="hidden" name="Authcode" id="Authcode" value="<?php echo $authcode = substr(md5(uniqid(rand())), 0, 8); ?>">
                        </div>
                        <div class="errorMessage">
                            <?php
                            if (isset($_GET["error"])) {
                                if ($_GET["error"] == "empty_input")
                                    echo "<p>*請填寫全部欄位!<p>";

                                else if ($_GET["error"] == "invalid_uid")
                                    echo "<p>*請選擇適當的使用者名稱!</p>";

                                else if ($_GET["error"] == "passwords_dont_match")
                                    echo "<p>*密碼不相同!</p>";

                                else if ($_GET["error"] == "username_taken")
                                    echo "<p>*使用者名稱/信箱 已被使用過!</p>";

                                else if ($_GET["error"] == "none")
                                    echo "<p class='green-text bold'>註冊成功! 請前往登入頁面</p>";
                                echo '<META HTTP-EQUIV="Refresh" Content="2; URL=signup.php">';
                                exit();
                            }
                            ?>
                        </div>

                    </div>
                </form>
            </section>

        </div>
    </div>
    <?php require_once "footer.php"; ?>
    <script type="text/javascript" src="./static/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            const $input = $('.form-input');

            $input.focusout(function () {
                if ($(this).val().length > 0) {
                    $(this).addClass('input-focus');
                    $(this).next('.form-label').addClass('input-focus-label');
                }
                else {
                    $(this).removeClass('input-focus');
                    $(this).next('.form-label').removeClass('input-focus-label');
                }
            });
        });
        $(function() {
            //自訂身分證格式驗證
            jQuery.validator.addMethod("tssn", function(value, element, param) {
                const tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
                return this.optional(element) || (tssn.test(value));
            });
            //自訂手機格式驗證
            jQuery.validator.addMethod("checkphone", function(value, element, param) {
                const checkphone = /^[0]{1}[9]{1}[0-9]{8}$/;
                return this.optional(element) || (checkphone.test(value));
            });
            //自訂郵遞區號格式驗證
            jQuery.validator.addMethod("checkMyTown", function(value, element, param) {
                return (value !== "");
            });
            //圖片上傳處理
            $('#uploadForm').click(function(e) {
                let fileName = $('#fileToUpload').val();
                let idxDot = fileName.lastIndexOf(".") + 1;
                let extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "gif") {
                    $("#progress-div01").css("display", "flex");
                    let file1 = getId("fileToUpload").files[0];
                    let formdata = new FormData();
                    formdata.append("file1", file1);
                    const ajax = new XMLHttpRequest();
                    ajax.upload.addEventListener("progress", progressHandler, false);
                    ajax.addEventListener("load", completeHandler, false);
                    ajax.addEventListener("error", errorHandler, false);
                    ajax.addEventListener("abort", abortHandler, false);
                    ajax.open("POST", "file_upload_parser.php");
                    ajax.send(formdata);
                    return false;
                } else {
                    alert("目前只支援jpg,jpeg,png,gif檔案格式上傳!");
                }
            });
            getCaptcha();
            $("#myCity").change(function() {
                let CNo = $('#myCity').val();
                if (CNo === "") {
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
                            $('#myZip').val("");
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫");
                    }
                });
            });
            //取得鄉鎮市代碼，查詢郵遞區號放入#myZip,#zipcode
            $("#myTown").change(function() {
                let AutoNo = $('#myTown').val();
                if (AutoNo === "") {
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
                            $('#myZip').val(data.Post);
                            $('#zipcode').html(data.Post + data.Cityname + data.Name);
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫");
                    }
                });
            });
        });
        //設定認證碼產生函數
        function getCaptcha() {
            let inputTxt = document.getElementById("captcha");
            //can為canvas的ID名稱
            //150=影像寬，50=影像高，blue=影像背景顏色
            //white=文字顏色，28px=文字大小，5=認證碼長度
            inputTxt.value = captchaCode("can", 150, 50, "blue", "white", "28px", 5);
        }
        //取得元件Id
        function getId(el) {
            return document.getElementById(el);
        }
        //上傳過程顯示%百分比
        function progressHandler(e) {
            let percent = Math.round(e.loaded / e.total) * 100;
            $("#progress-bar01").css("width", percent + "%");
            $("#progress-bar01").html(percent + "%");
        }
        //上傳完成處理顯示圖片
        function completeHandler(e) {
            let data = JSON.parse(e.target.responseText);
            if (data.success == 'true') {
                $('#uploadname').val(data.filename);
                $('#showimg').attr({
                    'src': 'uploads/' + data.filename,
                    'style': 'display:block;'
                });
                $('button.btn.btn-danger').attr({
                    'style': 'display:none;'
                });
            } else {
                alert(data.error);
            }
        }
        //Upload Failed:上傳發生錯誤處理
        function errorHandler(e) {
            alert("Upload Failed:上傳發生錯誤");
        }
        //Upload Aborted:上傳作業取消處理
        function abortHandler(e) {
            alert("Upload Aborted:上傳作業取消");
        }
        //驗證form #reg表單
        $('#signup').validate({
            errorPlacement: function(error, element) {
                const container = $('<div>').addClass('error-container');
                container.append(error);
                element.after(container);
            },
            rules: {
                email: {
                    required: true,
                    email: true,
                    remote: 'checkemail.php',
                },
                pwd: {
                    required: true,
                    maxlength: 20,
                    minlength: 8,
                },
                repeat_pwd: {
                    required: true,
                    equalTo: '#pwd',
                },
                username: {
                    required: true,
                    maxlength: 20,
                    minlength: 6,
                },
                tssn: {
                    required: true,
                    tssn: true,
                },
                birthday: {
                    required: true,
                },
                mobile: {
                    required: true,
                    checkphone: true,
                },
                address: {
                    required: true,
                },
                myTown: {
                    checkMyTown: true,
                },
                recaptcha: {
                    required: true,
                    equalTo: '#captcha',
                },
            },
            messages: {
                email: {
                    required: 'email信箱不得為空白',
                    email: 'email信箱格式有誤',
                    remote: 'email信箱已經註冊'
                },
                pwd: {
                    required: '密碼不得為空白',
                    maxlength: '密碼最大長度為20位(8-20位英文字母與數字的組合)',
                    minlength: '密碼最小長度為8位(8-20位英文字母與數字的組合)',
                },
                repeat_pwd: {
                    required: '確認密碼不得為空白',
                    equalTo: '兩次輸入的密碼必須一致！',
                },
                username: {
                    required: '使用者名稱不得為空白',
                    maxlength: '使用者名稱最大長度為20位(6-20位英文字母與數字的組合)',
                    minlength: '使用者名稱最小長度為6位(6-20位英文字母與數字的組合)',
                },
                tssn: {
                    required: '身份證ID不得為空白',
                    tssn: '身份證ID格式有誤',
                },
                birthday: {
                    required: '生日不得為空白!!',
                },
                mobile: {
                    required: '手機號碼不得為空白!!',
                    checkphone: '手機號碼格式有誤',
                },
                address: {
                    required: '地址不得為空白!!',
                },
                myTown: {
                    checkMyTown: '需選擇郵遞區號',
                },
                recaptcha: {
                    required: '驗證碼不得為空白!!',
                    equalTo: '驗證碼需相同!!',
                },
            },
        });
    </script>
</body>

</html>