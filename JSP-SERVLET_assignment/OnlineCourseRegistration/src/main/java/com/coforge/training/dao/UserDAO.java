package com.coforge.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.coforge.training.model.User;

public class UserDAO {

    Connection con = null;
    PreparedStatement ps = null;

    // =========================
    // Register User
    // =========================

    public boolean registerUser(User user) {

        boolean status = false;

        try {

            con = DBConnection.getConnection();

            String sql = "INSERT INTO users(fullname,email,phone,student_id,password) VALUES(?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getStudentId());
            ps.setString(5, user.getPassword());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // =========================
    // Login User
    // =========================

    public User loginUser(String email, String password) {

        User user = null;

        try {

            con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setStudentId(rs.getString("student_id"));
                user.setPassword(rs.getString("password"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}