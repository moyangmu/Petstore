package servlet;

import com.alibaba.fastjson.JSON;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet(name = "ImageUploadServlet", urlPatterns = "/image/upload")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part dropFile = request.getPart("dropFile");
        JsonResult jsonResult = new JsonResult();
        if (dropFile != null){
            String fileName = dropFile.getSubmittedFileName();
            fileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            String filePath  =getServletContext().getRealPath("petImg") + File.separator + fileName;
            System.out.println(filePath);

            dropFile.write(filePath);
            jsonResult.setSuccess(true);
            jsonResult.setMsg("图片上传成功");
            jsonResult.addDate("imageName",fileName);
        }else {
            jsonResult.setSuccess(false);
            jsonResult.setMsg("图片上传失败");
        }
        response.setContentType("text/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(JSON.toJSONString(jsonResult));
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
