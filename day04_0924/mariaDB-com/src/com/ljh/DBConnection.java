package com.ljh;

import java.sql.*;

public class DBConnection {

    //	DB접속정보_기본
    static String URL = "jdbc:mariadb://localhost:3306/employees";
    static String USER = "root";
    static String PASSWORD = "1234";

    public static Connection getConnection() {
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("=== DB 연결 성공 ===");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("=== DB 연결 실패 ===");
        }
        return conn;
    }

    public static void close(Statement stmt, Connection conn) {
        close(stmt, conn);
    }
    public  static void close(Connection conn) {
        close(rs, stmt, conn);
    }
}

