<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.dao.UserDao, com.DB.DBConnect, com.entity.user, java.util.List" %>

<%
    // Check for error messages
    String errorMsg = (String) session.getAttribute("errorMsg");
    if (errorMsg != null) {
        request.setAttribute("errorMsg", errorMsg);
        session.removeAttribute("errorMsg");
    }
    
    // Get user from session
    user currentUser = (user) session.getAttribute("currentUser");
    if (currentUser == null || !"Admin".equals(currentUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
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

        .delete-btn {
            background: linear-gradient(135deg, #ff0000, #b30000);
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 4px;
        }

        .role-candidate {
            color: #17a2b8;
            font-weight: 500;
        }

        .role-recruiter {
            color: #6f42c1;
            font-weight: 500;
        }

        .role-admin {
            color: #28a745;
            font-weight: 500;
        }

        .title {
            font-weight: bold;
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        #successMessage {
            position: fixed;
            top: 80px;
            right: 20px;
            z-index: 1100;
            display: none;
        }

</style>
<body>
<%@ include file="SidePanel.jsp"%>
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
<div id="successMessage" class="alert alert-success alert-dismissible fade show" role="alert">
        <span id="messageText"></span>
        <button type="button" class="btn-close" onclick="hideSuccessMessage()"></button>
    </div>

    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="title">Manage Users</h3>
            <a href="AddUserServlet" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Add New User
            </a>
        </div>

        <div class="card p-3">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
    List<user> users = (List<user>) request.getAttribute("users");
    if (users != null && !users.isEmpty()) {
        for (user u : users) {
%>
<tr>
    <td><%= u.getId() %></td>
    <td><%= u.getName() %></td>
    <td><%= u.getEmail() %></td>
    <td><%= u.getRole() %></td>
    <td>
        <a href="DeleteUserServlet?id=<%= u.getId() %>" class="btn btn-danger btn-sm">
            <i class="bi bi-trash"></i> Delete
        </a>
    </td>
</tr>
<%
        }
    } else {
%>
<tr>
    <td colspan="5" class="text-center text-muted">No users found</td>
</tr>
<%
    }
%>

                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Display success message if any
        <%
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
        if(message != null) {
        %>
            showMessage('<%= message %>', '<%= messageType != null ? messageType : "success" %>');
        <% } %>

        function showMessage(message, type) {
            const successMessage = document.getElementById('successMessage');
            const messageText = document.getElementById('messageText');

            successMessage.className = `alert alert-${type} alert-dismissible fade show`;
            messageText.textContent = message;
            successMessage.style.display = 'block';

            // Hide message after 5 seconds
            setTimeout(hideSuccessMessage, 5000);
        }

        function hideSuccessMessage() {
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'none';
        }

        function confirmDelete(userId, userName) {
            if(confirm(`Are you sure you want to delete user "${userName}"?`)) {
                fetch('DeleteUserServlet?id=' + userId, {
                    method: 'POST'
                })
                .then(response => {
                    if(response.ok) {
                        showMessage('User deleted successfully', 'success');
                        // Remove the row from table
                        document.getElementById(`userRow-${userId}`).remove();
                        // Reload if no users left
                        if(document.querySelectorAll('tbody tr').length === 0) {
                            document.querySelector('tbody').innerHTML = 
                                '<tr><td colspan="5" class="text-center">No users found</td></tr>';
                        }
                    } else {
                        throw new Error('Failed to delete user');
                    }
                })
                .catch(error => {
                    showMessage('Error deleting user: ' + error.message, 'danger');
                });
            }
        }
    </script>
</body>
</html>