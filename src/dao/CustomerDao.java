package dao;

import java.util.List;
import java.util.Map;

public class CustomerDao extends BaseDao{
    public List<Map<String,Object>> getPetListById(String cid){
        if (cid == null || cid.isEmpty()){
            String sql = "select * from pet where is_offsale = 0 order by id limit 3 ";
            return select(sql,null);
            
        }else {
            String sql = "select * from pet where is_offsale = 0 and c_id = ? order by id limit 3";
            Object param[] = {cid};
            return select(sql,param);
        }
    }

    /*
    插入新的商品
     */
    public boolean addNewPet(String name,double price,String tag,String desc,int stock,String img, boolean offsa,int weight,int c_id){
        String sql = "INSERT INTO pet  (c_id,name,tag,img,price,stock,description,weight,is_offsale,score,on_sale_time)  VALUES  (?,?,?,?,?,?,?,?,?,0,NOW());";
        Object param[] = {c_id,name,tag,img,price,stock,desc,weight,offsa};
        return upadateByParams(sql,param);


    }

//    更新顾客money
    public boolean updateCustomer(String name,double balance){
        String sql = "update customer set balance = ? where name = ?";
        Object param[] = {balance,name};
        return upadateByParams(sql,param);
    }
//    跟新顾客密码
    public boolean updateCustomer2(String name,String mi){
        String sql = "update customer set pwd = ? where name = ?";
        Object param[] = {mi,name};
        return upadateByParams(sql,param);
    }
//    更新宠物信息
    public boolean updatePet(String id,String name,double price,String tag,String desc,int stock){
        String sql = "update pet set name = ? , price = ?, tag = ? , description = ? , stock = ? where id = ?";
        Object param[] = {name,price,tag,desc,stock,id};
        return upadateByParams(sql,param);
    }
//    获取所有宠物信息
    public List<Map<String,Object>> getPetList() {
        String sql = "select * from pet where is_offsale = 0 order by id ";
        return select(sql,null);

    }


    public List<Map<String,Object>> getPetById(String id){
        String sql = "select * from pet where is_offsale = 0 and id = ?";
        Object param[] = {id};
        return select(sql,param);
    }
    public List<Map<String,Object>> checkLogin(String name, String pwd){
        String sql = "select * from customer where name = ? and pwd = ? ";
        Object param[] = {name,pwd};
        return select(sql,param);
    }
    public List<Map<String,Object>> getCustomer(String name){
        String sql = "select * from customer where name = ? ";
        Object param[] = {name};
        return select(sql,param);
    }
    public int addOrder(int cid,String money){
        String sql = "insert into `order` values(null,?,?,?,now())";
        Object param[] = {cid,money,"0"};
        String sql1 = "select LAST_INSERT_ID() from `order` ";
        return getLastId(sql,sql1,param);
    }

    public boolean addOrderDetail(int oid,int pid,String price,int quantity){
        String sql = "insert into orderdetail values(null,?,?,?,?)";
        Object param[] =  {oid,pid,price,quantity};
        return upadateByParams(sql,param);
    }
    public List<Map<String,Object>> getOrderListByCId(String cid){
        String sql = "select * from `order` where cid=? order by id desc ";
        Object param[] = {cid};
        return select(sql,param);
    }
    public List<Map<String,Object>> getPetListByname(String cname,int startIndex){
            String sql = "select * from pet where name like ? order by id limit ? , 6";
            Object param[] = {'%'+cname+'%',startIndex};
            return select(sql,param);
    }
    public boolean deleteshu(String id){
        String sql = "delete from pet where id = ?";
        Object param[] =  {id};
        return upadateByParams(sql,param);
    }
    /*
    获取所有的pet不分页
     */
    public List<Map<String,Object>> getPetListByname1(String cname){
        String sql = "select * from pet where name like ? order by id ";
        Object param[] = {'%'+cname+'%'};
        return select(sql,param);
    }

//    分页
    public List<Map<String, Object>> Count(String cid){
    if (cid == null || cid.isEmpty()) {
        String sql = "select Count(*) as count from pet";
        return select(sql,null);
    }
    else {
        String sql = "select count(*) as count from pet where c_id = ?";
        Object param[] = {cid};
        return select(sql, param);
    }
    }
    public List<Map<String, Object>> Count1(String cname){
//        if (cid == null || cid.isEmpty()) {
//            String sql = "select Count(*) as count from pet";
//            return select(sql,null);
//        }
//        else {
            String sql = "select count(*) as count from pet where name like ?";
            Object param[] = {'%'+cname+'%'};
            return select(sql, param);
//        }
    }
    //默认每页显示6条记录
    public List<Map<String,Object>> getPetListByPage(int startIndex,String cid){
        String sql = "";
        if (cid == null || cid.isEmpty())
        {
            sql = "select * from pet where is_offsale = 0  limit ?, 6";
            Object param[] = {startIndex};
            return select(sql,param);
        }
        else
        {
            sql = "select * from pet where is_offsale = 0 and c_id = ? limit ?, 6";
            Object param[] = {cid, startIndex};
            return select(sql,param);
        }

    }

//    根据订单id来获取订单详情
    public List<Map<String, Object>> getOrderDetailListByOid(long oid ) {
        String sql = "select * from orderdetail where oid=?";
        Object param[] = {oid};
        return select(sql, param);
    }
}
