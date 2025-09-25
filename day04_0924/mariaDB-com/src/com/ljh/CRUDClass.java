package com.ljh;

import java.sql.*;

public class CRUDClass {

    public CRUDClass() {
//		Create 테이블 - create table
//		createTable();

//		Read 테이블 - select
        selectTable();

//		Update 테이블 - update
//		updateTable();

//		Delete 테이블안의 row 삭제 - delete
//		deleteUserTable();

//		insert 테이블 - insert
//		insertUserTable();

    }

    private void insertUserTable() {
        // TODO Auto-generated method stub

    }

    private void deleteUserTable() {
        // TODO Auto-generated method stub

    }

    private void updateTable() {
        // TODO Auto-generated method stub

    }

    private void selectTable() {
        String sql = "show tables";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("-- employees 데이터 베이스 내의 테이블을 확인");

            while (rs.next()) {
//				String talName = rs.getString("tables_in_employees");
                String talName2 = rs.getString(1);
//				System.out.println("[" + talName + " -- " + talName2 +  "]");
                System.out.println("[" + talName2 + "]");
            }
            System.out.println("-------------------------------------");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void createTable() {
        String sql = "create table if not exists users\r\n" +
                "(\n" +
                "    id   varchar(50),\n" +
                "    name varchar(100)\n" +
                ")";
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            stmt.execute(sql);
            System.out.println("users 테이블 생성 완료");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(stmt, conn);
        }


    }
}
