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
<%--    <h1>插入宠物数据</h1>--%>
    <div class="row" style=";width: 250px;margin: 0px auto;text-align: center">
        <h1>插入宠物数据</h1>
            <div class="form-group" style="width: 250px">
                <label for="name">name</label>
                <input type="text" class="form-control" id="name" value="" name="name">
            </div>
        <div class="form-group" style="width: 250px">

        <label for="price">price</label>
                <input type="text" class="form-control" id="price" value="" name="price">
            </div>
        <div class="form-group" style="width: 250px">

        <label for="tag">tag</label>
                <input type="text" class="form-control" id="tag" value="" name="tag">
            </div>
        <div class="form-group" style="width: 250px">

        <label for="desc">description</label>
                <input type="text" class="form-control" id="desc" value="" name="desc">
            </div>
        <div class="form-group" style="width: 250px">

        <label for="stock">库存</label>
                <input type="text" class="form-control" id="stock" value="" name="stock">
            </div>
        <div class="form-group" style="width: 250px">

            <label for="weight">重量</label>
            <input type="text" class="form-control" id="weight" value="" name="stock">
        </div>
        <div class="form-group" style="width: 250px">

        <label for="img">图片</label>
                <input type="text" name = "img" class="form-control" id="img" placeholder="上传图片" required value="${pet.img}" readonly>
                <div id="myId" class="dropzone"></div>
                <div class="invalid-feedback">
                    请选择宠物图片
                </div>
        </div>
        <br>
        <div style="text-align: center;width: 250px">

            <label for="auth_access">销售状态</label>
                <select id="auth_access" class="form-control ">
                    <option value="true">true</option>
                    <option value="false">false</option>
                </select>
        </div>
        <br>
        <div style="text-align: center;width: 250px">

        <label for="c_id">种类</label>
                <select id="c_id" class="form-control ">
                    <option value="1">猫</option>
                    <option value="2">狗</option>
                    <option value="3">鸟</option>
                    <option value="4">鱼</option>
                </select>
        </div>
        <br>
        <div style="text-align: center;width: 250px">

        <button type="submit" class="btn btn-success" id="addToPet" style="margin-top: 20px;width: 150px">Submit</button>
        </div>

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
<script>
    $(document).ready(function() {

        // console.log("11111")
        $("#addToPet").click(function() {


            var name = $("#name").val();
            var price = $("#price").val();
            var tag= $("#tag").val();
            var desc = $("#desc").val();
            var stock = $("#stock").val();
            var img = $("#img").val();
            var offsa = $("#auth_access").val();
            var c_id = $("#c_id").val();
            var weight = $("#weight").val();
            //通知服务端修改Session中购物车内容
            console.log(c_id);
            $.ajax({
                type : "post",
                url : "petedit",
                data : {
                    "name" : name,
                    "price": price,
                    "tag": tag,
                    "desc" :desc,
                    "stock": stock,
                    "img": img,
                    "offsa": offsa,
                    "c_id": c_id,
                    "weight": weight,
                    "type": "add"
                },
                success : function(result) {
                    //当服务端正常运行完成，并返回json数据时，修改界面上的内容
                    if (result.isSuccess == "true") {
                        // console.log("1111");
                        toastr.success("添加成功");

                    } else {
                        // console.log("222");
                        toastr.error("添加失败");
                    }
                }
            });
        });
    });
</script>