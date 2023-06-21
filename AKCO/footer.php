    <!-- footer -->
    <section id="subscribe">
        <div class="container-fluid">
            <div class="row">
                <div id="subscribeInfo" class="d-flex justify-content-center align-items-center text-center">
                    <p>Subscribe Me</p>
                </div>

            </div>
        </div>
    </section>

    <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h1 class="coolColor">AK CO.</h1>
                        <p>Practice Stack-Full Tech</p>
                        <ul>
                            <li><img src="product_img/Qrcode02.png" alt="QRcode" class="img-fluid mx-auto"></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li>
                                <p>Frontend</p>
                            </li>
                            <li>
                                <p>Backend</p>
                            </li>
                            <li>
                                <p>Database</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>Project For E-commerce Website Practice</h3>
                        <p>I participate Goverment's Institute for learning Main in Frontend</p>
                        <p>In Six Months,I learned HTML5,CSS,Javascript,Jquery,Vue.js Framework</p>
                        <p>I fixed Youtube video by iframe not to autoplay when refresh in mobile scale,</p>
                        <p>this issue confused teacher very very long time</p>
                        <p>and I spent about 10minutes to read Stackoverflow and google developer documentation.</p>
                        <p>Google Official strongly advices developers to use create script tag in refresh,</p>
                        <p>it let me know more about 《lazy load》 tech this performance improvement skill</p>
                        <p>Last,I find treasure in Yahoo Special Performance Team's report!!!Awesome!!!</p>
                    </div>
                    <div class="col item social">
                        <a href="#"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                        <a href="#"><i class="fa-brands fa-github"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <p class="copyright">AK CO. Practice Full stack Main in Frontend © 2023</p>
            </div>
        </footer>
    </div>


    <section id="countEffect">
        <div class="container-fluid">
            <div class="row">
                <div id="countEffectInfo" class="d-flex justify-content-center align-items-center text-center">
                    <div class="col-2">
                        <h1 class="count">100</h1>
                        <h5>Effort</h5>
                    </div>
                    <div class="col-2">
                        <h1 class="count">900</h1>
                        <h5>Hours</h5>
                    </div>
                    <div class="col-2">
                        <h1 class="count">6</h1>
                        <h5>Months</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="footer">
        <div class="container-fluid">
            <div id="last-data" class="row text-center">
                <col-md-12>
                    <h6>AK CO.練習作品 台中市西屯區工業區一路100號 電話：04-23592181 免付費電話：0800-777888</h6>
                    <h6>版權所有 copyright © 2023 AK CO. All Rights Reserved.</h6>
                </col-md-12>
            </div>
        </div>
    </section>
    <!-- footer -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="./static/wow.js"></script>
    <script src="./static/morphext.js"></script>
    <script src="./static/text_ctrl.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js"></script>
    <!-- credits: https://www.codeply.com/p/EJd6H4Ejyi -->
    <script src="./static/jslib.js"></script>
    <!-- Live 2D Plugin -->
    <script src="./static/js/plugins/live2d.js"></script>
    <!-- Customize Live 2D Plugin -->
    <script src="./static/js/plugins/l2d.js"></script>
    <script src="./static/gotop.js"></script>
    <script type="text/javascript">
        // count
        $('.count').each(function() {
            $(this).prop('Counter', 0).animate({
                Counter: $(this).text()
            }, {
                duration: 6000,
                easing: 'swing',
                step: function(now) {
                    $(this).text(Math.ceil(now));
                }
            });
        });

        // header
        // navbar
        $(window).scroll(function() {
            if ($(document).scrollTop() > 50) {
                $('nav').addClass('Navshrink');
                $('.navlogo.img-fluid').addClass('rotateNavIcon');
            } else {
                $('nav').removeClass('Navshrink');
                $('.navlogo.img-fluid').removeClass('rotateNavIcon');
            }
        });
        // Live2D
        $(function() {
            <?php
            include("./static/js/inc/l2d.js");
            ?>
        });
    </script>