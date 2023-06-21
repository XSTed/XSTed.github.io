<!--If you want to add background image add it to the class below 
        https://stackoverflow.com/questions/59221306/bootstrap-navbar-logo-in-the-center-and-items-to-the-left-und-right-->
<!-- header -->
<div class="l2d_xb">
    <div class="l2d">
        <div class="l2d-text" style="display: block; opacity: 0.0244717;"></div>
        <canvas id="live2d" width="220" height="250" class="live2d"></canvas>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <!-- navBar -->
            <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-transparent">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <?php
                    //讀取後台購物車內產品數量
                    $SQLstring = "SELECT * FROM cart WHERE orderid IS NULL AND ip='" . $_SERVER['REMOTE_ADDR'] . "'";
                    $conn = new Dbhandler();
                    $cart_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                    ?>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav justify-content-center mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link animate" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    站長推薦<span></span><span></span><span></span><span></span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link animate" href="product.php">服務說明<span></span><span></span><span></span><span></span></a>
                            </li>
                            <?php
                            if (isset($_SESSION["Member"])) {
                                if ($privilegeLevel == 1) {
                                    echo ("<li class='nav-item'><a class='admin admin_manage_users admin_view_orders' href='admin.php' target='_blank'>Admin Panel</a></li>");
                                    echo ("
                                    <li class='nav-item'><a class='manage_profile animate' href='manage_profile.php?email=$email'>管理個人資料<span></span><span></span><span></span><span></span></a></li>
                                    <li class='nav-item'><a href='includes/logout.inc.php'>登出<span></span><span></span><span></span><span></span></a></li>
                                    <li class='nav-item'>
                                        <a class='cart animate' href='cart.php?member_id=$memberID'>
                                        購物車<span></span><span></span><span></span><span></span>
                                        <span class='new badge unglow' id='cart_badge'>$orderItemCount</span></a>
                                    </li>
                                        ");
                                } else {
                                    echo ("
                                    <li class='nav-item'><a class='nav-link animate' href='manage_profile.php'>管理個人資料<span></span><span></span><span></span><span></span></a></li>
                                    <li class='nav-item'><a class='nav-link animate' href='orderlist.php'>查詢訂單<span></span><span></span><span></span><span></span></a></li>
                                    <li class='nav-item dropdown' style='position: absolute; left: 60%;list-style:none;'>
                                        <a class='nav-link dropdown-toggle' href='#' role='button' data-bs-toggle='dropdown' aria-expanded='false'>
                                            <img src='product_img/avatar.jpg' alt='' style='width:60px;height:60px;border-radius:50%;'>
                                        </a>
                                        <ul class='dropdown-menu dropdown-menu-dark'>
                                            <li><a class='dropdown-item' href='index.php'>回首頁</a></li>
                                            <li><a class='dropdown-item' href='manage_profile.php'>基本資料</a></li>
                                            <li><a class='dropdown-item' href='includes/logout.inc.php'>登出</a></li>
                                        </ul>
                                    </li>
                                        ");
                                }  //first enter nav below
                            } else {
                                echo (" 
                                    <li class='nav-item'>
                                        <a class='nav-link animate' href='login.php'>登入<span></span><span></span><span></span><span></span></a>
                                    </li>
                                    <li class='nav-item'>
                                        <a class='nav-link animate' href='signup.php'>註冊<span></span><span></span><span></span><span></span></a>
                                    </li>
                                    
                                ");
                            }
                            ?>
                            <li class="nav-item">
                                <a class="nav-link animate" href="cart.php">購物車
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span class="badge text-bg-info"><?php echo $cart_rs ? $cart_rs->num_rows : ""; ?></span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="navbar-brand" href="index.php">
                                    <img src="product_img/navlogo.png" alt="LOGO" class="navlogo img-fluid"><!-- logo img -->
                                </a>
                            </li>
                            <!-- Search bar on the right -->
                            <form class="d-flex" style="position: absolute; right: 0;" role="search">
                                <input class="form-control search" type="search" placeholder="Search" style="z-index: 9999;" value="<?php if (isset($_GET["query"])) echo ($_GET["query"]); ?>">
                                <button class="btn-search coolColor" style="position:absolute;top:30% !important;left:78% !important;" type="submit" value="<?php if (isset($_GET["query"])) echo ($_GET["query"]); ?>">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                        </ul>
                    </div>

            </nav>
        </div>
    </div>
</div>