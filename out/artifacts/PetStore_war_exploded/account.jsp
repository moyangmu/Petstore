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
                <div class="col-md-12 col-lg-2">
                    <!-- Nav tabs -->
                    <ul class="nav flex-column dashboard-list" role="tablist">
                        <li><a class="nav-link" data-toggle="tab" href="#information">My information</a></li>

                        <li><a class="nav-link active" data-toggle="tab" href="#dashboard">self center</a></li>
                        <li> <a class="nav-link" data-toggle="tab" href="#orders">Orders</a></li>
                        <li><a class="nav-link" data-toggle="tab" href="#downloads">Downloads</a></li>
                        <li><a class="nav-link" data-toggle="tab" href="#address">Addresses</a></li>

                        <!-- <li><a class="nav-link" data-toggle="tab" href="#information">Account details</a></li> -->
                        <!-- <li><a class="nav-link" href="login-register.html">logout</a></li> -->
                    </ul>
                </div>
                <div class="col-md-12 col-lg-10">
                    <!-- Tab panes -->
                    <div class="tab-content dashboard-content">
                        <div id="dashboard" class="tab-pane fade show active">
                            <div class="m-bg"></div>
                            <div class="m-userinfo">
                                <div class="m-baseinfo">
                                    <a href="#">
                                        <img src="account/img/slider/11002R346-1.jpg">
                                    </a>
                                    <em class="s-name">用户名：(胡小皓)<span class="vip1"></em>
                                    <div class="s-prestige am-btn am-round">
                                        </span style="color=black">会员福利</span>

                                    </div>
                                </div>
                                <div class="m-right">

                                    <div class="m-new">
                                        <a href="news.html"><i class="am-icon-bell-o"></i>消息</a>
                                    </div>

                                </div>


                            </div>
                            <div class="s-bar">
                                <i class="s-icon"></i>个人资产
                            </div>
                            <div class="m-userproperty">

                                <p class="m-bonus">
                                    <a href="#">
                                        <i><img src="account/img/slider/bonus.png"/></i>
                                        <span class="m-title">红包</span>
                                        <em class="m-num">2</em>
                                    </a>
                                </p>
                                <p class="m-coupon">
                                    <a href="#">
                                        <i><img src="account/img/slider/coupon.png"/></i>
                                        <span class="m-title">优惠券</span>
                                        <em class="m-num">2</em>
                                    </a>
                                </p>
                                <p class="m-bill">
                                    <a href="#">
                                        <i><img src="account/img/slider/wallet.png"/></i>
                                        <span class="m-title">钱包</span>
                                        <em class="m-num">2</em>
                                    </a>
                                </p>
                                <p class="m-big">
                                    <a href="#">
                                        <i><img src="account/img/slider/day-to.png"/></i>
                                        <span class="m-title">签到有礼</span>
                                    </a>
                                </p>
                                <p class="m-big">
                                    <a href="#">
                                        <i><img src="account/img/slider/72h.png"></i>
                                        <span class="m-title">72小时发货</span>
                                    </a>
                                </p>
                            </div>
                            <div class="m-order">
                                <div class="s-bar">
                                    <i class="s-icon"></i>我的订单
                                    <a class="i-load-more-item-shadow" href="#">全部订单</a>
                                </div>
                                <ul>
                                    <li><a href="#"><i><img src="account/img/slider/pay.png"/></i><span>待付款</span></a></li>
                                    <li><a href="#"><i><img src="account/img/slider/send.png"/></i><span>待发货<em class="m-num">1</em></span></a></li>
                                    <li><a href="#"><i><img src="account/img/slider/receive.png"/></i><span>待收货</span></a></li>
                                    <li><a href="#"><i><img src="account/img/slider/comment.png"/></i><span>待评价<em class="m-num">3</em></span></a></li>
                                    <li><a href="#"><i><img src="account/img/slider/refund.png"/></i><span>退换货</span></a></li>
                                </ul>
                            </div>
                        </div>

                        <div id="orders" class="tab-pane fade">
                            <h3>Orders</h3>
                            <div class="table-responsive">
                                <c:forEach var="order" items="${orderList }">
                                    <div class="card">
                                        <div class="card-header">
                                            订单编号：${order.id } 订单状态：${order.status } 金额 ${order.money } 创建时间  ${order.date }
                                            <button data-id="${order.id }" type="button" class="btn-show">订单详情</button>
                                        </div>
                                        <div class="card-body" style="display:none">

                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th scope="col">名称</th>
                                                    <th scope="col">单价</th>
                                                    <th scope="col">数量</th>
                                                    <th scope="col">金额</th>

                                                </tr>
                                                </thead>
                                                <tbody >

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="downloads" class="tab-pane fade">
                            <h3>Downloads</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Downloads</th>
                                        <th>Expires</th>
                                        <th>Download</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Haven - Free Real Estate PSD Template</td>
                                        <td>May 10, 2018</td>
                                        <td>never</td>
                                        <td><a class="view" href="#">Click Here To Download Your File</a></td>
                                    </tr>
                                    <tr>
                                        <td>Nevara - ecommerce html template</td>
                                        <td>Sep 11, 2018</td>
                                        <td>never</td>
                                        <td><a class="view" href="#">Click Here To Download Your File</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="address" class="tab-pane">
                            <!-- <p>The following addresses will be used on the checkout page by default.</p> -->
                            <div class="user-address">
                                <!--标题 -->
                                <div class="am-cf am-padding">
                                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                                </div>
                                <hr/>
                                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

                                    <li class="user-addresslist defaultAddr">
                                        <span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
                                        <p class="new-tit new-p-re">
                                            <span class="new-txt">胡小皓</span>
                                            <span class="new-txt-rd2">159****1234</span>
                                        </p>
                                        <div class="new-mu_l2a new-p-re">
                                            <p class="new-mu_l2cw">
                                                <span class="title">地址：</span>
                                                <span class="province">浙江</span>省
                                                <span class="city">台州</span>市
                                                <span class="dist">椒江</span>区
                                                <span class="street">台州市政府</span></p>
                                        </div>
                                        <div class="new-addr-btn">
                                            <a href="#"><i class="am-icon-edit"></i>编辑</a>
                                            <span class="new-addr-bar">|</span>
                                            <a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
                                        </div>
                                    </li>

                                    <li class="user-addresslist">
                                        <span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
                                        <p class="new-tit new-p-re">
                                            <span class="new-txt">胡小皓</span>
                                            <span class="new-txt-rd2">159****1622</span>
                                        </p>
                                        <div class="new-mu_l2a new-p-re">
                                            <p class="new-mu_l2cw">
                                                <span class="title">地址：</span>
                                                <span class="province">浙江</span>省
                                                <span class="city">台州</span>市
                                                <span class="dist">椒江</span>区
                                                <span class="street">台州市政府</span></p>
                                        </div>
                                        <div class="new-addr-btn">
                                            <a href="#"><i class="am-icon-edit"></i>编辑</a>
                                            <span class="new-addr-bar">|</span>
                                            <a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
                                        </div>
                                    </li>
                                    <li class="user-addresslist">
                                        <span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
                                        <p class="new-tit new-p-re">
                                            <span class="new-txt">胡小皓</span>
                                            <span class="new-txt-rd2">159****1622</span>
                                        </p>
                                        <div class="new-mu_l2a new-p-re">
                                            <p class="new-mu_l2cw">
                                                <span class="title">地址：</span>
                                                <span class="province">浙江</span>省
                                                <span class="city">台州</span>市
                                                <span class="dist">椒江</span>区
                                                <span class="street">台州市政府</span></p>
                                        </div>
                                        <div class="new-addr-btn">
                                            <a href="#"><i class="am-icon-edit"></i>编辑</a>
                                            <span class="new-addr-bar">|</span>
                                            <a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
                                        </div>
                                    </li>
                                </ul>
                                <div class="clear"></div>
                                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                                <!--例子-->
                                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                                    <div class="add-dress">

                                        <!--标题 -->
                                        <div class="am-cf am-padding">
                                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                                        </div>
                                        <hr/>

                                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                                            <form class="am-form am-form-horizontal">

                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-form-label">收货人</label>
                                                    <div class="am-form-content">
                                                        <input type="text" id="user-name" placeholder="收货人">
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                                    <div class="am-form-content">
                                                        <input id="user-phone" placeholder="手机号必填" type="email">
                                                    </div>
                                                </div>
                                                <!-- <div class="am-form-group">
                                                    <label for="user-address" class="am-form-label">所在地</label>
                                                    <div class="am-form-content address">
                                                        <select data-am-selected>
                                                            <option value="a">浙江省</option>
                                                            <option value="b" selected>湖北省</option>
                                                        </select>
                                                        <select data-am-selected>
                                                            <option value="a">温州市</option>
                                                            <option value="b" selected>武汉市</option>
                                                        </select>
                                                        <select data-am-selected>
                                                            <option value="a">瑞安区</option>
                                                            <option value="b" selected>洪山区</option>
                                                        </select>
                                                    </div>
                                                </div> -->

                                                <div class="am-form-group">
                                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                                    <div class="am-form-content">
                                                        <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                                                        <small>100字以内写出你的详细地址...</small>
                                                    </div>
                                                </div>


                                            </form>
                                        </div>

                                    </div>

                                </div>

                            </div>
                            <!-- <h4 class="billing-address">Billing address</h4> -->


                            <br>

                            <a class="view" href="#" style="float: right;margin-right: 300px;margin-top: 50px;">edit</a>


                            <!-- <a class="view" href="#">edit</a> -->
                        </div>
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
                                        <div><b>账户金额：<i>${customer.balance}</i></b>

                                            <button type="button" class="btn btn-info" style="margin-left: 300px">
                                                <a href="<%=request.getContextPath()%>/recharge.jsp">充值</a>

                                            </button>

                                        </div>
                                        <div><b>密码修改：</i></b>

                                            <button type="button" class="btn btn-info" style="margin-left: 315px">
                                                <a href="<%=request.getContextPath()%>/changein.jsp">密码修改</a>

                                            </button>

                                        </div>


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
                                    <form class="am-form am-form-horizontal">

                                        <div class="am-form-group">
                                            <label for="user-name2" class="am-form-label">昵称</label>
                                            <div class="am-form-content">
                                                <input type="text" id="user-name2" placeholder="nickname">

                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="user-name" class="am-form-label">姓名</label>
                                            <div class="am-form-content">
                                                <input type="text" id="user-name2" placeholder="name">

                                            </div>
                                        </div>
                                        <!--
                                                                                        <div class="am-form-group">
                                                                                            <label class="am-form-label">性别</label>
                                                                                            <div class="am-form-content sex">
                                                                                                <label class="am-radio-inline">
                                                                                                    <input type="radio" name="radio10" value="male" data-am-ucheck> 男
                                                                                                </label>
                                                                                                <label class="am-radio-inline">
                                                                                                    <input type="radio" name="radio10" value="female" data-am-ucheck> 女
                                                                                                </label>
                                                                                                <label class="am-radio-inline">
                                                                                                    <input type="radio" name="radio10" value="secret" data-am-ucheck> 保密
                                                                                                </label>
                                                                                            </div>
                                                                                        </div> -->

                                        <div class="am-form-group">
                                            <label for="user-birth" class="am-form-label">生日</label>
                                            <div class="am-form-content birth">
                                                <div class="birth-select">
                                                    <select data-am-selected>
                                                        <option value="a">2015</option>
                                                        <option value="b">1987</option>
                                                    </select>
                                                    <em>年</em>
                                                </div>
                                                <div class="birth-select2">
                                                    <select data-am-selected>
                                                        <option value="a">12</option>
                                                        <option value="b">8</option>
                                                    </select>
                                                    <em>月</em></div>
                                                <div class="birth-select2">
                                                    <select data-am-selected>
                                                        <option value="a">21</option>
                                                        <option value="b">23</option>
                                                    </select>
                                                    <em>日</em></div>
                                            </div>

                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-phone" class="am-form-label">电话</label>
                                            <div class="am-form-content">
                                                <input id="user-phone" placeholder="telephonenumber" type="tel">

                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-email" class="am-form-label">电子邮件</label>
                                            <div class="am-form-content">
                                                <input id="user-email" placeholder="Email" type="email">

                                            </div>
                                        </div>
                                        <div class="am-form-group address">
                                            <label for="user-address" class="am-form-label">收货地址</label>
                                            <div class="am-form-content address">
                                                <a href="address.html">
                                                    <p class="new-mu_l2cw">
                                                        <span class="province">湖北</span>省
                                                        <span class="city">武汉</span>市
                                                        <span class="dist">洪山</span>区
                                                        <span class="street">雄楚大道666号(中南财经政法大学)</span>
                                                        <span class="am-icon-angle-right"></span>
                                                    </p>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="am-form-group safety">
                                            <label for="user-safety" class="am-form-label">账号安全</label>
                                            <div class="am-form-content safety">
                                                <a href="safety.html">

                                                    <span class="am-icon-angle-right"></span>

                                                </a>

                                            </div>
                                        </div>
                                        <div class="info-btn">
                                            <div class="am-btn am-btn-danger">保存修改</div>
                                        </div>

                                    </form>
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

        $(".btn-show").click(function() {
            var orderId = $(this).data("id");
            var tbody = $(this).parent().next().find("tbody");
            $.ajax({
                type : "post",
                url : "orderdetail",
                data : {
                    "oid" : orderId,
                },
                success : function(data) {

                    if (data.isSuccess == "true") {
                        tbody.html(data.msg);
                    } else {
                        toastr.error(data.msg);
                    }
                }
            });
        });
        $(".btn-show").click(function(){
            $(this).parent().next().toggle(1000);
        })
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>

