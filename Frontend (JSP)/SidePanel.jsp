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

/* Modal Styles */
#logoutModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 400px;
}

.modal-header {
    text-align: center;
    font-size: 20px;
}

.modal-footer {
    text-align: center;
}

button {
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
}
</style>
<script>
function showLogoutModal() {
    // Show the modal
    document.getElementById("logoutModal").style.display = "block";
}

function logout() {
    // Redirect to index.jsp if the user clicks "Yes"
    window.location.href = "index.jsp";
}

function closeModal() {
    // Close the modal if the user clicks "No"
    document.getElementById("logoutModal").style.display = "none";
}

// Close the modal if the user clicks anywhere outside of it
window.onclick = function(event) {
    if (event.target == document.getElementById("logoutModal")) {
        document.getElementById("logoutModal").style.display = "none";
    }
};

document.addEventListener("DOMContentLoaded", function () {
    let sidebarLinks = document.querySelectorAll(".sidebar a");
    let currentPath = window.location.pathname.split('/').pop(); // Get the page filename

    sidebarLinks.forEach(link => {
        let linkPath = link.getAttribute("href").split('/').pop(); // Get href filename

        if (linkPath === currentPath) {
            link.classList.add("active"); // Add active class to current page
        } else {
            link.classList.remove("active"); // Remove from other links
        }
    });
});


</script>
</head>
<body>
    <div class="sidebar">
        <div class="brand-name">
            <i class="fas fa-chart-line fs-4 brand-icon"></i>
                <span style="font-weight: bold;" onclick="location.href='index.jsp'">Next</span><span style="color: #e63946; font-weight: bold;">Hire</span>
        </div>
        <a href="AdminDashboard.jsp" class="active"><i
            class="fas fa-chart-pie icon"></i> Dashboard</a> 
        <a href="PostaJob.jsp"><i class="fas fa-file-alt"></i> Post a Job</a>
        <a href="AdminManageJobs.jsp"><i class="fas fa-tasks"></i> Manage Jobs</a> 
        <a href="ManageUsersServlet"><i class="fas fa-users"></i> Manage Users</a> 
        <a href="blogs.jsp"><i class="fas fa-blog"></i> Blogs</a>
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
