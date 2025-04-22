<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: View Job</title>
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
	margin-top: 70px; /* Added to account for the fixed top bar */
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
	z-index: 1000;
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

/* Email notification form styles */
.form-check {
    margin-bottom: 10px;
}

.form-check-input {
    margin-right: 10px;
}

.mb-4 {
    margin-bottom: 1.5rem;
}

.btn-primary {
    background-color: #2b124c;
    border-color: #2b124c;
    padding: 8px 20px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #1a0a2e;
    border-color: #1a0a2e;
}

.form-select {
    padding: 8px 12px;
    border-radius: 5px;
    border: 1px solid #ced4da;
    width: 200px;
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
	
	<!-- Main content area -->
	<div class="content">
        <h1 class="mb-4">Email Notification Preferences</h1>
        
        <form action="save_settings.jsp" method="post">
            <input type="hidden" name="settingType" value="email">
            
            <div class="mb-4">
              <h3>Job Application Updates</h3>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="appStatus" id="appStatus" checked>
                <label class="form-check-label" for="appStatus">Application status changes</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="appViewed" id="appViewed" checked>
                <label class="form-check-label" for="appViewed">When employer views your application</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="interviewInvite" id="interviewInvite" checked>
                <label class="form-check-label" for="interviewInvite">Interview invitations</label>
              </div>
            </div>
            
            <div class="mb-4">
              <h3>Job Alerts</h3>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" name="jobMatches" id="jobMatches" checked>
                <label class="form-check-label" for="jobMatches">New jobs matching your profile</label>
              </div>
              <div class="mb-3">
                <label for="jobAlertFrequency" class="form-label">Frequency:</label>
                <select class="form-select" name="jobAlertFrequency" id="jobAlertFrequency">
                    <option value="daily">Daily</option>
                    <option value="weekly">Weekly</option>
                    <option value="instant">Instant</option>
                </select>
              </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Save Settings</button>
        </form>
    </div>

</body>
</html>