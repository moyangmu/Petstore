package util;

import java.util.HashMap;

public class JsonResult {
    private Boolean success;
    private String msg;
    private String msg2;
    private double totalmoney;
    private double totalcount;
    private HashMap<String,Object> data;

    public HashMap<String, Object> getData() {
        return data;
    }

    public void setData(HashMap<String, Object> data) {
        this.data = data;
    }

    public void addDate(String key, Object value){
        if (data == null){
            data = new HashMap<>();
        }
        data.put(key,value);
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public double getTotalcount() {
        return totalcount;
    }

    public void setTotalcount(double totalcount) {
        this.totalcount = totalcount;
    }

    @Override
    public String toString() {
        return String.format(
                "{\"isSuccess\":\"%s\",\"msg\":\"%s\",\"msg2\":\"%s\"}",
                getSuccess(),getMsg(),getMsg2()
        );
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg2() {
        return msg2;
    }

    public void setMsg2(String msg2) {
        this.msg2 = msg2;
    }

}
