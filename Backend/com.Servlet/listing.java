package com.jobportal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jobs")
public class JobListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // DB Credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/jobdb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "diya@0811"; 

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "SELECT j.id, j.title, j.description, j.salary, j.location, u.name AS employer_name " +
                             "FROM jobs j JOIN users u ON j.employer_id = u.id";

                try (PreparedStatement stmt = conn.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {

                    out.println("<div class='container mt-4'><div class='row g-4'>");

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("title");
                        String description = rs.getString("description");
                        String salary = rs.getString("salary");
                        String location = rs.getString("location");
                        String employer = rs.getString("employer_name");

                        out.println("<div class='col-md-6'>");
                        out.println("<div class='job-card' id='boxes'>");
                        out.println("<h5>" + title + "</h5>");
                        out.println("<p>" + description + "</p>");
                        out.println("<p><strong>Location:</strong> " + location + "</p>");
                        out.println("<p><strong>Salary:</strong> ₹" + salary + "</p>");
                        out.println("<p><strong>Posted by:</strong> " + employer + "</p>");
                        out.println("<button class='btn btn-outine-light btn-sm mt-2 see-details fw-bold' id='see-btn'>See Details</button>");
                        out.println("</div>");
                        out.println("</div>");
                    }

                    out.println("</div></div>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
