package servlet;

import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
/*
更新宠物信息
 */
@WebServlet(name = "PetOneServlet", urlPatterns = "/petone")
public class PetOneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = null;
        if (request.getParameter("name") !=  null){
            name = request.getParameter("name");
        }

        String id = request.getParameter("id");
        double  price = Double.parseDouble(request.getParameter("price"));
        String tag = request.getParameter("tag");
        String desc = request.getParameter("desc");
        String stock = request.getParameter("stock");
        CustomerService customerService = new CustomerService();
        System.out.println(id);

        if (customerService.updatePet(id,name,price,tag,desc,Integer.parseInt(stock))){
            System.out.println("keyil");
            response.sendRedirect("petlist");
        }else {
            System.out.println("bubu");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
