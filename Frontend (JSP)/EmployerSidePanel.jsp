<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sidebar Panel</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Jost:wght@500&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
}

.sidebar {
	width: 250px;
	height: 100vh;
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	position: fixed;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	padding-top: 20px;
}

.brand-name {
	color: white;
	font-weight: bold;
	font-size: 24px;
	text-align: center;
	padding: 20px;
}

.brand-icon {
	margin-right: 8px;
	color: white;
}

.sidebar a {
	padding: 15px;
	text-decoration: none;
	color: white;
	font-size: 18px;
	display: flex;
	align-items: center;
	transition: 0.3s;
	background: transparent;
	border-radius: 0;
}

.sidebar a:hover, .sidebar a.active {
	background: white;
	color: #4b0082;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
	margin-right: 0;
	margin-left: 15px;
}
.sidebar a:hover{
	background: #6A2D8C;
	color: white;
}

.sidebar a i {
	margin-right: 10px;
}

/* Added divider style */
.sidebar-divider {
	height: 1px;
	background-color: rgba(255, 255, 255, 0.2);
	margin: 10px 20px;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function () {
    let sidebarLinks = document.querySelectorAll(".sidebar a");
    let currentPath = window.location.pathname.split('/').pop();

    sidebarLinks.forEach(link => {
        let linkPath = link.getAttribute("href").split('/').pop();

        if (linkPath === currentPath) {
            link.classList.add("active");
        } else {
            link.classList.remove("active");
        }
    });
});
</script>
</head>
<body>
	<div class="sidebar">
		<div class="brand-name">
			<i class="fas fa-chart-line fs-4 brand-icon"></i>
			<span style="font-weight: bold;">Next</span><span style="color: #e63946; font-weight: bold;">Hire</span>
		</div>
		
		<!-- Main Navigation -->
		<a href="EmployerHomePage.jsp"><i class="fas fa-home"></i> Home</a>
		<a href="EmployerProfile.jsp"><i class="fas fa-user"></i> Profile</a>
		<a href="EmployerManageApplications.jsp"><i class="fas fa-file-contract"></i> Manage Applications</a>
		
		<!-- Job Management Section -->
		<div class="sidebar-divider"></div>
		<a href="EmployerPostJob.jsp"><i class="fas fa-plus-circle"></i> Post a Job</a>
		<a href="EmployerManageJobs.jsp"><i class="fas fa-tasks"></i> Manage Jobs</a>
		<a href="EmployerAnalytics.jsp"><i class="fas fa-chart-bar"></i> Analytics</a>
		
		<!-- Content Section -->
		<div class="sidebar-divider"></div>
		<a href="blogs.jsp"><i class="fas fa-blog"></i> Blogs</a>
		
		<!-- Account Section -->
		<div class="sidebar-divider"></div>
		<a href="Subscription.jsp"><i class="fas fa-crown"></i> Pro Subscription</a>
		<a href="email_settings.jsp"><i class="fas fa-cog"></i> Settings</a>
		<a class="logout-btn" onclick="showLogoutModal()"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Logout Modal -->
    <div id="logoutModal">
        <div class="modal-content">
            <div class="modal-header">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button onclick="logout()">Yes</button>
                <button onclick="closeModal()">No</button>
            </div>
        </div>
    </div>
</body>
</html>