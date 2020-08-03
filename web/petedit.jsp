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
<link rel="stylesheet" href="dropzone/dropzone.css">
<link rel="stylesheet" href="style1/pagination.css">
<script src="pagination/jquery.pagination.js"></script>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container">

    <div class="row" style="text-align: center">
        <form method="post" action="<%=request.getContextPath()%>/petone" style="margin: auto">
            <div class="form-group">
                <label for="exampleInputEmail1" hidden="hidden">id</label>
                <input type="text" class="form-control" id="example" value="${pet1.id}" name="id" hidden="hidden">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">name</label>
                <input type="text" class="form-control" id="exampleInputEmail1" value="${pet1.name}" name="name">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">price</label>
                <input type="text" class="form-control" id="exampleInputPassword1" value="${pet1.price}" name="price">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword2">tag</label>
                <input type="text" class="form-control" id="exampleInputPassword2" value="${pet1.tag}" name="tag">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword3">description</label>
                <input type="text" class="form-control" id="exampleInputPassword3" value="${pet1.description}" name="desc">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword4">库存</label>
                <input type="text" class="form-control" id="exampleInputPassword4" value="${pet1.stock}" name="stock">
            </div>

            <div class="form-group">
               <label for="img">图片</label>
               <input type="text" name = "img" class="form-control" id="img" placeholder="上传图片" required value="${pet.img}" readonly>
                <div id="myId" class="dropzone"></div>
                <div class="invalid-feedback">
                    请选择宠物图片
                </div>
            </div>

            <div class="form-group">
                <select id="auth_access" class="form-control ">
                    <option value="true">true</option>
                    <option value="false">false</option>
                </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
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
<script src="dropzone/dropzone.js"></script>
<script>

    if (${pet1.is_offsale}){
        // console.log("qu");
        document.getElementById('auth_access')[0].selected = true ;
    }else {
        // console.log("daol");
        document.getElementById('auth_access')[1].selected =  true;
    }
    $("#cid").val(${pet.c_id});
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("div#myID",{
        url : "image/upload",
        paramName : "dropFile",
        maxFiles: 1,
        maxFilesize: 2,
        acceptedFiles : '.jpg,.gif,.png,.jpeg',
        addRemoveLinks: true,
        parallelUploads: 1 ,
        dictDefaultMessage:'拖动文件至此点击上传',
        dictMaxFilesExceeded: '您最多只能上传一个文件!',
        dictResponseError: '文件上传失败',
        dictInvalidFileType: '文件类型只能是.*jpg,*.gif,*.png,*.jpeg',
        dictFallbackMessage: '浏览器不支持',
        dictRemoveLinks: "删除",
        dictCancelUpload: "取消",
        init: function () {
            this.on('success',function (file,result) {
                var json = JSON.parse(result);
                if (json.success === true){
                    toastr.success(json.msg);
                    $("#img").val(json.data.imageName);
                }else {
                    toastr.error(json.msg);
                }
            });
        }
    })
</script>