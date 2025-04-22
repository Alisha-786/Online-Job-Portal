package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.user;

public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean registerUser(user u) {
        boolean f = false;
        try {
            String sql = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getRole());
            System.out.println("Executing SQL: " + ps.toString());
            int i = ps.executeUpdate();
            if (i == 1) {
            	f = true;
            	System.out.println("User registered successfully: " + u.getEmail());
            }
            else {
                System.out.println("No rows affected during registration");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error registering user: " + e.getMessage());
         // Add specific error handling for common issues
            if (e.getMessage().contains("Duplicate entry")) {
                System.err.println("Duplicate email detected: " + u.getEmail());
            } else if (e.getMessage().contains("constraint fails")) {
                System.err.println("Constraint violation occurred");
            }
        }
        return f;
    }

    public user loginUser(String email, String password) {
        user u = null;
        try {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new user();
                u.setId(rs.getInt("user_id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                System.out.println("User logged in: " + email);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error during login: " + e.getMessage());
        }
        return u;
    }
    public List<user> getAllUsers() {
        List<user> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users ORDER BY user_id DESC";
            System.out.println("Executing query: " + sql); // Debug
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            System.out.println("Query executed, processing results..."); // Debug
            
            while (rs.next()) {
                user u = new user();
                u.setId(rs.getInt("user_id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(""); // Don't send password to view
                u.setRole(rs.getString("role"));
                list.add(u);
                
                System.out.println("Added user: " + u.getEmail()); // Debug
            }
            
            System.out.println("Total users fetched: " + list.size()); // Debug
            
        } catch (Exception e) {
            System.err.println("Error in getAllUsers: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteUser(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }



}
