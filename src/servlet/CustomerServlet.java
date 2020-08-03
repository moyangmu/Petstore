package servlet;

import dto.CustomerDTO;
import org.apache.catalina.Session;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/login")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        if ( name == null || password == null){
            request.setAttribute("msg","Name或密码不能为空");
            doGet(request,response);
        }else {
            CustomerService customerService  = new CustomerService();
            CustomerDTO customer = customerService.checkLogin(name,password);
            if (customer != null ){
                request.getSession().setAttribute("customer",customer);
                if(customer.getName() == "管理员" || customer.getName().equals("管理员")){
                    response.sendRedirect("petlist");
                }else {
//                    System.out.println("1111111");
                    response.sendRedirect("Index");
                }

            }else {
                request.setAttribute("msg","Name或密码不正确");
                doGet(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("customer") == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            request.getSession().setAttribute("customer",null);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
