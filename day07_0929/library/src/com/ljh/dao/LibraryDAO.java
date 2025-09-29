package com.ljh.dao;

import com.ljh.conn.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LibraryDAO {
    public List<String> q1BooksAfter2020() {
        String sql = "SELECT DISTINCT Title, PubYear FROM Book WHERE PubYear > 2020 ORDER BY PubYear, Title";
        try (Connection c = DBConnection.get();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<String> out = new ArrayList<>();
            while (rs.next()) out.add(rs.getString("Title") + "(" + rs.getString("PubYear") + ")");
            return out;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> q2BorrowedBy(String name) {
        String sql = """
                SELECT DISTINCT b.Title, r.RentDate, r.ReturnDate
                FROM Rental r
                JOIN Member m ON r.MemberID = m.MemberID
                JOIN Book b ON r.BookID = b.BookID
                WHERE m.Name = ?
                ORDER BY r.RentDate
                """;
        try (Connection c = DBConnection.get();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                List<String> out = new ArrayList<>();
                while (rs.next()) {
                    out.add("%s | 대출:%s | 반납:%s".formatted(
                            rs.getString("Title"),
                            rs.getDate("RentDate"),
                            String.valueOf(rs.getDate("ReturnDate"))
                    ));
                }
                return out;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> q3Unreturned() {
        String sql = """
                SELECT DISTINCT b.Title, r.RentDate
                FROM Rental r JOIN Book b ON r.BookID = b.BookID
                WHERE r.ReturnDate IS NULL
                ORDER BY r.RentDate
                """;
        try (Connection c = DBConnection.get();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<String> out = new ArrayList<>();
            while (rs.next()) out.add("%s | 대출:%s".formatted(rs.getString("Title")
                    , rs.getDate("RentDate")));
            return out;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> q4BorrowCountByBook() {
        String sql = """
                SELECT DISTINCT b.Title, COUNT(*) AS cnt
                FROM Rental r JOIN Book b ON r.BookID = b.BookID
                GROUP BY b.Title
                ORDER BY cnt DESC, b.Title
                """;
        try (Connection c = DBConnection.get();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<String> out = new ArrayList<>();
            while (rs.next()) out.add("%s : %d회".formatted(rs.getString("Title"),
                    rs.getInt("cnt")));
            return out;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> q5MostExpensive() {
        String sql = """
                SELECT DISTINCT Title, Price FROM Book
                WHERE Price = (SELECT MAX(Price) FROM Book)
                ORDER BY Title
                """;
        try (Connection c = DBConnection.get();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<String> out = new ArrayList<>();
            while (rs.next()) out.add("%s - %,d원".formatted(rs.getString("Title"),
                    rs.getBigDecimal("Price").intValue()));
            return out;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
