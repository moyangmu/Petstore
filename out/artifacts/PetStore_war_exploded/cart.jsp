<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/12
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<script src="toastr/toastr.min.js"></script>
<link rel="stylesheet" href="toastr/toastr.min.css">
<link rel="stylesheet" href="styles/cart.css">

<script>
    var id = null;
    $(function () {
        var number = 0;
        var price = 0;
        var total = 0;
        $(".gaibian").change(function () {
            number = $(this).val();
            // price = parseInt($(this).parent().siblings(".product-price").text());
            id = $(this).parent().attr("id");
            console.log(id);
            type = "modify";
            // $(this).parent().siblings(".product_total").text(price*number);
            $.post({
                url: "Cart",
                data: {"id": id, "type": type,"number" : number},
                success: function (result) {
                    // window.location.reload();
                    // alert("ke");
                }
            })
        });
        $(".product_remove1").click(function () {
            // alert("12233");

            id = $(this).siblings(".ceshi").attr("id");
            console.log(id);
            type = "remove";
            $.post({
                url: "Cart",
                data:{ "id": id,"type":type },
                success:function (result) {
                    // window.location.reload();
                    // alert(result);
                    // result = JSON.parse(result);
                    if (result.isSuccess == "false"){
                        window.location.href = "index.jsp";
                    }else {
                        window.location.href = "cart.jsp";
                    }
                    // $("#zhuti").html(result);
                }
            });
        });
    });
    function culTotMon(){
        var totalMoney=0.0;
        var flag=true;
        $("table .xun").each(function(){
            if($(this).find("input[type='checkbox']").is(":checked")){
                var price=$(this).find(".p-price").text();
                // console.log(price);
                var number=$(this).find(".gaibian").val();
                // console.log(number);
                totalMoney+=eval(price*number);
            }else{
                flag=false;
            }
        });
        if(flag==true){
            $("input[name='allcheck']").prop('checked',true);
        }else{
            $("input[name='allcheck']").prop('checked',false);
        }
        $("#price").text(totalMoney.toFixed(1));
    }

    function allChecked() {
        if($("input[name='allcheck']").is(":checked")){
            $("input[name='check']").prop('checked',true);
        }else{
            $("input[name='check']").prop('checked',false);
        }
        culTotMon();
    }

</script>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container">
    <form action="order" method="post">
        <div class="card">
            <div class="card-header">购物车</div>
            <div class="card-body">
                <table class="table panel-body ">
                    <thead>
                    <tr>
                        <td><input type="checkbox" name="allcheck" value="" checked="checked" onclick="allChecked()">全选</td>
                        <td></td>
                        <td>商品名称</td>
                        <td>单价</td>
                        <td>数量</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cart.cartItems.values()}">

                        <tr class="xun">
                            <td>
                                <input type="checkbox" name="check" checked="checked" onclick="culTotMon()" value="${item.id}">
                            </td>
                            <td><img src="petImg/${item.img}" width="80" ></td>
                            <td>${item.name}</td>
                            <td>
                                <span class="p-price">  ${item.price}</span>
                            </td>
                            <td id = "${item.id}" class="ceshi">
                                <input min="1" max="100" value="${item.quantity}" type="number" class="gaibian" onclick="culTotMon()"></td>

                            </td>
                            <td class="product_remove1">
                                <a href="#">X</a>

                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                总计: <div class="pull-right" id="price"> ${cart.totalMoney}</div>
                <br>
                <button class="btn btn-warning  pull-right" type="submit">立即结算</button>
            </div>
        </div>
    </form>

</div>


<jsp:include page="footer.jsp"></jsp:include>