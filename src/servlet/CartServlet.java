package servlet;

import dto.CartItem;
import dto.ShoppingCart;
import service.ShoppingCartService;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

@WebServlet(name = "CartServlet", urlPatterns = "/Cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoppingCartService shoppingCartService = new ShoppingCartService();
        ShoppingCart cart;
        if (request.getSession().getAttribute("cart") == null){
            cart = new ShoppingCart();
            request.getSession().setAttribute("cart",cart);
        }else {
            cart = (ShoppingCart) request.getSession().getAttribute("cart");
        }
        String type = request.getParameter("type");
        if (type == null){
            type = "get";
        }
        JsonResult result= new JsonResult();
        result.setSuccess(true);
        String id  = null;
        String quantity = null;

        switch (type) {
            case "get" :
                request.getRequestDispatcher("cart.jsp").forward(request,response);
            break;
            case "add":
                 id = request.getParameter("id");
                if (id == null){
                    result.setMsg("商品id参数不正确");
                    result.setSuccess(false);
                }
                 quantity = request.getParameter("quantity");
                if (quantity == null){
                    result.setMsg("商品数量参数不正确");
                    result.setSuccess(false);
                }
                if (result.getSuccess() == true){

                    cart = shoppingCartService.addToCart(Integer.parseInt(id),Integer.parseInt(quantity),cart);

                    request.getSession().setAttribute("cart",cart);
                    result.setMsg2(String.valueOf(cart.getTotalCount()));
                    result.setMsg("加入购物车完成");
                }

                break;
            case "remove":
                 id = request.getParameter("id");
                if (id == null){
                    result.setMsg("商品id参数不正确");
                    result.setSuccess(false);

                }

                cart =  shoppingCartService.removeFromCart(Integer.parseInt(id),cart);
                request.getSession().setAttribute("cart",cart);
                break;
            case "modify":
                HashMap<Integer, CartItem> suoyou = cart.getCartItems();
                id = (request.getParameter("id"));
                Integer id2 = Integer.parseInt(id);
                System.out.println(id2);
                Integer number = Integer.parseInt(request.getParameter("number"));
                CartItem cc  = null;
                for (Integer key : suoyou.keySet()) {
                    if (id2 == key) {
                        cc = suoyou.get(id2);
                        cc.setQuantity(number);
                    }
                }
                if (cc != null){
                    suoyou.put(id2,cc);
                }
                cart.setCartItems(suoyou);
                cart = shoppingCartService.refreshTotalCountAndTotalMoney(cart);

                request.getSession().setAttribute("cart",cart);

                break;

        }
//        if (type.equals("get")){
//            request.getRequestDispatcher("cart.jsp").forward(request,response);
//        }
//        JsonResult result= new JsonResult();
//        result.setSuccess(true);
//
//        if (type.equals("add")){
//            String id = request.getParameter("id");
//            if (id == null){
//                result.setMsg("商品id参数不正确");
//                result.setSuccess(false);
//            }
//            String quantity = request.getParameter("quantity");
//            if (quantity == null){
//                result.setMsg("商品数量参数不正确");
//                result.setSuccess(false);
//            }
//            if (result.getSuccess() == true){
//
//                cart = shoppingCartService.addToCart(Integer.parseInt(id),Integer.parseInt(quantity),cart);
//
//                request.getSession().setAttribute("cart",cart);
//                result.setMsg2(String.valueOf(cart.getTotalCount()));
//                result.setMsg("加入购物车完成");
//            }
//
//        }

//        if (type.equals("remove")){
//            String id = request.getParameter("id");
//            if (id == null){
//                result.setMsg("商品id参数不正确");
//                result.setSuccess(false);
//
//            }
//
//            cart =  shoppingCartService.removeFromCart(Integer.parseInt(id),cart);
//            request.getSession().setAttribute("cart",cart);
//        }

//        if (type.equals("modify")) {
//            HashMap<Integer, CartItem> suoyou = cart.getCartItems();
//            Integer id = Integer.parseInt(request.getParameter("id"));
//            Integer number = Integer.parseInt(request.getParameter("number"));
//            CartItem cc  = null;
//            for (Integer key : suoyou.keySet()) {
//                if (id == key) {
//                     cc = suoyou.get(id);
//                    cc.setQuantity(number);
//                }
//            }
//            if (cc != null){
//                suoyou.put(id,cc);
//            }
//            cart.setCartItems(suoyou);
//             cart = shoppingCartService.refreshTotalCountAndTotalMoney(cart);
//
//            request.getSession().setAttribute("cart",cart);

//        }
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
