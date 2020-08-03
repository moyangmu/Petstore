package servlet;

import dto.CustomerDTO;
import dto.ShoppingCart;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderServlet", urlPatterns = "/order")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("customer") != null){
            CustomerDTO customer = (CustomerDTO)request.getSession().getAttribute("customer");
            CustomerService customerService = new CustomerService();
            ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            if (cart == null || cart.getTotalCount() == 0){
                request.setAttribute("msg","购物车为空,创建订单失败");
                request.getRequestDispatcher("cart.jsp").forward(request,response);
            }else {
                customerService.addOrder(cart,customer);
                request.getSession().setAttribute("msg","创建订单成功");
                doGet(request,response);
            }

        }else {
            response.sendRedirect("login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDTO customer = (CustomerDTO)request.getSession().getAttribute("customer");
        if (customer == null){
            response.sendRedirect("login");
        }else {
            CustomerService customerService = new CustomerService();
            List<Map<String,Object>> orderList  = customerService.getOrderListByCId(String.valueOf(customer.getId()));
            String strDateFormat = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
            sdf.format(orderList.get(0).get("date"));
            for (Map<String,Object> s : orderList){
                s.put("date",sdf.format(s.get("date")));
            }
//            System.out.println(orderList);
            request.getSession().setAttribute("orderList",orderList);
            request.getRequestDispatcher("account.jsp").forward(request,response);
        }
    }
}
