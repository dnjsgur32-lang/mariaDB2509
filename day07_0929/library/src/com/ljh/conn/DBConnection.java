package com.ljh.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mariadb://localhost:3306/library";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection get()  throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
