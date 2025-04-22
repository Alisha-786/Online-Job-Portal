<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.DB.DBConnect, com.entity.Application, com.dao.ApplicationDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Applications - Employer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
        }

        .content {
            margin-left: 270px;
            padding: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 15px 10px;
            background: #f8f9fa;
            position: fixed;
            right: 0;
            top: 0;
            width: calc(100% - 270px);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .title {
            font-weight: bold;
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .card {
            margin-top: 80px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(170, 73, 193, 0.3);
        }

        .table th {
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            border-top: none;
        }
    </style>
</head>
<body>
<%@ include file="EmployerSidePanel.jsp" %>
<div class="top-bar">
    <div class="profile">
        <img src="img/female.webp" alt="Profile Icon" width="40" height="40" style="border-radius: 50%;">
        <%
            String userName = (String) session.getAttribute("userName");
            if (userName == null) userName = "Guest";
        %>
        <span><%= userName %></span>
    </div>
</div>

<div class="content">
    <h3 class="title mb-4">Manage Applications</h3>
    <div class="card p-3">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Job Title</th>
                <th>Candidate ID</th>
                <th>Resume</th>
                <th>Cover Letter</th>
                <th>Status</th>
                <th>Applied Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                Connection conn = DBConnect.getConn();
                String query = "SELECT a.*, j.title FROM applications a JOIN jobs j ON a.job_id = j.id";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getInt("candidate_id") %></td>
                <td><a href="resumes/<%= rs.getString("resume") %>" target="_blank">View</a></td>
                <td><%= rs.getString("cover_letter").length() > 60 ? rs.getString("cover_letter").substring(0, 60) + "..." : rs.getString("cover_letter") %></td>
                <td><%= rs.getString("status") %></td>
                <td><%= rs.getTimestamp("applied_date") %></td>
            </tr>
            <%
                }
                rs.close();
                ps.close();
                conn.close();
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>