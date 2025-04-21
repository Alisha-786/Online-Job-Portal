package com.yourpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("jobs/create")
public class JobPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Replace with your DB info
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jobdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "diya@0811";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String title = request.getParameter("jobTitle");
        String jobType = request.getParameter("jobType");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        
        int employerId = 1;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO jobs (title, description, employer_id, location) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title + " (" + jobType + ")");
            stmt.setString(2, description);
            stmt.setInt(3, employerId);
            stmt.setString(4, location);

            int rowsInserted = stmt.executeUpdate();
            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.getWriter().write("Failed to insert job.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}