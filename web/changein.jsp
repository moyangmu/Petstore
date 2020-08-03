<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/27
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="head.jsp"></jsp:include>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<link rel="shortcut icon" type="image/x-icon" href="account/img/favicon.ico">
<!--All Css Here-->

<!-- Bootstrap CSS-->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Linearicon CSS-->
<link rel="stylesheet" href="account/css/linearicons.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

<!-- Animate CSS-->
<link rel="stylesheet" href="account/css/animate.css">
<!-- Owl Carousel CSS-->
<link rel="stylesheet" href="account/css/owl.carousel.min.css">
<!-- Slick CSS-->
<link rel="stylesheet" href="account/css/slick.css">
<!-- Meanmenu CSS-->
<link rel="stylesheet" href="account/css/meanmenu.min.css">
<!-- Easyzoom CSS-->
<link rel="stylesheet" href="account/css/easyzoom.css">
<!-- Venobox CSS-->
<link rel="stylesheet" href="account/css/venobox.css">
<!-- Jquery Ui CSS-->
<link rel="stylesheet" href="account/css/jquery-ui.css">
<!-- Nice Select CSS-->
<link rel="stylesheet" href="account/css/nice-select.css">
<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="account/css/responsive.css">
<link rel="stylesheet" href="account/css/address.css">
<link rel="stylesheet" href="account/css/admin.css">
<link rel="stylesheet" href="account/css/information.css">
<!-- Modernizr Js -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<jsp:include page="menu.jsp"></jsp:include>

<div class="my-account white-bg mb-110">
    <div class="container">
        <div class="account-dashboard">
            <div class="dashboard-upper-info">

            </div>
            <div class="row">

                <div class="col-md-12 col-lg-10">

                        <div id="information" class="tab-pane">
                            <div class="user-info">
                                <!--标题 -->
                                <div class="am-cf am-padding">
                                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                                </div>
                                <hr/>

                                <!--头像 -->
                                <div class="user-infoPic">

                                    <div class="filePic">
                                        <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
                                        <img class="am-circle am-img-thumbnail" src="account/img/slider/11002R346-1.jpg" alt="" style="width: 100px; height: 100px;" />
                                    </div>

                                    <p class="am-form-help">头像</p>

                                    <div class="info-m">
                                        <div><b>用户名：<i>${customer.name}</i></b></div>


                                        <!-- <div class="u-level">
                                            <span class="rank r2">
                                                 <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
                                            </span>
                                        </div> -->
                                        <!-- <div class="u-safety">
                                            <a href="safety.html">
                                             账户安全
                                            <span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
                                            </a>
                                        </div> -->
                                    </div>
                                </div>

                                <!--个人信息 -->
                                <div class="info-main">

                                        <div class="am-form-group">
                                            <label for="chang" class="am-form-label">密码修改：</label>
                                            <div class="am-form-content">
                                                <input type="text" id="chang" placeholder="密码">

                                            </div>
                                        </div>
                                    <div class="am-form-group">
                                        <label for="chang2" class="am-form-label">密码修改确认：</label>
                                        <div class="am-form-content">
                                            <input type="text" id="chang2" placeholder="密码">

                                        </div>
                                    </div>

                                        <div class="info-btn">
                                            <button type="button" class="btn btn-info" style="margin-left: 40px" id="gaimi">
                                                <a>提交</a>
                                            </button>
                                        </div>

                                </div>

                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<!--Popper-->
<script src="account/js/popper.min.js"></script>
<!--Bootstrap-->
<script src="account/js/bootstrap.min.js"></script>
<!--Imagesloaded-->
<script src="account/js/imagesloaded.pkgd.min.js"></script>
<!--Isotope-->
<script src="account/js/isotope.pkgd.min.js"></script>
<!--Waypoints-->
<script src="account/js/waypoints.min.js"></script>
<!--Counterup-->
<script src="account/js/jquery.counterup.min.js"></script>
<!--Carousel-->
<script src="account/js/owl.carousel.min.js"></script>
<!--Slick-->
<script src="account/js/slick.min.js"></script>
<!--Meanmenu-->
<script src="account/js/jquery.meanmenu.min.js"></script>
<!--Easyzoom-->
<script src="account/js/easyzoom.min.js"></script>
<!--Nice Select-->
<script src="account/js/jquery.nice-select.min.js"></script>
<!--ScrollUp-->
<script src="account/js/jquery.scrollUp.min.js"></script>
<!--Wow-->
<script src="account/js/wow.min.js"></script>
<!--Venobox-->
<script src="account/js/venobox.min.js"></script>
<!--Jquery Ui-->
<script src="http://cdn.bootcss.com/jqueryui/1.11.0/jquery-ui.min.js"></script>
<!--Countdown-->
<script src="account/js/jquery.countdown.min.js"></script>
<!--Plugins-->
<script src="account/js/plugins.js"></script>
<!--Main Js-->
<script src="account/js/main.js"></script>


<script type="text/javascript">
    $(document).ready(function() {

        // console.log("11111")
        $("#gaimi").click(function() {
            var name = $("#zhang").html();
            var mi = $("#chang").val();
            var mi1 = $("#chang2").val();
            console.log(mi);
            if (mi != mi1){
                alert("请确认输入")
            }else {
                $.ajax({
                    type : "post",
                    url : "recharge",
                    data : {
                        "name" : name,
                        "mi" : mi
                    },
                    success : function(result) {
                        //当服务端正常运行完成，并返回json数据时，修改界面上的内容
                        if (result.isSuccess == "true") {

                            // alert("1111");
                            toastr.success(result.msg);

                        } else {
                            console.log("222");
                            toastr.error(result.msg);
                        }
                    }
                });
            }

        });
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>

