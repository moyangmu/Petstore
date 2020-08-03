<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/6/13
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%--付费页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<%

    String path = request.getContextPath();
    String basePath =
            request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>recharge1/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>recharge1/css/main.css" />
<jsp:include page="menu.jsp"></jsp:include>

<div class="pay">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
        <div class="tr_rechtext">
            <p class="te_retit"><img src="<%=basePath%>recharge1/images/coin.png" alt="" />充值中心</p>
        </div>
<%--        <form action="recharge" class="am-form" id="doc-vld-msg">--%>
            <div class="tr_rechbox">
                <div class="tr_rechhead">
                    <img src="<%=basePath%>recharge1/images/ys_head2.jpg" />
                    <p>充值帐号：
                        <a id="zhang">${customer.name}</a>
                    </p>
                    <div class="tr_rechheadcion">
                        <img src="<%=basePath%>recharge1/images/coin.png" alt="" />
                        <span>当前余额：<span id="qian">${customer.balance}</span></span>
                    </div>
                </div>
                <div class="tr_rechli am-form-group">
                    <ul class="ui-choose am-form-group" id="uc_01">
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10元
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20元
                            </label>
                        </li>

                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50元
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额
                            </label>
                        </li>
                    </ul>
                    <!--<span>1招兵 币=1元 10元起充</span>-->
                </div>
                <div class="tr_rechoth am-form-group">
                    <span>其他金额：</span>
                    <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" style="margin-top: 15px"/>
                    <!--<p>充值金额范围：10-10000元</p>-->
                </div>
                <div class="tr_rechcho am-form-group">
                    <span>充值方式：</span>
                    <label class="am-radio">
                        <input type="radio" name="radio1" value="" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="<%=basePath%>recharge1/images/wechatpay.png">
                    </label>
                    <label class="am-radio" style="margin-right:30px;">
                        <input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="<%=basePath%>recharge1/images/zfbpay.png">
                    </label>
                </div>
                <div class="tr_rechnum">
                    <span>应付金额：</span>
                    <p class="rechnum" id="jia">0.00元</p>
                </div>
            </div>
            <div class="tr_paybox">
                <input type="submit" value="确认支付" class="tr_pay am-btn" id="btn-addtocart"/>
            </div>
<%--        </form>--%>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>recharge1/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>recharge1/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>recharge1/js/ui-choose.js"></script>
<script type="text/javascript">
    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function(index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function(index, item) {
        console.log('change', index, item.text())
    }
    $(function() {
        $('#uc_01 li:eq(3)').click(function() {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('10.00元');
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('10.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('20.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('50.00元');
            $('.othbox').val('');
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + ".00元");
            });
        });
    })

    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },
            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if(!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }
                $alert.html(msg).show();
            }
        });
    });
</script>
<script>
    $(document).ready(function() {

        // console.log("11111")
        $("#btn-addtocart").click(function() {

            var jia = $("#jia").text();
            jia = jia.substr(0,jia.length-1);
            var name = $("#zhang").text();
            console.log(jia);
            console.log(name);
            //通知服务端修改Session中购物车内容

            $.ajax({
                type : "post",
                url : "recharge",
                data : {
                    "name" : name,
                    "jia" : jia
                },
                success : function(result) {
                    //当服务端正常运行完成，并返回json数据时，修改界面上的内容
                    if (result.isSuccess == "true") {
                        console.log("1111");
                        console.log(${customer.balance});
                        console.log(result.msg2);
                        $("#qian").html(result.msg2);

                        toastr.success(result.msg);

                    } else {
                        console.log("222");
                        toastr.error(result.msg);
                    }
                }
            });
        });
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>

