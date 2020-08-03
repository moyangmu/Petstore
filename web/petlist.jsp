<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/26
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

<link rel="stylesheet" href="styles/index.css">
<jsp:include page="menu.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div>
            <input type="text" class="form-control" placeholder="Search" id="mySearch">
        </div>
        <button class="btn btn-default" id="sear">查询</button>

        <button type="button" class="btn btn-info" style="margin-left: 20px">
            <a style="color: black" href="petadd.jsp">增加</a>
        </button>
        <table class="table table-hover" style="margin-top: 30px">



            <tr>
                <th>编号</th>
                <th>名称</th>
                <th>图片</th>

                <th>价格</th>
                <th>库存</th>
                <th>销售状态</th>
                <th>操作</th>

            </tr>
            <c:forEach var="pet" items="${allpet}">
            <tr>
                <th>${pet.id}</th>
                <th>${pet.name}</th>
                <th>
                    <img src="petImg/${pet.img}" class="pet-pic" style="width: 50px;height: 50px">
                </th>
                <th>${pet.price}</th>
                <th>${pet.stock}</th>
                <th>${pet.is_offsale}</th>


                <th>
                    <button type="button" class="btn btn-info">
                        <a href="petedit?petid=${pet.id}&type=edit" style="color: black">编辑</a>
                    </button>
                    <button type="button" class="btn btn-primary">
                        <a href="petedit?petid=${pet.id}&type=delete" style="color: black">删除</a>
                    </button>

                </th>
            </tr>
            </c:forEach>

            </div>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<script src="toastr/toastr.min.js"></script>
<link rel="stylesheet" href="toastr/toastr.min.css">
<script type="text/javascript">
    $(document).ready(function() {
        // var name = document.getElementById("mysearch").value;
        // console.log(name);
        $("#sear").click(function() {
            // console.log("dddd");
            $.ajax({
                type:"post",
                url:"petlist",
                data:{
                    cname:document.getElementById("mySearch").value,
                },
                success:function(result){
                    if (result.isSuccess=="true") {
                        console.log("122222222");
                        window.location.replace("petlist.jsp");
                    }
                    else{
                        console.log("cio");
                        toastr.error("您查询的宠物名有误或者不存在");
                    }
                }
            })
        })
    })
</script>