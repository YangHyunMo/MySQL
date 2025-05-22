package org.scoula.jdbc_ex.common.test;

import org.junit.jupiter.api.Test;
import org.scoula.jdbc_ex.common.JDBCUtil;

import java.sql.Connection;

import static org.junit.jupiter.api.Assertions.assertNotNull;

public class ConnectionTest {

    @Test
    public void testConnection() {
        try {
            Connection conn = java.sql.DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/jdbc_ex", "scoula", "1234");

            assertNotNull(conn);
            System.out.println("직접 DB 연결 성공!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testConnection2() {
        try {
            Connection conn = JDBCUtil.getConnection(); // JDBCUtil 사용
            assertNotNull(conn);
            System.out.println("JDBCUtil로 DB 연결 성공!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}