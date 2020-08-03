package servlet;

import dto.CustomerDTO;
import service.CustomerService;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
/*
充值
 */
@WebServlet(name = "RechargeServlet", urlPatterns = "/recharge")
public class RechargeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("customer");
        String name = customer.getName();
        double balance = customer.getBalance();
        CustomerService customerService = new CustomerService();
        JsonResult result= new JsonResult();
        result.setSuccess(false);
        if (request.getParameter("jia") != null){
            double jia = Double.parseDouble(request.getParameter("jia").toString());
//            System.out.println(balance+jia);
            if (customerService.updateCustomer(name,balance+jia)){
                result.setSuccess(true);
                result.setMsg("充值成功");
                CustomerDTO customer2 = customerService.getCustomer(name);
                request.getSession().setAttribute("customer",customer2);
                result.setMsg2(String.valueOf(customer2.getBalance()));

            }else {
                result.setSuccess(false);
                result.setMsg("充值失败");
            }
        }
        if (request.getParameter("mi") != null){
            String mi = request.getParameter("mi");
            System.out.println(mi);
            if (customerService.updateCustomer2(name,mi)){
                result.setSuccess(true);
                result.setMsg("修改成功");

            }else {
                result.setSuccess(false);
                result.setMsg("修改失败");

            }
        }



        response.setContentType("text/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
