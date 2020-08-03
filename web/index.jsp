<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/4/23
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

<link rel="stylesheet" href="styles/index.css">
<%--<script src="script1/jquery.min.js"></script>--%>

<%--<link rel="stylesheet" href="style1/common.css">--%>
<link rel="stylesheet" href="style1/pagination.css">
<script src="pagination/jquery.pagination.js"></script>
<script>
  function getUrlParam(name){
    // 用该属性获取页面 URL 地址从问号 (?) 开始的 URL（查询部分）
    var url = window.location.search;
    // 正则筛选地址栏
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    // 匹配目标参数
    var result = url.substr(1).match(reg);
    //返回参数值
    return result ? decodeURIComponent(result[2]) : null;
  }
  var search =  getUrlParam("search");//如果参数是中文用这种方法
</script>
</head>
<body>
<%--避免乱码--%>
<%
  request.setCharacterEncoding("utf-8");
%>
  <%
              String cname  = null;
  if (request.getParameter("cname") != null){
               cname = request.getParameter("cname");

  }

  %>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <img src="images/logo.png" width="64" height="64" class="mb-2">
  <h5 class="my-0 mr-md-auto font-weight-normal">宠物商店</h5>
  <a class="btn btn-outline-primary" href="Index?cid=1">猫</a>
  <a class="btn btn-outline-primary" href="Index?cid=2">狗</a>
  <a class="btn btn-outline-primary" href="Index?cid=3">鸟</a>
  <a class="btn btn-outline-primary" href="Index?cid=4" style="margin-right: 522px">鱼</a>
  <div>
    <input type="text" class="form-control" placeholder="Search" id="mySearch">
  </div>
  <button type="submit" class="btn btn-default" id="sear" style="margin-right: 50px">查询</button>

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
  <%--    <a class="btn btn-outline-primary" href="#">登录</a>--%>
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

</div>
<div class="container">
  <div class="card-deck mb-3 text-center">

    <c:forEach var="pet" items="${pageBean.list}">
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <img src="petImg/${pet.img}" class="pet-pic">
      </div>
      <div class="card-body">
        <h1 class="card-title pricing-card-title"><small class="text-muted">${pet.name}</small></h1>
        <p class="pet-desc">${pet.description}</p>
        <p><span class="pet-tag">${pet.tag}</span></p>
        <p class="pet-price">￥${pet.price}</p>
        <a href="detail?id=${pet.id}" class="btn btn-lg btn-block btn-outline-primary">查看详情</a>
      </div>
    </div>
    </c:forEach>
  </div>
  <nav aria-label="Page navigation " style = "text-align: center">
    <ul class="pagination">
      <c:if test="${pageBean.currentPage > 1}">
      <li class="page-item">
        </c:if>
        <c:if test="${pageBean.currentPage <= 1}">
      <li class="page-item disabled">
        </c:if>
<%--        previous标签--%>

          <c:if test="${ !empty param.cname }">
        <a class="page-link" href="Index?currentPage=${pageBean.currentPage-1}&cname=<%=cname%>">Previous</a></li>

      </c:if>
        <c:if test="${ !empty param.cid }">
          <a class="page-link" href="Index?currentPage=${pageBean.currentPage-1}&cid=${param.cid}">Previous</a></li>

       </c:if>
        <c:if test="${empty param.cname and empty param.cid}">
          <a class="page-link" href="Index?currentPage=${pageBean.currentPage-1}">Previous</a></li>
        </c:if>


<%--        <a class="page-link" href="Index?currentPage=${pageBean.currentPage-1}">Previous</a></li>--%>
      <!--循环分页标签-->
      <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
        <c:if test="${pageBean.currentPage == i}">
          <li class="page-item active"><a class="page-link" href="Index?currentPage=${i}">${i}</a></li>
        </c:if>
        <c:if test="${pageBean.currentPage != i}">
        <c:if test="${ !empty param.cname }">

          <li class="page-item"><a class="page-link" href="Index?currentPage=${i}&cname=<%=cname%>">${i}</a></li>
        </c:if>
          <c:if test="${ !empty param.cid }">
            <li class="page-item"><a class="page-link" href="Index?currentPage=${i}&cid=${param.cid}">${i}</a></li>
          </c:if>
          <c:if test="${empty param.cname and empty param.cid}">
            <li class="page-item"><a class="page-link" href="Index?currentPage=${i}">${i}</a></li>
          </c:if>
        </c:if>
      </c:forEach>
      <!--循环分页标签结束-->
      <c:if test="${pageBean.currentPage < pageBean.totalPage}">
      <li class="page-item">
        </c:if>
        <c:if test="${pageBean.currentPage >= pageBean.totalPage}">
      <li class="page-item disabled">
        </c:if>

<%--next标签--%>
          <c:if test="${ !empty param.cname }">
          <a class="page-link" href="Index?currentPage=${pageBean.currentPage+1}&cname=<%=cname%>">Next</a></li>

        </c:if>
        <c:if test="${ !empty param.cid }">
          <a class="page-link" href="Index?currentPage=${pageBean.currentPage+1}&cid=${param.cid}">Next</a></li>

        </c:if>
        <c:if test="${empty param.cname and empty param.cid}">
          <a class="page-link" href="Index?currentPage=${pageBean.currentPage+1}">Next</a></li>
        </c:if>


<%--        <a class="page-link" href="Index?currentPage=${pageBean.currentPage+1}">Next</a></li>--%>

    </ul>
  </nav>
<%--  <br> 共${pageBean.totalRecord }条记录共${pageBean.totalPage }页&nbsp;&nbsp;当前第${pageBean.currentPage }页&nbsp;--%>
</div>

<%--<script src="script1/jquery.min.js"></script>--%>

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
  $(document).ready(function() {
    // var name = document.getElementById("mysearch").value;
    // console.log(name);
    $("#sear").click(function() {
      $.ajax({
        type:"post",
        url:"Index",
        data:{
          cname:document.getElementById("mySearch").value,
          biao:"biao"
        },
        success:function(result){
          if (result.isSuccess == "true") {
            console.log("122222222");
            window.location.replace("index.jsp?cname="+document.getElementById("mySearch").value);
          }
          else{
            console.log("22222222");
            toastr.error("您输入的宠物名有误或者不存在");
          }
        }
      })
    })
  })
</script>
