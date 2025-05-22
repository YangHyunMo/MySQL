package org.scoula.jdbc_ex.common;

import java.sql.Connection;
import java.sql.Statement;

public class CreateUsersTable {
    public static void main(String[] args) {
        Connection conn = JDBCUtil.getConnection();
        Statement stmt = null;

        try {
            stmt = conn.createStatement();

            String sqlCreate = "CREATE TABLE IF NOT EXISTS users (" +
                    "id VARCHAR(12) PRIMARY KEY," +
                    "password VARCHAR(12) NOT NULL," +
                    "name VARCHAR(30) NOT NULL," +
                    "role VARCHAR(6) NOT NULL)";
            stmt.executeUpdate(sqlCreate);

            String sqlInsert = """
                    INSERT INTO users (id, password, name, role) VALUES 
                    ('guest', 'guest123', '방문자', 'USER'),
                    ('admin', 'admin123', '관리자', 'ADMIN'),
                    ('member', 'member1234', '일반회원', 'USER')
                    ON DUPLICATE KEY UPDATE name=VALUES(name);
                    """;
            stmt.executeUpdate(sqlInsert);

            System.out.println("테이블 생성 및 데이터 삽입 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, stmt, null);
        }
    }
}
