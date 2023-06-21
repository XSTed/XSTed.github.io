<?php
//建立廣告輪播carousel資料查詢
$SQLstring = "SELECT * FROM carousel WHERE caro_online=1 ORDER BY caro_sort";
$conn = new Dbhandler();
$carousel = $conn->conn()->query($SQLstring) or die($conn->conn()->error);
$i = 0; //控制active啟動
?>


<div class="container-fluid" style="padding: 0;margin-top: -9px;" id="carousel2">
    <section class="slideshow">
        <div id="CarouselTextAnim" class="carousel slide carousel-slide" data-bs-ride="carousel" data-bs-interval="2000" data-bs-pause="false">
            <div class="carousel-inner">
                <?php
                $i = 0;
                while ($data = mysqli_fetch_assoc($carousel)) { ?>
                    <div class="carousel-item <?php echo activeShow($i, 0); ?>">
                        <a href="product.php?p_id=<?php echo $data['p_id']; ?>">
                            <img src="./product_img/<?php echo $data['caro_pic']; ?>" class="img-carousel d-block w-100" alt="<?php echo $data['caro_title']; ?>">
                        </a>
                    </div>
                    <div class="carousel-caption">
                        <h2 id="carousel1" class="h1-carousel mb-5 caption-top"><?php echo $data['caro_title']; ?></h2>
                        <h2 class="h1-carousel mb-5 caption-bottom"><?php echo $data['caro_content']; ?></h2>
                    </div>

                <?php $i++;
                } ?>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
</div>