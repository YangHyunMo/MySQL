package org.scoula.jdbc_ex.common;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
    private static Connection conn = null;

    public static Connection getConnection() {
        if (conn != null) return conn;

        try (InputStream input = JDBCUtil.class.getClassLoader().getResourceAsStream("application.properties")) {
            Properties props = new Properties();
            props.load(input);

            String driver = props.getProperty("driver");
            String url = props.getProperty("url");
            String id = props.getProperty("id");
            String password = props.getProperty("password");

            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
}
