package com.nextHire.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/jobs/*")
public class JobDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jobdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "diya@0811";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo(); // e.g., "/5"
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing job ID.");
            return;
        }

        String jobIdStr = pathInfo.substring(1);
        int jobId;

        try {
            jobId = Integer.parseInt(jobIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid job ID.");
            return;
        }

        try (
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT j.id, j.title, j.description, j.salary, j.location, u.name AS employer_name " +
                "FROM jobs j JOIN users u ON j.employer_id = u.id WHERE j.id = ?"
            )
        ) {
            stmt.setInt(1, jobId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("jobId", rs.getInt("id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("description", rs.getString("description"));
                request.setAttribute("salary", rs.getBigDecimal("salary"));
                request.setAttribute("location", rs.getString("location"));
                request.setAttribute("employerName", rs.getString("employer_name"));

                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jobDetails.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Job not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error.", e);
        }
    }
}
