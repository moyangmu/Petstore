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
获取petlist列表
到petlist页面循环显示
 */
@WebServlet(name = "PetListServlet", urlPatterns = "/petlist")
public class PetListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService customerService = new CustomerService();
        String cid  = null;
        List<Map<String,Object>> allpet = null;
        JsonResult result = new JsonResult();
        result.setSuccess(false);
//        System.out.println(request.getParameter("cname"));
        if (request.getParameter("cname") != null){
//           查询
            String cname = request.getParameter("cname");
            allpet =  customerService.getPetListByname1(cname);
            System.out.println(allpet);
            if (allpet != null && allpet.size() > 0){
                System.out.println("cheng");
                request.getSession().setAttribute("allpet",allpet);
                result.setSuccess(true);
            }else {
                result.setSuccess(false);
            }
            response.setContentType("text/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().println(result);

        }else{
//            未使用查询转到list
             allpet =  customerService.getPetList();
//            System.out.println(allpet);
            request.getSession().setAttribute("allpet",allpet);
            response.sendRedirect("petlist.jsp");

        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
