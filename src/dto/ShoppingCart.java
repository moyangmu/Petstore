package dto;

import java.util.HashMap;

public class ShoppingCart {
    private HashMap<Integer,CartItem> cartItems;
    private int totalCount;
    private double totalMoney;

    public ShoppingCart() {
        this.cartItems = new HashMap<Integer, CartItem>();
    }
    /*
    存放商品
     */
    public HashMap<Integer, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Integer, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    /*
    计算商品总数
     */
    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    /*
    计算商品总价格
     */
    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
}
