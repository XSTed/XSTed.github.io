<?php require_once "session.php"; ?>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
  <?php require_once "header.php"; ?>
  <title>AK CO. Log In</title>
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
              <h1 class="coolColor" data-text="登入">登入</h1>
            </div>
            <div class="parallax-layer layer-6"></div>
            <div class="parallax-layer layer-5"></div>
            <div class="parallax-layer layer-4"></div>
            <div class="parallax-layer sportsCar-1"></div>
            <div class="parallax-layer sportsCar-2"></div>
            <div class="parallax-layer layer-1"></div>
          </div>
        </div>
        <form id="login" name="login" method="POST" action="includes/login.inc.php" style="position:absolute;top:100px;">
          <div class="account">
            <div class="inputBox" style="margin-bottom: 10px;">
              <input type="text" name="username" id="username" class="form-input" required autofocus>
              <label for="username" class="form-label">請輸入您的名稱:</label>
            </div>
            <div class="inputBox" style="margin-bottom: 30px;">
              <input type="password" name="pwd" id="pwd" class="form-input">
              <label for="password" class="form-label">請輸入您的密碼:</label>
            </div>
            <div class="inputBox">
              <input type="submit" value="登入" name="submit" id="btn">
            </div>

            <div class="group">
              <a href="signup.php">還不是會員? 註冊!</a>
            </div>

            <div class="group">
              <a href="#">忘記密碼</a>
            </div>
            <div class="errorMessage">
              <?php
              if (isset($_GET["error"])) {
                if ($_GET["error"] == "empty_input")
                  echo "<p>*請填寫全部欄位!</p>";
                else if ($_GET["error"] == "WrongLogin")
                  echo "<p>*驗證錯誤!</p>";
                else if ($_GET["error"] == "usernotfound")
                  echo "<p>*使用者不存在!</p>";
                else if ($_GET["error"] == "stmtfailed")
                  echo "<p>*請稍後再試!!!</p>";
                else if ($_GET["error"] == "attemptReached")
                  echo "<p>*登入失敗超過3次!!!<br>請15秒後再次輸入.</p>";
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
    $(document).ready(function() {
      const $input = $('.form-input');

      $input.focusout(function() {
        if ($(this).val().length > 0) {
          $(this).addClass('input-focus');
          $(this).next('.form-label').addClass('input-focus-label');
        } else {
          $(this).removeClass('input-focus');
          $(this).next('.form-label').removeClass('input-focus-label');
        }
      });
    });
    $(function() {
      //驗證form #reg表單
      $('#login').validate({
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
          pwd: {
            required: true,
            maxlength: 20,
            minlength: 8,
          },
        },
        messages: {
          username: {
            required: '使用者名稱不得為空白',
            maxlength: '使用者名稱最大長度為20位(6-20位英文字母與數字的組合)',
            minlength: '使用者名稱最小長度為6位(6-20位英文字母與數字的組合)',
          },
          pwd: {
            required: '密碼不得為空白',
            maxlength: '密碼最大長度為20位(8-20位英文字母與數字的組合)',
            minlength: '密碼最小長度為8位(8-20位英文字母與數字的組合)',
          },
        },
      });
    });
  </script>
</body>

</html>