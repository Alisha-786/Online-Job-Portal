<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Admin: View Job</title>
</head>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Google Fonts - Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background: white;
	margin: 0;
	padding: 0;
}

.content {
	margin-left: 270px;
	padding: 20px;
}

.top-bar {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 10px 10px;
	background: #f8f9fa;
	position: fixed;
	right: 0;
	top: 0;
	width: calc(100% - 270px);
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.profile {
	display: flex;
	align-items: center;
	gap: 10px;
}

.profile img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.search-bar {
	display: flex;
	align-items: center;
	margin-right: auto; /* Pushes search bar to the left */
	margin-left: 10px;
}

.search-bar form {
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	border-radius: 25px;
	overflow: hidden;
	background-color: #fff;
}

.search-bar input[type="text"] {
	border: none;
	outline: none;
	padding: 10px 15px;
	width: 300px;
	font-size: 14px;
	border-radius: 25px 0 0 25px;
}

.search-bar button {
	border: none;
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	padding: 10px 15px;
	border-radius: 0 25px 25px 0;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

.search-bar button i {
	font-size: 16px;
}
/* Notification icon */
.notification {
	margin-left: 20px;
	margin-right: 20px;
	color: #555;
	font-size: 20px;
	cursor: pointer;
}
 table {
            border-collapse: collapse;
            width: 80%;
            margin:100px 275px;
        }
        th, td {
            border: 1px solid #444;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }

</style>
<body>
<%@ include file="CandidateSidePanel.jsp"%>
	<div class="top-bar">
		<div class="search-bar">
			<form action="browsejobs.jsp" method="get"
				onsubmit="return handleSearch()">
				<input type="text" name="query" placeholder="Search for jobs..."
					required>
				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>

		<!-- Notification Icon -->
		<div class="notification">
			<i class="fas fa-bell"></i>
		</div>

		<div class="profile">
			<img src="img/female.webp" alt="Profile Icon"> 
			<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) userName = "Guest"; // Fallback
%>
<span><%= userName %></span>
			
		</div>
	</div>
 <h2 style="text-align:center;">Your Applications</h2>

    <%
        String jdbcUrl = "jdbc:mysql://localhost:3306/demo"; // change this to your DB
        String dbUser = "root"; // your DB username
        String dbPass = "AP25@qwerty"; // your DB password

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
            stmt = conn.createStatement();

            // If you want to filter by the logged-in user, use:
            // int userId = (Integer) session.getAttribute("user_id");
            // rs = stmt.executeQuery("SELECT * FROM applications WHERE candidate_id = " + userId);

            rs = stmt.executeQuery("SELECT * FROM applications");

    %>
    <table>
        <tr>
            <th>Application ID</th>
            <th>Job ID</th>
            <th>Candidate ID</th>
            <th>Resume</th>
            <th>Cover Letter</th>
            <th>Status</th>
            <th>Applied Date</th>
        </tr>
        <%
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("application_id") %></td>
            <td><%= rs.getInt("job_id") %></td>
            <td><%= rs.getInt("candidate_id") %></td>
            <td><%= rs.getString("resume") %></td>
            <td><%= rs.getString("cover_letter") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getTimestamp("applied_date") %></td>
        </tr>
        <% } %>
    </table>

    <%
        } catch(Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(stmt != null) try { stmt.close(); } catch(Exception e) {}
            if(conn != null) try { conn.close(); } catch(Exception e) {}
        }
    %>
</body>
</html>