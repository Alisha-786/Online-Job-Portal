<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer: Profile</title>
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

.profile-form {
	max-width: 700px; /* Increased width */
	margin: 80px auto; /* Centered */
	padding: 100px;
	background: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.profile-form-container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh; /* Full vertical height */
	padding-top: 80px;
}

.profile-form h2 {
	margin-bottom: 25px;
	font-size: 28px;
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-align: center;
}


.profile-form label {
	display: block;
	margin: 25px 0 5px;
}

.profile-form input, .profile-form textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
}

.profile-form button {
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	border: none;
	padding: 12px 24px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	width: 100%;
	margin-top: 20px;
}

.profile-form button:hover {
	background: #5a189a;
}
</style>
<body>
	<%@ include file="EmployerSidePanel.jsp"%>
	<div class="top-bar">
		<div class="search-bar">
			<form action="browsejobs.jsp" method="get"
				onsubmit="return handleSearch()">
				<input type="text" name="query" placeholder="Search..."
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
			<img src="img/female.webp" alt="Profile Icon"> <%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) userName = "Guest"; // Fallback
%>
<span><%= userName %></span>

		</div>
	</div>
	<!-- Employer Profile Form -->
	<div class="profile-form">
		<h2>Create Your Profile</h2>
		<form action="SaveEmployerProfile.jsp" method="post">
			<label for="companyName">Company Name</label> <input type="text"
				id="companyName" name="companyName" required> <label
				for="employerName">Employer Name</label> <input type="text"
				id="employerName" name="employerName" required> <label
				for="email">Email</label> <input type="email" id="email"
				name="email" required> <label for="contact">Contact
				Number</label> <input type="text" id="contact" name="contact" required>

			<label for="website">Company Website</label> <input type="url"
				id="website" name="website"> <label for="location">Company
				Location</label> <input type="text" id="location" name="location" required>

			<label for="description">Short Company Description</label>
			<textarea id="description" name="description" rows="4"></textarea>

			<button type="submit">Save Profile</button>
		</form>
		</div>
		<script>
function validateForm() {
	const fields = ["companyName", "employerName", "email", "contact", "location"];
	for (let id of fields) {
		let field = document.getElementById(id);
		if (!field.value.trim()) {
			alert("Please fill out the " + field.previousElementSibling.innerText + " field.");
			field.focus();
			return false;
		}
	}
	return true;
}
</script>
		
</body>
</html>