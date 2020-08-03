package service;

import dto.CartItem;
import dto.ShoppingCart;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ShoppingCartService {
    /*
    添加商品进购物车
     */
    public ShoppingCart addToCart(CartItem item, ShoppingCart cart){
        int id = item.getId();
        if (cart.getCartItems().containsKey(id)){
            item.setQuantity(item.getQuantity()+cart.getCartItems().get(id).getQuantity());
        }
//        添加进Map
        cart.getCartItems().put(id,item);
        return refreshTotalCountAndTotalMoney(cart);
    }

    public ShoppingCart addToCart(int id,int quantity,ShoppingCart cart){
        CartItem item = new CartItem();
        item.setId(id);
        item.setQuantity(quantity);
        CustomerService customerService = new CustomerService();
        List<Map<String,Object>> list = customerService.getPetById(String.valueOf(id));
//       链接数据库获取商品信息
        item.setName(list.get(0).get("name").toString());
        item.setImg(list.get(0).get("img").toString());
//        System.out.println(list.get(0).get("name").toString());
        item.setPrice(Double.parseDouble(list.get(0).get("price").toString()));
//        设置总金额
        item.setSubTotal(quantity*item.getPrice());

        return addToCart(item,cart);
    }

    /*
    删除商品
     */
    public ShoppingCart removeFromCart(int id,ShoppingCart cart){
        cart.getCartItems().remove(id);
        return refreshTotalCountAndTotalMoney(cart);
    }
    /*
    刷新商品信息
     */
    public ShoppingCart refreshTotalCountAndTotalMoney(ShoppingCart cart){
        double totalMoney = 0.0;
        int totalCount = 0;
        Collection<CartItem> list =cart.getCartItems().values();
        Iterator<CartItem> it =  list.iterator();
        while (it.hasNext()){
            CartItem item = it.next();
            totalMoney += item.getPrice()*item.getQuantity();
            totalCount += item.getQuantity();
        }
        cart.setTotalCount(totalCount);
        cart.setTotalMoney(totalMoney);
        return cart;
    }
}
