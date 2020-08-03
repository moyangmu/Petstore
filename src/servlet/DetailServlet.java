package servlet;

import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DetailServlet", urlPatterns = "/detail")
public class DetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        CustomerService customerService = new CustomerService();
        List<Map<String,Object>> list = customerService.getPetById(id);
        System.out.println(list);
        request.setAttribute("list",list);
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
}
