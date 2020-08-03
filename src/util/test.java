package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class test {
    public static void main(String[] args) {
        PreparedStatement preparedStatement =null;
        Connection connection =null;
        try {
            connection = jdbcutils.getConnection();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            util.jdbcutils.close(preparedStatement,connection);
        }
    }
}
