<div class="sidebar">
    <form name="search" id="search" action="product.php" method="get">
        <div class="input-group">
            <input type="text" name="search_name" id="search_name" class="form-control" placeholder="Search!!!" value="<?php echo (isset($_GET['search_name']))?$_GET['search_name']:''; ?>" required>
            <span class="input-group-btn">
                <button class="btn btn-default coolColor" type="submit">
                    <i class="fas fa-search fa-lg"></i>
                </button>
            </span>
        </div>
    </form>
</div>
<?php
// 列出產品類別第一層
$SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
$conn = new Dbhandler();
$pyclass01 = $conn->conn()->query($SQLstring) or die($conn->conn()->error);

$i = 1; //控制編號順序

if (isset($_GET['p_id'])) { //如果使用產品查詢，需取得類別編號上一層類別
    $SQLstring = sprintf("SELECT uplink FROM pyclass,product WHERE pyclass.classid=product.classid AND p_id=%d",$_GET['p_id']);
    $classid_rs = $conn->conn()->query($SQLstring);
    $data = mysqli_fetch_array($classid_rs);
    $ladder = $data['uplink'];
}
//使用第一層類別查詢
if (isset($_GET['level']) && $_GET['level'] == 1) {
    //使用第一層類別查詢
    $ladder = $_GET['classid'];
} elseif (isset($_GET['classid'])) { //如果使用類別查詢需要取得上層類別
    $SQLstring = "SELECT uplink FROM pyclass WHERE level=2 AND classid=" . $_GET['classid'];
    $classid_rs = $conn->conn()->query($SQLstring);
    $data = mysqli_fetch_array($classid_rs);
    $ladder = $data['uplink'];
} else {
    $ladder = 1;
}
?>

<div class="accordion" id="accordionExample" style="margin-top: 12px;">
    <?php while ($pyclass01_Rows = mysqli_fetch_array($pyclass01)) {
        $i = $pyclass01_Rows['classid']; ?>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne<?php echo $i; ?>">
                <button class="accordion-button btn-5 <?php echo ($i == $ladder) ? '' : 'collapsed'; ?>" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                    <img src="product_img/sportsCarIcon.png" alt="sportsCarIcon" style="height: 51px;width: 51px;margin-right: 12px;"><?php echo $pyclass01_Rows['cname']; ?>
                </button>
            </h2>
            <?php
           
            ?>
            <?php
            // 列出產品類別第二層
            $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 and uplink=%d order by sort", $pyclass01_Rows['classid']);
            $pyclass02 = $conn->conn()->query($SQLstring);
            ?>
            <div id="collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == $ladder) ? 'show' : ''; ?>" aria-labelledby="headingOne<?php echo $i; ?>" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <table class="table">
                        <tbody>
                            <?php while ($pyclass02_Rows = mysqli_fetch_array($pyclass02)) { ?>
                                <tr>
                                    <td><em class="fa-solid <?php echo $pyclass02_Rows['fonticon']; ?>"></em><a href="product.php?classid=<?php echo $pyclass02_Rows['classid']; ?>"><?php echo $pyclass02_Rows['cname']; ?></a></td>
                                </tr>
                            <?php } ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <?php $i++;
    } ?>
</div>