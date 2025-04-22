<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.entity.Job, java.text.SimpleDateFormat" %>
<%@ page import="com.dao.ManageJobDao, com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Jobs - Admin Dashboard</title>
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

        .edit-btn {
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 4px;
            margin-right: 5px;
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff0000, #b30000);
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 4px;
        }

        .status-published {
            color: #28a745;
            font-weight: 500;
        }

        .status-draft {
            color: #6c757d;
            font-weight: 500;
        }

        .status-expired {
            color: #dc3545;
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
</head>
<body>
    <%@ include file="SidePanel.jsp"%>
    <div class="top-bar">
    <div class="search-bar">
    <form action="browsejobs.jsp" method="get" onsubmit="return handleSearch()">
        <input type="text" name="query" placeholder="Search for jobs..." required>
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>

		<!-- Notification Icon -->
	<div class="notification">
		<i class="fas fa-bell"></i>
	</div>
        <div class="profile">
            <img src="img/female.webp" alt="Profile Icon">
            <span>Admin User</span>
        </div>
    </div>

    <div id="successMessage" class="alert alert-success alert-dismissible fade show" role="alert">
        <span id="messageText"></span>
        <button type="button" class="btn-close" onclick="hideSuccessMessage()"></button>
    </div>

    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="title">Manage Jobs</h3>
            <select class="form-select w-auto" id="sortSelect">
                <option value="newest" <%= "newest".equals(request.getParameter("sort")) ? "selected" : "" %>>Sort by: Newest</option>
                <option value="oldest" <%= "oldest".equals(request.getParameter("sort")) ? "selected" : "" %>>Oldest</option>
                <option value="title" <%= "title".equals(request.getParameter("sort")) ? "selected" : "" %>>Title</option>
            </select>
        </div>

        <div class="card p-3">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Posted Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
    <%
    ManageJobDao dao = new ManageJobDao(DBConnect.getConn());
        List<Job> list = dao.getAllJobs();
        for (Job j : list) {
    %>
    <tr>
        <td><%=j.getTitle()%></td>
        <td><%=j.getJobType()%></td>
        <td><%=j.getLocation()%></td>
        <td><%= new SimpleDateFormat("MMM dd, yyyy").format(j.getPostedDate()) %></td>
        <td>
            <span class="status-<%=j.getStatus().toLowerCase()%>">
                <%=j.getStatus()%>
            </span>
        </td>
        <td>
      <!--      <a href="AdminEditJob.jsp?id=<%=j.getId()%>" class="btn btn-sm btn-warning">Edit</a>  -->	
            <a href="DeleteJobServlet?id=<%=j.getId()%>" class="btn btn-sm btn-danger"
               onclick="return confirm('Are you sure you want to delete this job?');">Delete</a>
        </td>
    </tr>
    <% } %>
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

            successMessage.className = alert alert-${type} alert-dismissible fade show;
            messageText.textContent = message;
            successMessage.style.display = 'block';

            // Hide message after 5 seconds
            setTimeout(hideSuccessMessage, 5000);
        }

        function hideSuccessMessage() {
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'none';
        }

        function editJob(jobId) {
            window.location.href = 'EditJobServlet?id=' + jobId;
        }

        function confirmDelete(jobId, jobTitle) {
            if(confirm(Are you sure you want to delete "${jobTitle}"?)) {
                fetch('DeleteJobServlet?id=' + jobId, {
                    method: 'POST'
                })
                .then(response => {
                    if(response.ok) {
                        showMessage('Job deleted successfully', 'success');
                        // Reload the page after 1 second to see changes
                        setTimeout(() => location.reload(), 1000);
                    } else {
                        throw new Error('Failed to delete job');
                    }
                })
                .catch(error => {
                    showMessage('Error deleting job: ' + error.message, 'danger');
                });
            }
        }

       
    </script>
</body>
</html>