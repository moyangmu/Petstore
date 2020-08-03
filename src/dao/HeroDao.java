package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Hero;

public class HeroDao {

    public HeroDao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://47.95.13.8:3306/shopping?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC", "root",
                "123456");
    }

    public int getTotal() {
        int total = 0;
        try (Connection c = getConnection(); Statement s = c.createStatement();) {

            String sql = "select count(*) from pet";

            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }

            System.out.println("total:" + total);

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return total;
    }

//    public void add(Hero hero) {
//
//        String sql = "insert into hero values(null,?,?,?)";
//        try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
//
//            ps.setString(1, );
//            ps.setFloat(2, hero.hp);
//            ps.setInt(3, hero.damage);
//
//            ps.execute();
//
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                int id = rs.getInt(1);
//                hero.id = id;
//            }
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//        }
//    }

//    public void update(Hero hero) {
//
//        String sql = "update hero set name= ?, hp = ? , damage = ? where id = ?";
//        try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
//
//            ps.setString(1, hero.name);
//            ps.setFloat(2, hero.hp);
//            ps.setInt(3, hero.damage);
//            ps.setInt(4, hero.id);
//
//            ps.execute();
//
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//        }
//
//    }

//    public void delete(int id) {
//
//        try (Connection c = getConnection(); Statement s = c.createStatement();) {
//
//            String sql = "delete from hero where id = " + id;
//
//            s.execute(sql);
//
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//        }
//    }

//    public Hero get(int id) {
//        Hero hero = null;
//
//        try (Connection c = getConnection(); Statement s = c.createStatement();) {
//
//            String sql = "select * from pet where id = " + id;
//
//            ResultSet rs = s.executeQuery(sql);
//
//            if (rs.next()) {
//
//                String name = rs.getString(2);
//                float hp = rs.getFloat("hp");
//                int damage = rs.getInt(4);
//                hero = new Hero();
//            }
//
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//        }
//        return hero;
//    }

    public List<Hero> list() {
        return list(0, Short.MAX_VALUE);
    }

    public List<Hero> list(int start, int count) {
        List<Hero> heros = new ArrayList<Hero>();

        String sql = "select * from pet order by id limit ?,? ";

        try (Connection c = getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, start);
            ps.setInt(2, count);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(3);
                String tag  = rs.getString(4);
                String img = rs.getString(5);
                int price = rs.getInt(6);
                int stock = rs.getInt(7);
                String desc = rs.getString(8);
                long weight = rs.getLong(9);
                Hero hero = new Hero(id,name,tag,img,price,stock,desc,weight);
                heros.add(hero);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return heros;
    }
}
