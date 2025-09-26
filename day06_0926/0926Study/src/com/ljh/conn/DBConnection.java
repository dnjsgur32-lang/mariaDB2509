package com.ljh.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mariadb://localhost:3306/exdb";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() {
        try {
            var conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("=== DB 연결 성공 ===");
            return conn;
        } catch (SQLException e) {
            System.out.println("=== DB 연결 실패 ===" + e.getMessage());
            return null;
        }
    }
}
