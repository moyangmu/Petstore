<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/5/5
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <img src="images/logo.png" width="64" height="64" class="mb-2">
    <h5 class="my-0 mr-md-auto font-weight-normal">宠物商店</h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="Index">首页</a>
        <c:if test="${customer != null }">
            <c:if test="${customer.name == '管理员'}">
                <a class="p-2 text-dark" href="petlist">${customer.name}</a>
            </c:if>
            <c:if test="${customer.name != '管理员'}">
                <a class="p-2 text-dark" href="order">${customer.name}</a>

            </c:if>
        </c:if>
        <c:if test="${customer == null}">
            <a class="p-2 text-dark" href="login">请登录</a>
        </c:if>
        <a class="p-2 text-dark" href="Cart">购物车(
            <span id="cartcount">${empty cart.totalCount ? 0 : cart.totalCount}</span>
            )</a>
        <a class="p-2 text-dark" href="#">联系客服</a>
    </nav>

    <c:if test="${customer != null }">
    <button type="button" class="btn btn-primary" >
        <a href="login" style="color: white">登出</a>

    </button>
    </c:if>
    <c:if test="${customer == null }">
        <button type="button" class="btn btn-primary">
            <a href="login" style="color:white;">登陆</a>
        </button>
    </c:if>
<%--    <a class="btn btn-outline-primary" href="Index?cid=1">猫</a>--%>
<%--    <a class="btn btn-outline-primary" href="Index?cid=2">狗</a>--%>
<%--    <a class="btn btn-outline-primary" href="Index?cid=3">鸟</a>--%>
<%--    <a class="btn btn-outline-primary" href="Index?cid=4">鱼</a>--%>
<%--    <a class="btn btn-outline-primary" href="#">登录</a>--%>


</div>
