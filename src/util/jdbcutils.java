package util;

import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Properties;

public class jdbcutils {
    private static String url;
    private static String user;
    private static String password;
    private static String driver;
    static {
//        读取资源文件获取值
//        1.Properties

        try {
            Properties pro =new Properties();

//            获取src路径下的方式
//            ClassLoader classLoader = jdbcutils.class.getClassLoader();
//            URL res = classLoader.getResource("jdbc.properties");
//            String path =res.getPath();
//            System.out.println(path);




            //            2.加载文件
            pro.load(new FileReader("src/jdbc.properties"));
            //                pro.load(new FileReader(path));
            url = "jdbc:mysql://47.95.13.8:3306/shopping?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
            user = "root";
            password = "123456";
            driver ="com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //    获取连接，返回连接对象
    public static Connection getConnection() throws SQLException {

        return DriverManager.getConnection(url,user,password);

    }
    //    释放资源
    public  static void close(Statement stmt,Connection conn){
        if (stmt!=null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public  static void close(Statement stmt,Connection conn,ResultSet rs){
        if (rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (stmt!=null){
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}