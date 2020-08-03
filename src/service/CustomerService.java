package service;

import dao.CustomerDao;
import dto.CartItem;
import dto.CustomerDTO;
import dto.PageBean;
import dto.ShoppingCart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    CustomerDao customerDao = new CustomerDao();

    public List<Map<String, Object>> getPetListByCId(String cid) {
        return customerDao.getPetListById(cid);
    }

    public List<Map<String, Object>> getPetById(String id) {
        return customerDao.getPetById(id);
    }

    public CustomerDTO checkLogin(String name, String pwd) {
        CustomerDTO customer = null;
        List<Map<String,Object>> list = customerDao.checkLogin(name,pwd);
        if (list != null && list.size() > 0){
            Map<String,Object> map = list.get(0);
            customer = new CustomerDTO();
             customer.setEmail(map.get("email").toString());
             customer.setBalance(Double.parseDouble(map.get("balance").toString()));
             customer.setName(map.get("name").toString());
             customer.setId(Integer.parseInt(String.valueOf(map.get("id"))));
        }
        return customer;
    }


    public CustomerDTO getCustomer(String name) {
        CustomerDTO customer = null;
        List<Map<String,Object>> list = customerDao.getCustomer(name);
        if (list != null && list.size() > 0){
            Map<String,Object> map = list.get(0);
            customer = new CustomerDTO();
            customer.setEmail(map.get("email").toString());
            customer.setBalance(Double.parseDouble(map.get("balance").toString()));
            customer.setName(map.get("name").toString());
            customer.setId(Integer.parseInt(String.valueOf(map.get("id"))));
        }
        return customer;
    }
    public void addOrder(ShoppingCart cart,CustomerDTO customer){
        CustomerDao customerDao = new CustomerDao();
        int oid =  customerDao.addOrder(customer.getId(),String.valueOf(cart.getTotalMoney()));
        HashMap<Integer,CartItem> cartItems = cart.getCartItems();
        for (Integer kai : cartItems.keySet()){
            CartItem s = cartItems.get(kai);
            customerDao.addOrderDetail(oid,s.getId(),String.valueOf(s.getPrice()),s.getQuantity());

        }

    }
//    获取客户id列表
    public List<Map<String,Object>> getOrderListByCId(String cid){
        return   customerDao.getOrderListByCId(cid);
    }
//    根据order的id来获取detail
    public List<Map<String, Object>> getOrderDetailListByOId(long oid) {

        return customerDao.getOrderDetailListByOid(oid);
    }


//    获取所有宠物信息
    public List<Map<String,Object>> getPetList() {
        return customerDao.getPetList();
    }

//    更新宠物信息
    public boolean updatePet(String id,String name,double price,String tag,String desc,int stock) {
        return customerDao.updatePet(id,name,price,tag,desc,stock);
    }
//    更新顾客money
    public boolean updateCustomer(String name,double balance) {
        return customerDao.updateCustomer(name,balance);
    }
//    更新顾客密码
    public boolean updateCustomer2(String name,String mi) {
        return customerDao.updateCustomer2(name,mi);
    }

//    插入新宠物
    public boolean addNewPet(String name,double price,String tag,String desc,int stock,String img, boolean offsa,int weight,int c_id) {
        return customerDao.addNewPet(name,price,tag,desc,stock,img,offsa,weight,c_id);
    }
    /*
    管理员权限list页面查询
     */
    public List<Map<String, Object>> getPetListByname1(String cname) {
        return customerDao.getPetListByname1(cname);
    }
    public boolean deleteshu(String id){
        return customerDao.deleteshu(id);
    }
}
