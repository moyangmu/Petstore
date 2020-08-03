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
        <div class="col-3 col-md">
            <form class="form-signin" action="login" method="post">
                <div class="text-center">
                    <img width="72" height="72" class="mb-4" alt="" src="images/logo.png">
                </div>

                <!-- <h1 class="h3 mb-3 font-weight-normal">请登录</h1> -->
                <label class="sr-only" for="inputName">用户名</label>
                <input class="form-control" id="inputName" autofocus="" required="" type="text" placeholder="用户名" name="username">
                <label class="sr-only" for="inputPassword">密码</label>
                <input class="form-control" id="inputPassword" required="" type="password" placeholder="密码" name="password">
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> 记住我
                    </label>
                </div>
                <button class="btn btn-lg btn-success btn-block" type="submit" id="tijiao">登录</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<script src="toastr/toastr.min.js"></script>
<link rel="stylesheet" href="toastr/toastr.min.css">
<script>
    $(function () {
        $("#tijiao").click(function() {
            var username = $("#inputName").val();
            var password = $("#inputPassword").val();
            $.ajax({
                type : "post",
                url : "login",
                data : {
                    "username" : username,
                    "paswword" : password
                },
                success : function(result) {
                    var msg = '${requestScope.msg}';
                    if (msg != null && msg.length > 0){
                        toastr.error(msg);
                    }

                }
            });
        });


</script>