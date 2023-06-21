<?php require_once "session.php"; ?>
<!-- 載入共用PHP函數庫 -->
<?php require_once("php_lib.php") ?>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <?php require_once "header.php";?>
    <title>AK CO. Product Practice Full Stack</title>
    <link rel="stylesheet" href="./static/css/productContent.css">
    <link rel="stylesheet" href="fancybox-2.1.7/source/jquery.fancybox.css">
    <style>
        .rgb {
            font-size: 1rem;
            font-family: Arial, Helvetica, sans-serif;
            letter-spacing: 0.3rem;
            animation: rgb 3s linear infinite, Breat 9s linear infinite;
            padding: 6px 0 6px 6px;
            border: 1px solid white;
            text-decoration: none;
            margin: 0 1rem;
        }

        @keyframes rgb {

            0%,
            100% {
                text-shadow: 0px 0px 1rem #ff0000ff, 0px 0px 5rem #ff000099;
            }

            33% {
                text-shadow: 0px 0px 1rem #00ff00ff, 0px 0px 5rem #00ff0099;
            }

            66% {
                text-shadow: 0px 0px 1rem #0000ffff, 0px 0px 5rem #0000ff99;
            }
        }

        @keyframes Breat {

            0%,
            100% {
                box-shadow: 0px 0px 1rem #ff0000ff, 0px 0px 5rem #ff000099, inset 0px 0px 1rem #ff0000ff, inset 0px 0px 5rem #ff000099;
            }

            12.5% {
                box-shadow: 0px 0px 1rem #ffFF00ff, 0px 0px 1rem #ffFF0099, inset 0px 0px 1rem #ffFF00ff, inset 0px 0px 1rem #ffFF0099;
            }

            33% {
                box-shadow: 0px 0px 1rem #00ff00ff, 0px 0px 5rem #00ff0099, inset 0px 0px 1rem #00ff00ff, inset 0px 0px 5rem #00ff0099;
            }

            45.5% {
                box-shadow: 0px 0px 1rem #00FFFFFF, 0px 0px 1rem #00FFFF99, inset 0px 0px 1rem #00FFFFFF, inset 0px 0px 1rem #00FFFF99;
            }

            66% {
                box-shadow: 0px 0px 1rem #0000ffff, 0px 0px 5rem #0000ff99, inset 0px 0px 1rem #0000ffff, inset 0px 0px 5rem #0000ff99;
            }

            78.5% {
                box-shadow: 0px 0px 1rem #FF00FFFF, 0px 0px 1rem #FF00FF99, inset 0px 0px 1rem #FF00FFFF, inset 0px 0px 1rem #FF00FF99;
            }
        }
    </style>
</head>

<body>
    <?php require_once "navBar.php"; ?>

    <body>
        <div class="xtx-wrapper">
            <div class="container-fluid">
                <?php
                $level1Open = "";
                $level2Open = "";
                $level3Open = "";
                if (isset($_GET['p_id']) && $_GET['p_id'] != "") {
                    //使用p_id產品代碼取出資料
                    //處理第一層
                    $SQLstring = sprintf("SELECT * FROM product,pyclass,(SELECT classid as upclassid,level as uplevel,cname as upcname FROM pyclass WHERE level=1) as uplevel WHERE product.classid=pyclass.classid AND pyclass.uplink=uplevel.upclassid AND product.p_id=%d", $_GET['p_id']);
                    $conn = new Dbhandler();
                    $classid_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                    $data = mysqli_fetch_assoc($classid_rs);
                    $level1Cname = $data['upcname'];
                    $level1Upclassid = $data['upclassid'];
                    $level1 = $data['uplevel'];
                    $level1Open = '<li class="breadcrumb-item"><a href="product.php?classid=' . $level1Upclassid . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
                    //處理第二層
                    $level2Cname = $data['cname'];
                    $level2Classid = $data['classid'];
                    $level2Open = '<li class="breadcrumb-item"><a href="product.php?classid=' . $level2Classid . '">' . $level2Cname . '</a></li>';
                    //處理第三層
                    $level3Open = '<li class="breadcrumb-item active" aria-current="page">' . $data['p_name'] . '</li>';
                } elseif (isset($_GET['search_name'])) {
                    //使用關鍵字查詢
                    $level1Open = '<li class="breadcrumb-item active" aria-current="page">關鍵字查詢:' . $_GET['search_name'] . '</li>';
                } elseif (isset($_GET['level']) && isset($_GET['classid'])) {
                    //選擇第一層類別
                    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=%d AND classid=%d", $_GET['level'], $_GET['classid']);
                    $classid_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                    $data = mysqli_fetch_assoc($classid_rs);
                    $level1Cname = $data['cname'];
                    $level1Open = '<li class="breadcrumb-item active" aria-current="page">' . $level1Cname . '</li>';
                } elseif (isset($_GET['classid'])) {
                    //選擇第二層類別
                    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND classid=%d", $_GET['classid']);
                    $classid_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                    $data = mysqli_fetch_assoc($classid_rs);
                    $level2Cname = $data['cname'];
                    $level2Uplink = $data['uplink'];
                    $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $level2Cname . '</li>';
                    //需加處理上一層
                    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=1 AND classid=%d", $level2Uplink);
                    $classid_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                    $data = mysqli_fetch_assoc($classid_rs);
                    $level1Cname = $data['cname'];
                    $level1 = $data['level'];
                    $level1Open = '<li class="breadcrumb-item"><a href="product.php?classid=' . $level2Uplink . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
                }
                ?>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                        <?php echo $level1Open . $level2Open . $level3Open; ?>
                    </ol>
                </nav>
                <!-- 商品信息 -->
                <div class="xtx-product-info">
                    <div class="left">

                        <?php
                        //取得產品圖片檔名資料
                        $SQLstring = sprintf("SELECT * FROM product_img WHERE product_img.p_id=%d ORDER BY sort", $_GET['p_id']);
                        $img_rs = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
                        $imgList = mysqli_fetch_assoc($img_rs);
                        ?>

                        <div class="picture">
                            <div class="middle">
                                <img id="showGoods" name="showGoods" src="product_img/<?php echo $imgList['img_file']; ?>" class="img-fluid" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>">
                                <div class="layer"></div>
                            </div>
                            <div class="small">
                                <ul>
                                    <?php do { ?>
                                        <li>
                                            <a href="product_img/<?php echo $imgList['img_file']; ?>" rel="group" class="fancybox" title="<?php echo $data['p_name']; ?>">
                                                <img src="product_img/<?php echo $imgList['img_file']; ?>" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>" class="img-fluid">
                                            </a>
                                        </li>
                                    <?php } while ($imgList = mysqli_fetch_assoc($img_rs)); ?>
                                </ul>

                            </div>

                            <div class="large"></div>
                        </div>

                    </div>


                    <div class="right">
                        <h3 class="name"><?php echo $data['p_name']; ?></h3>
                        <p class="desc">MOTORE: V8 / CILINDRATA TOTALE: 4497 cm3 / POTENZA MASSIMA A9000: 570 CV / VELOCITÀ MASSIMA: 325 km/h </p>
                        <p class="price"><span class="now">$<?php echo number_format( $data['p_price']); ?></span><span class="old">$<?php echo number_format(1999); ?></span></p>
                        <div class="address">
                            <div class="item">
                                <div class="dt">促銷</div>
                                <div class="dd">12月好物放送，App領券購買直降120元</div>
                            </div>
                            <div class="item">
                                <div class="dt">配送</div>
                                <div class="dd">至
                                    <div class="box">
                                        <span>台灣 台中 <i></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="dt">服務</div>
                                <div class="dd">
                                    <span class="fw">無憂退货</span>
                                    <span class="fw">快速退款</span>
                                    <span class="fw">免費包郵</span>
                                    <a href="/AKCO/three/examples/carModel.php" class="rgb">了解詳情</a>
                                </div>
                            </div>
                        </div>
                        <div class="attrs">
                            <div class="item">

                            </div>
                            <div class="item">
                                <div class="dt">規格</div>
                                <div class="dd">
                                    <span class="spec"><?php echo $data['p_spec']; ?></span>

                                </div>
                            </div>

                            <div class="item" class="input-group input-group-lg">
                                <div class="dt" id="inputGroup-sizing-lg">數量</div>
                                <div class="dd">
                                    <div class="num">
                                        <a href="javascript:;" id="minusOne">-</a>
                                        <input type="text" value="1" id="qty" class="form-control" aria-label="Sizing example input" aria-describeby="inputGroup-sizing-lg">
                                        <a href="javascript:;" id="addOne">+</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <button name="button01" id="button01" type="button" class="buy" onclick="addcart(<?php echo $data['p_id']; ?>)">
                                    立即購買
                                </button>
                            </div>
                            <div class="other">
                                <ul>
                                    <li>
                                        <p>銷量人氣</p>
                                        <p>1999+</p>
                                        <p>銷量人氣</p>
                                    </li>
                                    <li>
                                        <p>商品評價</p>
                                        <p>999+</p>
                                        <p>查看評價</p>
                                    </li>
                                    <li>
                                        <p>收藏人氣</p>
                                        <p>299+</p>
                                        <p><a href="javascript:;">收藏商品</a></p>
                                    </li>
                                    <li>
                                        <p>品牌信息</p>
                                        <p>Ferrari</p>
                                        <p><a href="javascript:;">品牌主頁</a></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 產品推薦 -->
                <div class="xtx-relevant-product">
                    <h3>產品推薦</h3>
                    <ul>
                        <li>
                            <a href="#">
                                <img src="product_img/Ferrari 296 GTB V6 Hybrid.jpeg" alt="">
                                <p class="name">Ferrari 296 GTB V6 Hybrid</p>
                                <p class="desc"></p>
                                <p class="price">$1688</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="product_img/Ferrari 296 GTS V6 Hybrid.jpeg" alt="">
                                <p class="name">Ferrari 296 GTS V6 Hybrid</p>
                                <p class="desc"></p>
                                <p class="price">$1822</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="product_img/Lamborghini Huracan EVO Coupe V10.jpeg" alt="">
                                <p class="name">Lamborghini Huracan EVO Coupe V10</p>
                                <p class="desc"></p>
                                <p class="price">$1509</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="product_img/Lamborghini Huracan STO V10.jpeg" alt="">
                                <p class="name">Lamborghini Huracan STO V10</p>
                                <p class="desc"></p>
                                <p class="price">$1990</p>
                            </a>
                        </li>
                    </ul>
                    <a href="javascript:;" class="prev"><span class="iconfont icon-angle-left"></span></a>
                    <a href="javascript:;" class="next"><span class="iconfont icon-angle-right"></span></a>
                </div>
                <!-- 商品詳情 -->
                <div class="xtx-product-detail">
                    <div class="main">
                        <div class="cont">
                            <div class="nav tab-nav">
                                <ul>
                                    <li>
                                        <a class="active" href="javascript:;">商品詳情</a>
                                        <a href="javascript:;" data-id="0">商品詳情</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">商品規格</a>
                                        <a href="javascript:;" data-id="1">商品規格</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">商品影音</a>
                                        <a href="javascript:;" data-id="2">商品影音</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">商品評價</a>
                                        <a href="javascript:;" data-id="3">商品評價</a>
                                    </li>
                                </ul>


                            </div>
                            <div class="tab-panel">
                                <div class="item active" style="padding: 20px 150px 20px 150px ;">
                                    <div class="content" style="padding-top: 0px;">
                                        458 Italia為F430的後繼車款，同樣採用中置引擎、後輪驅動的純正MR配置，外型同由Pinifarina工作室操刀，完美融合了LED日間行車燈等科技元素，以及經過精密計算的流體力學線條，結合成一款優美動感的全新超跑。<br>
                                        <br>
                                        全新設計的4.5升V8引擎具備缸內直噴技術、壓縮比高達12.5：1，再加上最高可達9000rpm的賽車式高轉化設定，最大馬力來到驚人的570hp，比起前代車款最終版本F430 Scuderia的510hp還足足多出60hp，同時容積效率也一口氣提升到127hp/ltr。除了換上全新引擎外，458 Italia也是繼California之後，Ferrari旗下第二款採用七速雙離合器自手排變速系統的車款，換檔速度及檔位齒比也因應車型不同而進行修改。<br>
                                        <br>
                                        458 Italia擁有0~100km/h起步加速3.4秒及極速325km/h的超高水準表現之外，7.3km/ltr的平均油耗及320g/km的碳排放量也都堪稱超跑中的佼佼者。<br>
                                        <br>
                                        另外，法拉利在2013法蘭克福國際車展首發的458 Speciale，搭載了法拉利各項專利和各種全球首創科技，引擎、主動空氣力學和電子控制方面的創新尤其令人矚目。458 Speciale相對於458 Italia實現了前所未有的技術升級，其幅度遠超之前的Challenge Stradale和430 Scuderia之間的差異，無論是在公路還是賽道上，458 Speciale都能在瞬間反應每一次駕駛指令，即使在極端環境下也能帶來順暢的駕馭體驗，達到人車合一的境界。<br>
                                        <br>
                                        該車搭載了史上最強的自然進氣V8引擎，9000轉時可輸出605hp馬力，馬力重量比高達135kg/hp，幾乎可以和賽車引擎相媲美。該引擎採用了F1車隊專用的設備和生產工藝，F1雙離合器變速箱的全新控制邏輯也能夠實現更加迅猛的加速體驗，Fast Down-shift技術在降檔過程中則能更快對輸入命令做出反饋。<br>
                                        <br>
                                        458 Speciale的核心科技之一，就是前後均搭載了全新的法拉利專利流體空氣力學設計，在過彎時需要盡可能加大下壓力，和直線行駛時需要盡可能降低阻力的情況下，可以應用不同的空氣力學配置。458 Speciale擁有堪稱完美的下壓力值0.53，主動空氣力學特性讓該項數值並未影響到風阻係數，Cd值僅為0.35。<br>
                                        <br>
                                        458 Speciale的側滑角控制技術（SSC）為全球首創，該技術利用一種創新的方法測算橫向加速度、側滑角、方向盤舵角和速度，能夠暫態計算車輛的側滑角度並和基準資料進行對比，借由F1-Trac牽引力控制系統和E-Diff電子差速器優化扭矩管理，實現更加平順、可控的過度轉向。<br>
                                        <br>
                                        在此之中，其Brembo煞車系統中的所有元件，均利用LaFerrari搭載的先進科技實現了性能提昇。458 Speciale搭載的另一個全新開發成果之一，就是米其林Pilot Sport Cup2輪胎，這款輪胎專為458 Speciale研發生產，旨在提高乾燥路面的單圈成績、多圈行駛時的穩定性，以及在潮濕路面的附著力。<br>
                                        <br>
                                        458 Speciale車重僅為1290公斤，2.13kg/hp的馬力重量比確保了前所未有的加速性能，其0~100km/h加速僅需3.0秒，Fiorano賽道單圈時間僅為1分23.5秒。法拉利造型中心和賓尼法利納共同為458 Speciale，打造了以實現極致性能為目的外型，對車身的修改重在突顯運動特質。<br>
                                        <br>
                                        本車駕駛艙洋溢著鮮明的賽車風格，完全採用簡約設計。車內大量使用了Alcantara麂皮和碳纖維等競技專用質材，同時有著人體工學佈局，所有控制介面均位於方向盤或駕駛周圍。排檔座、變速系統均在觸手可及的位置，以確保駕駛於高速時的注意力。
                                    </div>

                                    <!-- https://autos.yahoo.com.tw/new-cars/trim/ferrari-458-2014-italia#car-trim-nav -->
                                </div>

                                <div class="item">

                                    <div class="trim-spec-detail" style="padding-top: 0px;">
                                        <div class="spec-wrapper">
                                            <div class="title">規格</div>
                                            <input id="spec_power" type="checkbox" checked="">
                                            <label class="gabtn" for="spec_power" data-ga="['汽車車款', '汽車_Ferrari_2023 Purosangue_V12_展開規格配備', 'N/A']">
                                                動力
                                            </label>
                                            <ul>

                                                <li>
                                                    <span>動力型式</span>
                                                    <span>汽油</span>
                                                </li>

                                                <li>
                                                    <span>引擎型式</span>
                                                    <span>自然進氣, V型12缸, DOHC雙凸輪軸, 48氣門</span>
                                                </li>

                                                <li>
                                                    <span>排氣量</span>
                                                    <span>6496cc</span>
                                                </li>

                                                <li>
                                                    <span>最大馬力</span>
                                                    <span>725hp@7750rpm</span>
                                                </li>

                                                <li>
                                                    <span>最大扭力</span>
                                                    <span>73.0kgm@6250rpm</span>
                                                </li>


                                                <li>
                                                    <span>壓縮比</span>
                                                    <span>13.6</span>
                                                </li>

                                            </ul>
                                            <input id="spec_trans" type="checkbox" checked="">
                                            <label class="gabtn" for="spec_trans" data-ga="['汽車車款', '汽車_Ferrari_2023 Purosangue_V12_展開規格配備', 'N/A']">
                                                傳動
                                            </label>
                                            <ul>

                                                <li>
                                                    <span>驅動型式</span>
                                                    <span>四輪驅動</span>
                                                </li>

                                                <li>
                                                    <span>變速系統</span>
                                                    <span>雙離合器8速自手排</span>
                                                </li>
                                            </ul>
                                            <input id="spec_chassis" type="checkbox" checked="">
                                            <label class="gabtn" for="spec_chassis" data-ga="['汽車車款', '汽車_Ferrari_2023 Purosangue_V12_展開規格配備', 'N/A']">
                                                底盤
                                            </label>
                                            <ul>

                                                <li>
                                                    <span>前輪懸吊</span>
                                                    <span>雙A臂</span>
                                                </li>

                                                <li>
                                                    <span>後輪懸吊</span>
                                                    <span>多連桿</span>
                                                </li>

                                                <li>
                                                    <span>煞車型式</span>
                                                    <span>前後碟煞</span>
                                                </li>

                                                <li>
                                                    <span>輪胎尺碼</span>
                                                    <span>255/35R22 315/30R23</span>
                                                </li>
                                            </ul>
                                            <input id="spec_carbody" type="checkbox" checked="">
                                            <label class="gabtn" for="spec_carbody" data-ga="['汽車車款', '汽車_Ferrari_2023 Purosangue_V12_展開規格配備', 'N/A']">
                                                車體
                                            </label>
                                            <ul>

                                                <li>
                                                    <span>車身型式</span>
                                                    <span>跨界休旅車</span>
                                                </li>

                                                <li>
                                                    <span>車門數</span>
                                                    <span>5門</span>
                                                </li>

                                                <li>
                                                    <span>座位數</span>
                                                    <span>4人座</span>
                                                </li>

                                                <li>
                                                    <span>車長</span>
                                                    <span>4973mm</span>
                                                </li>

                                                <li>
                                                    <span>車寬</span>
                                                    <span>2028mm</span>
                                                </li>

                                                <li>
                                                    <span>車高</span>
                                                    <span>1589mm</span>
                                                </li>

                                                <li>
                                                    <span>車重</span>
                                                    <span>2033kg</span>
                                                </li>

                                                <li>
                                                    <span>軸距</span>
                                                    <span>3018mm</span>
                                                </li>

                                                <li>
                                                    <span>標準行李箱容量</span>
                                                    <span>473ltr</span>
                                                </li>

                                                <li>
                                                    <span>後座傾倒行李箱容量</span>
                                                    <span>800ltr</span>
                                                </li>
                                            </ul>
                                            <input id="spec_other" type="checkbox" checked="">
                                            <label class="gabtn" for="spec_other" data-ga="['汽車車款', '汽車_Ferrari_2023 Purosangue_V12_展開規格配備', 'N/A']">
                                                其他
                                            </label>
                                            <ul>

                                                <li>
                                                    <span>油箱容量</span>
                                                    <span>100ltr</span>
                                                </li>

                                                <li>
                                                    <span>牌照稅</span>
                                                    <span>69690元</span>
                                                </li>

                                                <li>
                                                    <span>燃料費</span>
                                                    <span>13950元</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="spec-wrapper spec-right">
                                            <div class="title">
                                                配備
                                                <span><i class="fa fa-circle-o" aria-hidden="true"></i>選購配備</span>
                                            </div>
                                            <input id="equip_outside" type="checkbox" checked="">
                                            <label for="equip_outside">外觀</label>
                                            <ul>
                                                <li>
                                                    <span>後霧燈</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>LED日行燈</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>LED頭燈</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>LED尾燈</span>
                                                    <span></span>
                                                </li>
                                            </ul>
                                            <input id="equip_inside" type="checkbox" checked="">
                                            <label for="equip_inside">內裝</label>
                                            <ul>
                                                <li>
                                                    <span>全景天窗</span>
                                                    <span class="icon-circle"></span>
                                                </li>
                                                <li>
                                                    <span>方向盤快控鍵</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>換檔撥片</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>恆溫空調</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>分區溫控</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>粉塵過濾器</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>駕駛座電動調整</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>右前座電動調整</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>雙前座氣動按摩</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>雙前座電熱椅</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座電動調整</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座電熱椅</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座分離倒覆</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>里程電腦</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>前座扶手</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座扶手</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>前座杯架</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座杯架</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座出風口</span>
                                                    <span></span>
                                                </li>
                                            </ul>
                                            <input id="equip_video" type="checkbox" checked="">
                                            <label for="equip_video">影音</label>
                                            <ul>
                                                <li>
                                                    <span>中控螢幕</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>MP3播放功能</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>藍牙通訊</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>USB插槽</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後座整合控制面板</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>12只揚聲器</span>
                                                    <span></span>
                                                </li>
                                            </ul>
                                            <input id="equip_facility" type="checkbox" checked="">
                                            <label for="equip_facility">便利</label>
                                            <ul>
                                                <li>
                                                    <span>免鑰匙啟動車門鎖</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>定速巡航</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>蜂鳴式倒車輔助系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>前方駐車雷達</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>倒車影像輔助</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>倒車圖像輔助</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>光感應自動頭燈</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>雨滴感應雨刷</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>電動窗防夾功能</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>電動尾門</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>電動折疊後視鏡</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>後視鏡除霧</span>
                                                    <span></span>
                                                </li>
                                            </ul>
                                            <input id="equip_safety" type="checkbox" checked="">
                                            <label for="equip_safety">安全</label>
                                            <ul>
                                                <li>
                                                    <span>防盜系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>預束式安全帶</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>雙前座正面氣囊</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>雙前座側面氣囊</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>全尺寸頭部氣簾</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>防鎖死煞車系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>煞車力道分配系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>電子煞車力道輔助系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>循跡防滑控制系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>斜坡起步輔助</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>陡坡緩降系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>車道偏離警示系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>車道變換輔助系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>ACC主動跟車系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>車道維持輔助系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>AEB自動緊急煞車系統</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>遠光燈自動控制</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>兒童安全鎖</span>
                                                    <span></span>
                                                </li>
                                                <li>
                                                    <span>胎壓監控</span>
                                                    <span></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>

                                <div class="item video-container">
                                    <video class="img-fluid" autoplay loop muted>
                                        <source src="./videos/Ferrari 458 Italia Showcase - Bertie Victor Photography .mp4" type="video/mp4" />
                                    </video>
                                </div>

                                <div class="item forum">
                                    <div class="wrapper">
                                        <i class="avatar"><img src="./product_img/avatar.jpg" alt=""></i>
                                        <textarea id="tx" placeholder="發一條友善的評論" rows="2" maxlength="200"></textarea>
                                        <button>發布</button>
                                    </div>
                                    <div class="wrapper">
                                        <span class="total">0/200字</span>
                                    </div>
                                    <div class="list">
                                        <div class="item" style="display: none;">
                                            <i class="avatar"></i>
                                            <div class="info">
                                                <p class="name">玩家評論</p>
                                                <p class="text"></p>
                                                <p class="time">2023-05-17 14:35:01</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- 注意事项 -->
                        <div class="warn">

                            <?php echo $data['p_content']; ?>

                        </div>
                    </div>
                    <div class="aside">
                        <div class="tit">找好車!!!</div>
                        <div class="product">
                            <img src="product_img/Lamborghini Huracan Tecnica V10.jpeg" alt="">
                            <p class="name">Lamborghini Huracan Tecnica V10</p>
                            <p class="desc"></p>
                            <p class="price">$1368</p>
                        </div>
                        <div class="product">
                            <img src="product_img/Lamborghini Urus Performante.jpeg" alt="">
                            <p class="name">Lamborghini Urus Performante</p>
                            <p class="desc"></p>
                            <p class="price">$1380</p>
                        </div>
                        <div class="product">
                            <img src="product_img/McLaren Artura V6 Hybrid.jpeg" alt="">
                            <p class="name">McLaren Artura V6 Hybrid</p>
                            <p class="desc"></p>
                            <p class="price">$1328</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- 公共底部 -->
        <?php require_once "footer.php"; ?>
        <script type="text/javascript" src="fancybox-2.1.7/source/jquery.fancybox.js"></script>
        <script type="text/javascript">
            // 1. 獲取三個盒子
            // 2. 小盒子 圖片切換效果
            const small = document.querySelector('.small');
            //  中盒子
            const middle = document.querySelector('.middle');
            //  大盒子
            const large = document.querySelector('.large');

            large.style.backgroundImage = `url(${middle.querySelector('img').src})`;

            small.querySelector('ul>li').classList.add('active');
            // 2. 事件委托
            small.addEventListener('mouseover', function(e) {
                if (e.target.tagName === 'IMG') {
                    // console.log(111)
                    // 排他 幹掉以前的 active  li 上面
                    this.querySelector('.active').classList.remove('active');
                    // 當前元素的爸爸添加 active
                    e.target.parentNode.parentNode.classList.add('active');
                    // 拿到當前小圖片的 src
                    // console.log(e.target.src)
                    // 讓中等盒子里面的圖片，src 更換為   小圖片src
                    middle.querySelector('img').src = e.target.src;
                    // 大盒子更換背景圖片
                    large.style.backgroundImage = `url(${e.target.src})`;
                }
            })


            // 3. 滑鼠經過中等盒子， 顯示隐藏 大盒子
            middle.addEventListener('mouseenter', show);
            middle.addEventListener('mouseleave', hide);
            let timeId = null
            // 顯示函數 顯示大盒子
            function show() {
                // 先清除定时器
                clearTimeout(timeId);
                large.style.display = 'block';
            }
            // 隐藏函數 隐藏大盒子
            function hide() {
                timeId = setTimeout(function() {
                    large.style.display = 'none';
                }, 200)
            }


            // 4. 滑鼠經過大盒子， 顯示隐藏 大盒子
            large.addEventListener('mouseenter', show);
            large.addEventListener('mouseleave', hide);


            // 5. 滑鼠經過中等盒子，顯示隐藏 黑色遮罩層
            const layer = document.querySelector('.layer')
            middle.addEventListener('mouseenter', function() {
                layer.style.display = 'block';
            })
            middle.addEventListener('mouseleave', function() {
                layer.style.display = 'none';
            })
            // 6.移動黑色遮罩盒子
            middle.addEventListener('mousemove', function(e) {
                // let x = 10, y = 20
                // console.log(11)
                // 滑鼠在middle 盒子里面的坐標 = 滑鼠在頁面中的坐標 - middle 中等盒子的坐標
                // console.log(e.pageX)滑鼠在頁面中的坐標
                // middle 中等盒子的坐標
                // console.log(middle.getBoundingClientRect().left)
                let x = e.pageX - middle.getBoundingClientRect().left;
                let y = e.pageY - middle.getBoundingClientRect().top - document.documentElement.scrollTop;
                // console.log(x, y)
                // 黑色遮罩移動 在 middle 盒子内 限定移動的距離
                if (x >= 0 && x <= 800 && y >= 0 && y <= 600) {
                    // 黑色盒子不是一直移動的
                    // 聲明2個變量 黑色盒子移動的 mx my變量 
                    let mx = 0,
                        my = 0;
                    if (x < 100) mx = 0;
                    if (x >= 100 && x <= 700) mx = x - 100;
                    if (x > 700) mx = 600;

                    if (y < 100) my = 0;
                    if (y >= 100 && y <= 500) my = y - 100;
                    if (y > 500) my = 400;

                    layer.style.left = mx + 'px';
                    layer.style.top = my + 'px';
                    // 大盒子的背景圖片要跟隨 中等盒子移動  存在的關係是 2倍   
                    large.style.backgroundPositionX = -1.33 * mx + 'px';
                    large.style.backgroundPositionY = -1.5 * my + 'px';
                }
            })
            $(function() {
                //定義在滑鼠滑過圖片 檔名填入主圖src中
                $(".card .row.mt-2 .col-md-4 a").mouseover(function() {
                    let imgSrc = $(this).children("img").attr("src");
                    $("#showGoods").attr({
                        "src": imgSrc
                    });
                });
                //將子圖放到lightbox展示
                $(".fancybox").fancybox();
            });

            const ul = document.querySelector('.tab-nav ul');

            const items = document.querySelectorAll('.tab-panel .item');

            ul.addEventListener('click', function(e) {

                if (e.target.tagName === 'A') {

                    document.querySelector('.tab-nav .active').classList.remove('active');

                    e.target.classList.add('active');

                    const i = +e.target.dataset.id;

                    document.querySelector('.tab-panel .active').classList.remove('active');

                    items[i].classList.add('active');
                }
            })
            //pNumber
            let addOne = document.querySelector('#addOne');
            let minusOne = document.querySelector('#minusOne');
            let qty = document.querySelector('#qty');

            addOne.addEventListener('click', function() {
                let currentValue = parseInt(qty.value);
                if (!isNaN(currentValue)) {
                    qty.value = currentValue + 1;
                }
            });

            minusOne.addEventListener('click', function() {
                let currentValue = parseInt(qty.value);
                if (!isNaN(currentValue) && currentValue > 1) {
                    qty.value = currentValue - 1;
                }
            });

            const spec = document.querySelector('.spec');
            spec.addEventListener('click', function() {
                spec.classList.toggle('active');
            });
            // forum
            const tx = document.querySelector('#tx')
            const total = document.querySelector('.total')
            const item = document.querySelector('.item')
            const text = document.querySelector('.text')

            tx.addEventListener('focus', function() {
                total.style.opacity = 1
            })

            tx.addEventListener('blur', function() {
                total.style.opacity = 0
            })

            tx.addEventListener('input', function() {

                total.innerHTML = `${tx.value.length}/200字`
            })

            tx.addEventListener('keyup', function(e) {

                if (e.key === 'Enter') {

                    if (tx.value.trim()) {

                        item.style.display = 'block'

                        text.innerHTML = tx.value

                    }

                    tx.value = ''

                    total.innerHTML = '0/200字'
                }

            })
        </script>
    </body>

</html>