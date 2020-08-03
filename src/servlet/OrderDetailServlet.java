package servlet;

import service.CustomerService;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderDetailServlet", urlPatterns = "/orderdetail")
public class OrderDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonResult result = new JsonResult();
        String oid = request.getParameter("oid");
        System.out.println(oid);
        result.setSuccess(true);
        if(oid == null) {
            result.setMsg("订单参数不正确");
            result.setSuccess(false);
        }
        if(result.getSuccess() == true) {
            System.out.println("ena");
            CustomerService customerService = new CustomerService();
            List<Map<String, Object>> orderDeListList = customerService.getOrderDetailListByOId(Long.parseLong(oid));
            System.out.println(orderDeListList);
            String msgString = "";

            for(Map<String, Object> map : orderDeListList) {
//                System.out.println(customerService.getPetById(String.valueOf(map.get("pid"))));
                DecimalFormat df = new DecimalFormat("0.00");
                double price = Double.parseDouble((map.get("price").toString()));
                double quantity = Double.parseDouble(map.get("quantity").toString());
                String money = df.format(price*quantity);
                System.out.println(price*quantity);
                msgString += String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
                        customerService.getPetById(String.valueOf(map.get("pid"))).get(0).get("name"),df.format(price),map.get("quantity"),money);
            }
//            System.out.println(msgString);
            result.setMsg(msgString);

        }
        //输出Json数据到客户端浏览器
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}
