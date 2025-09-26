package com.ljh.crud;

import com.ljh.conn.DBConnection;

import java.sql.*;

public class CRUDClass {
    public CRUDClass() {
    }

    public void createTable() {
        String sql = """
                CREATE TABLE IF NOT EXISTS users(
                    id INT PRIMARY KEY AUTO_INCREMENT,
                    name VARCHAR(100) NOT NULL
                ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
                """;
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("연결 실패로 테이블 생성 중단");
                return;
            }
            stmt = conn.createStatement();
            stmt.execute(sql);
            System.out.println("[DDL] users 테이블 준비 완료");
        } catch (SQLException e) {
            System.out.println("[DDL ERROR] " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public void insertUser(String name) {
        String sql = "INSERT INTO users(name) VALUES(?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("연결 실패로 INSERT 중단");
                return;
            }
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            int rows = ps.executeUpdate();
            System.out.println("[INSERT] rows = " + rows + ", name = " + name);
        } catch (SQLException e) {
            System.out.println("[INSERT ERROR] " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public void insertMany(String... names) {
        String sql = "INSERT INTO users (name) VALUES(?)";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("[BATCH] 연결 실패");
                return;
            }
            ps = conn.prepareStatement(sql);
            for (String n : names) {
                ps.setString(1, n);
                ps.addBatch();
            }
            int[] result = ps.executeBatch();
            System.out.println("[BATCH] inserted count=" + result.length);
        } catch (SQLException e) {
            System.out.println("[BATCH ERROR] " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ignore) {
            }

        }
    }

    public void selectAll() {
        String sql =
                "SELECT id, name "
                        + " FROM users "
                        + " ORDER BY id";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("[SELECT] 연결 실패");
                return;
            }
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            System.out.println("---- users ----");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                System.out.println(id + " | " + name);
            }
            System.out.println("----------------");
        } catch (SQLException e) {
            System.out.println("[SELECT ERROR] " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException ignore) {
            }
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public void updateUserName(int id, String newName) {
        String sql =
                "UPDATE users "
                        + "SET name = ? "
                        + "WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("[UPDATE] 연결 실패");
                return;
            }
            ps = conn.prepareStatement(sql);
            ps.setString(1, newName);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();
            System.out.println(
                    "[UPDATE] rows = "
                            + rows
                            + " (id = " + id + " > name = "
                            + newName + ")"
            );
        } catch (SQLException e) {
            System.out.println("[UPDATE ERROR] " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ignore) {
            }
        }
    }

    public void deleteUser(int id) {
        String sql =
                "DELETE FROM users "
                        + "WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                System.out.println("[DELETE] 연결 실패");
                return;
            }
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            System.out.println("[DELETE] rows = " + rows + "(id = " + id + ")");
        } catch (SQLException e) {
            System.out.println("[DELETE ERROR] " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
            } catch
            (SQLException ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch
            (SQLException ignore) {
            }

        }
    }
}


