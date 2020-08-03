<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/4/29
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<link rel="stylesheet" href="styles/detail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<script src="toastr/toastr.min.js"></script>
<link rel="stylesheet" href="toastr/toastr.min.css">
<%--<script src="//cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>--%>

<script>
    $(document).ready(function() {
        if(!$("#cartcount").html()){
            $("#cartcount").html("0");
        }
        // console.log("11111")
        $("#btn-addtocart").click(function() {

            var quantity = $("#kucun").val();
            var type = "add";
            var id = $("#petId").val();
            var ku = $("#pet-stock").html();
            //通知服务端修改Session中购物车内容

            $.ajax({
                type : "post",
                url : "Cart",
                data : {
                    "id" : id,
                    "quantity" : quantity,
                    "type" : "add"
                },
                success : function(result) {

                    //当服务端正常运行完成，并返回json数据时，修改界面上的内容
                    if (result.isSuccess == "true") {
                        console.log("1111");
                        toastr.success(result.msg);
                        $("#cartcount").html(result.msg2);

                    } else {
                        console.log("222");
                        toastr.error("加入购物袋失败：" + result.msg);
                    }
                }
            });
        });
    });
</script>
<jsp:include page="menu.jsp"></jsp:include>
<div class="container">
    <c:forEach var="pet" items="${requestScope.list}">
    <div class="row">
        <div class="col-md-12">
            <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col-auto d-none d-lg-block">
                    <img src="petImg/${pet.img}" width="300" heght="400" class="mb-2">
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                    <h3 class="d-inline-block mb-2 text-dark">${pet.name}</h3>

                    <div class="mb-2 text-muted"><span class="pet-tag">${pet.tag}</span><span class="pet-tag">温顺</span></div>

                    <p class="card-text">${pet.description}</p>
                    <p>￥<span id="pet-price">${pet.price}</span></p>
                    <p>库存 (<span id="pet-stock">${pet.stock}</span>)</p>
                    <input type="number" min="1" max="${pet.stock}" value="1" id="kucun">
                    <nav>
                        <input type="hidden" id="petId" value="${pet.id}">
                        <button id="btn-addtocart" class="btn btn-warning" type="button">加入购物车</button>
                        <button class="btn btn-warning" type="button">
                            返回列表
                        </button>
                    </nav>

                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
<jsp:include page="footer.jsp"></jsp:include>

