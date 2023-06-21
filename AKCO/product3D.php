<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<!DOCTYPE html>
<html>

<head>
    <title>Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <?php require_once "header.php";
    //require_once //"includes/product_catalogue.inc.php";
    ?>
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            background-color: #000000;
            margin: 0;
            font-family: Helvetica, sans-serif;
            ;
            overflow: hidden;
        }

        a {
            color: #ffffff;
        }

        #menu {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
        }

        .element {
            width: 120px;
            height: 160px;
            box-shadow: 0px 0px 12px rgba(0, 255, 255, 0.5);
            border: 1px solid rgba(127, 255, 255, 0.25);
            text-align: center;
            cursor: default;

        }

        .element:hover {
            box-shadow: 0px 0px 12px rgba(0, 255, 255, 0.75);
            border: 1px solid rgba(127, 255, 255, 0.75);
            backdrop-filter: blur(16px);
        }

        .element .number {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 12px;
            color: rgba(127, 255, 255, 0.75);
        }

        .element .symbol {
            position: absolute;
            top: 40px;
            left: 0px;
            right: 0px;
            width: 100%;
            height: 100px;
            /* font-size: 60px; */
            /* font-weight: bold; */
            /* color: rgba(255, 255, 255, 0.75); */
            /* text-shadow: 0 0 10px rgba(0, 255, 255, 0.95); */
        }

        .element .details {
            position: absolute;
            bottom: 15px;
            left: 0px;
            right: 0px;
            font-size: 12px;
            color: rgba(127, 255, 255, 0.75);
        }

        button {
            color: rgba(127, 255, 255, 0.75);
            background: transparent;
            outline: 1px solid rgba(127, 255, 255, 0.75);
            border: 0px;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
        }

        button:hover {
            background-color: rgba(0, 255, 255, 0.5);
        }

        button:active {
            color: #000000;
            background-color: rgba(0, 255, 255, 0.75);
        }

        .accordion-button {
            font-size: 1.5vw;
        }

        .accordion-body table td:hover {
            background-color: rgba(0, 255, 255, 0.75);
        }

        .accordion-body {
            padding: 0px;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <!-- 引入網頁的sidebar -->
                <?php require_once("sidebar.php"); ?>
            </div>

            <div class="col-md-10">

                <!--      
<div id="containerProd"></div>

<div id="menu">
    <button id="table">TABLE</button>
    <button id="sphere">SPHERE</button>
    <button id="helix">HELIX</button>
    <button id="grid">GRID</button> 
</div>
-->

                <!-- 引入 -->
                <?php require_once("product_list01.php"); ?>
            </div>
        </div>
    </div>

    <?php require_once "footer.php"; ?>
    <script src="./lib/three.js"></script>
    <script src="./lib/Tween.min.js"></script>
    <script src="./lib/controls/TrackballControls.js"></script>
    <script src="./lib/renderers/CSS3DRenderer.js"></script>
    <script src="./main.js"></script>

</body>

</html>