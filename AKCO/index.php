<?php require_once('session.php'); ?>

<!DOCTYPE html>
<html lang="zh-TW">
<?php require_once("php_lib.php") ?>
<head>
<?php require_once "header.php";?>
<title>AK CO. Index Practice Full Stack</title>
<link rel="stylesheet" href="./static/css/akco.css">
</head>

<body>
<?php require_once "navBar.php";?>

    <!-- first carousel -->
    <div class="container-fluid carousel px-0">
        <div class="row">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <div data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">
                    </div>
                    <div data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2">
                    </div>
                    <div data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3">
                    </div>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="3000">
                        <a href="#">
                            <video class="img-fluid" autoplay loop muted>
                                <source src="./videos/Ferrari.mp4" type="video/mp4" />
                            </video>
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h2>Build Your Dream</h2>
                            <p>Ferrari ： Car's Legend</p>
                        </div>
                    </div>
                    <div class="carousel-item active" data-bs-interval="3000">
                        <a href="#">
                            <video class="img-fluid" autoplay loop muted>
                                <source src="./videos/Lamborghini.mp4" type="video/mp4" />
                            </video>
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h2>Lamborghini</h2>
                            <p>Lamborghini ： Car's Myth</p>
                        </div>
                    </div>
                    <div class="carousel-item active" data-bs-interval="3000">
                        <a href="#">
                            <video class="img-fluid" autoplay loop muted>
                                <source src="./videos/Model S.mp4" type="video/mp4" />
                            </video>
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h2>Model S</h2>
                            <p>Model S ： Car's ERA</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php require_once "carousel.php";?>

        <!-- category -->
        <div class="container-fluid p-0 m-0" id="image-container">
            <div class="row category d-flex p-0 m-0">
                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_1">
                            <img src="./product_img/category_0.png" class="card-img-top" alt="card_1" />

                            <div class="card-body">

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_2">
                            <img src="./product_img/category_1.png" class="card-img-top" alt="card_2" />

                            <div class="card-body">

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_3">
                            <img src="./product_img/category_2.png" class="card-img-top" alt="card_3" />

                            <div class="card-body">

                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_4">
                            <img src="./product_img/category_3.png" class="card-img-top" alt="card_4" />

                            <div class="card-body">

                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_5">
                            <img src="./product_img/category_4.png" class="card-img-top" alt="card_5" />

                            <div class="card-body">
                                
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-12 col-md-6 col-lg-6 p-0 m-0">
                    <a href="product.php">
                        <div class="box flex-fill p-0 m-0" id="card_6">
                            <img src="./product_img/category_5.png" class="card-img-top" alt="card_6" />

                            <div class="card-body">

                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <?php require "footer.php"; ?>
    <script type="text/javascript">

        // second carousel
        const topcap = document.querySelectorAll(".caption-top");
        const bottomcap = document.querySelectorAll(".caption-bottom");
        const captions = document.querySelectorAll(".carousel-caption");
        const hiddenClass = "hidden";

        var TACarousel = document.querySelector("#CarouselTextAnim");

        let currentItem, nextItem;

        document.addEventListener("DOMContentLoaded", function(e) {
            currentItem = captions[0];
        });

        TACarousel.addEventListener("slid.bs.carousel", function(e) {
            currentItem = e.relatedTarget.nextElementSibling;

            nextItem.firstElementChild.classList.remove(hiddenClass);
            nextItem.lastElementChild.classList.remove(hiddenClass);
        });

        TACarousel.addEventListener("slide.bs.carousel", function(e) {
            nextItem = e.relatedTarget.nextElementSibling;

            currentItem.firstElementChild.classList.add(hiddenClass);
            currentItem.lastElementChild.classList.add(hiddenClass);
        });

        // category
        const boxes = document.querySelectorAll('.box');

        window.addEventListener('scroll', checkBoxes);

        checkBoxes();

        function checkBoxes() {
            const triggerBottom = window.innerHeight / 5 * 4

            boxes.forEach(box => {
                const boxTop = box.getBoundingClientRect().top;

                if (boxTop < triggerBottom) {
                    box.classList.add('show');
                } else {
                    box.classList.remove('show');
                }
            })
        }

    </script>
</body>

</html>