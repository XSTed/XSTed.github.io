<?php require_once "session.php"; ?>
<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <?php require_once "header.php";
    ?>
    <title>AK CO. Product Practice Full Stack</title>
    <link rel="stylesheet" href="./static/css/product.css">
    <style>
        /* modal */
        .modalNoProduct {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            width: 100%;
            display: flex;
            flex-direction: column;
            min-height: 100px;
            justify-content: center;
            margin: 20px auto;
            max-width: 45rem;
            padding: 1rem;
            background-color: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 55px rgb(255, 255, 201);
            border-radius: 30px;
            border: 1px solid #525252;
            color: #1c1919;
            font-weight: 900;
            top:25%;
            text-align: center;
        }

        .closeNoProduct {
            font-size: 18px;
            letter-spacing: 2px;
            text-transform: uppercase;
            display: inline-block;
            text-align: center;
            font-weight: bold;
            padding: 0.7em 2em;
            border: 3px solid #00ddff;
            border-radius: 5px;
            position: relative;
            color: #000;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s ease all;
            z-index: 1;
            background-color: transparent;
        }

        .closeNoProduct:before {
            transition: 0.5s all ease;
            position: absolute;
            top: 0;
            left: 50%;
            right: 50%;
            bottom: 0;
            opacity: 0;
            content: '';
            background-color: #00ddff;
            z-index: -1;
        }

        .closeNoProduct:hover,
        .closeNoProduct:focus {
            color: white;
        }

        .closeNoProduct:hover:before,
        .closeNoProduct:focus:before {
            transition: 0.5s all ease;
            left: 0;
            right: 0;
            opacity: 1;
        }

        .closeNoProduct:active {
            transform: scale(0.9);
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
                <!-- 引入 -->
                <?php require_once("product_list.php"); ?>

            </div>
        </div>
    </div>

    <?php require_once "footer.php"; ?>
    <script>
        window.addEventListener('load', function() {
            const modalNoProduct = document.querySelector('.modalNoProduct');
            const closeNoProduct = document.querySelector('.closeNoProduct');

            modalNoProduct.style.display = 'block';

            closeNoProduct.addEventListener('click', function() {
                modalNoProduct.style.display = 'none';
            });
        });
    </script>
</body>

</html>