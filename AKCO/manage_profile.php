<?php require_once "session.php"; ?>
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
  <?php include "header.php"; ?>
  <title>AK CO.管理帳戶</title>
  <link rel="stylesheet" href="static/css/account.css">
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
              <h1 class="coolColor" data-text="管理個人資料">管理個人資料</h1>
            </div>
            <div class="parallax-layer layer-6"></div>
            <div class="parallax-layer layer-5"></div>
            <div class="parallax-layer layer-4"></div>
            <div class="parallax-layer sportsCar-1"></div>
            <div class="parallax-layer sportsCar-2"></div>
            <div class="parallax-layer layer-1"></div>
          </div>
        </div>

        <form method="POST" action="includes/manage_profile.inc.php" id="updateProfile" name="updateProfile">

          <div class="account">
            <div class="inputBox">
              <input minlength="5" maxlength="12" name="username" id="username" type="text" class="form-input" />
              <label for="username" class="form-label">請輸入您的新名稱:</label>

            </div>

            <div class="inputBox">
              <input name="email" id="email" type="email" class="form-input" />
              <label for="email" class="form-label">請輸入您的新信箱:</label>
            </div>

            <div class="inputBox">
              <input type="password" name="pwd" id="pwd" class="form-input">
              <label for="password" class="form-label">請輸入您的密碼:</label>
            </div>

            <div class="inputBox">
              <input type="password" name="repeat_pwd" id="repeat_pwd" maxlength="21" class="form-input">
              <label for="password" class="form-label">請再次確認您的密碼:</label>
            </div>
            <input name="id" type="hidden" class="form-input" value="$memberID" />
            <button type="submit" class="btn">更新帳號資料</button>
            <div class="errorMessage">
              <?php
              if (isset($_GET["error"])) {
                if ($_GET["error"] == "empty_input")
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '*請填寫全部欄位!';</script>";

                else if ($_GET["error"] == "invalid_uid")
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '*請選擇適當的使用者名稱!';</script>";

                else if ($_GET["error"] == "passwords_dont_match")
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '*密碼不相同!';</script>";

                else if ($_GET["error"] == "stmtfailed")
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '*請稍後再試!!!';</script>";

                else if ($_GET["error"] == "username_taken")
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '*使用者名稱 已被使用過!';</script>";

                else if ($_GET["error"] == "none") {
                  echo "<script>document.querySelector('.errorMessage').className = 'green-text';</script>";
                  echo "<script>document.querySelector('.errorMessage').innerHTML = '個人資料已更新!';</script>";
                }
              }
              ?>
            </div>

          </div>
        </form>
    </div>
  </div>
  </div>
  <?php include "footer.php"; ?>
</body>

<script>
  function fade_in() {
    $("#errormsg").fadeIn().delay(2500).fadeOut();
  }
  $(function() {
    //驗證form #reg表單
    $('#updateProfile').validate({
      errorPlacement: function(error, element) {
        const container = $('<div>').addClass('error-container');
        container.append(error);
        element.after(container);
      },
      rules: {
        username: {
          required: true,
          maxlength: 20,
          minlength: 6,
        },
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
      },
      messages: {
        username: {
          required: '使用者名稱不得為空白',
          maxlength: '使用者名稱最大長度為20位(6-20位英文字母與數字的組合)',
          minlength: '使用者名稱最小長度為6位(6-20位英文字母與數字的組合)',
        },
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
      },
    });
  });
</script>

</html>