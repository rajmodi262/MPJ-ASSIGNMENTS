package com.staff;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    // ── INSERT ─────────────────────────────────────────────────────────────
    public boolean addStaff(Staff s) {
        String sql = "INSERT INTO staff_records (name, email, department, designation, salary, phone, join_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getDepartment());
            ps.setString(4, s.getDesignation());
            ps.setDouble(5, s.getSalary());
            ps.setString(6, s.getPhone());
            ps.setDate  (7, s.getJoinDate());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ── SELECT ALL ────────────────────────────────────────────────────────
    public List<Staff> getAllStaff() {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT * FROM staff_records ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             Statement  st  = con.createStatement();
             ResultSet  rs  = st.executeQuery(sql)) {

            while (rs.next()) {
                Staff s = new Staff();
                s.setId         (rs.getInt   ("id"));
                s.setName       (rs.getString("name"));
                s.setEmail      (rs.getString("email"));
                s.setDepartment (rs.getString("department"));
                s.setDesignation(rs.getString("designation"));
                s.setSalary     (rs.getDouble ("salary"));
                s.setPhone      (rs.getString("phone"));
                s.setJoinDate   (rs.getDate  ("join_date"));
                list.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── DELETE ────────────────────────────────────────────────────────────
    public boolean removeStaff(int id) {
        String sql = "DELETE FROM staff_records WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
