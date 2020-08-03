package servlet;

import service.CustomerService;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
/*
获得单个pet的数据，
进入编辑页面
 */
@WebServlet(name = "PetEditServlet", urlPatterns = "/petedit")
public class PetEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService customerService = new CustomerService();
        String type= request.getParameter("type");
        JsonResult result = new JsonResult();
        result.setSuccess(false);
        if (request.getParameter("petid") != null){
            if (type == "edit" || type.equals("edit")){
                int id = Integer.parseInt(request.getParameter("petid"));
                List<Map<String,Object>> pet = (List<Map<String, Object>>) request.getSession().getAttribute("allpet");
                request.getSession().setAttribute("pet1",pet.get(id-2));
                response.sendRedirect("petedit.jsp");
            }
        }
        if (type.equals("add")){

            String name =request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String tag = request.getParameter("tag");
            String desc = request.getParameter("desc");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int weight = Integer.parseInt(request.getParameter("weight"));
            String img = request.getParameter("img");
            boolean offsa = Boolean.parseBoolean(request.getParameter("offsa"));
            int c_id = Integer.parseInt(request.getParameter("c_id"));
            System.out.println(offsa);
            if (customerService.addNewPet(name,price,tag,desc,stock,img,offsa,weight,c_id)){
                result.setSuccess(true);
                System.out.println("okok");
            }else {
                result.setSuccess(false);
                System.out.println("11111kkkk");
            }
            response.setContentType("text/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().println(result);
        }
        if (type.equals("delete")){
            String id =request.getParameter("petid");

            if (customerService.deleteshu(id)){

                System.out.println("okok");
                response.sendRedirect("petlist");
            }else {
                response.sendRedirect("petlist");
            }
            response.setContentType("text/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().println(result);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
