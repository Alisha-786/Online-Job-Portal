<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login | Next Hire</title>
<%@include file="allComponents/allcss.jsp"%>
<style>
/* Centering the login form */
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f9f9f9;
	margin: 0;
}

.login-container {
	background: white;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 420px;
}

.brand-name {
	font-size: 20px;
	font-weight: bold;
	color: #6A0DAD;
	display: flex;
	align-items: center;
	justify-content: center;
}

.brand-icon {
	margin-right: 8px;
}

h1 {
	font-size: 24px;
	font-weight: bold;
	margin-top: 20px;
}

p {
	color: #777;
	margin-bottom: 20px;
}

.google-btn {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	color: #444;
	cursor: pointer;
	margin-bottom: 15px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.google-btn img {
	width: 20px;
	margin-right: 10px;
}

.toggle-container {
	display: flex;
	background-color: #eaf0fa;
	border-radius: 30px;
	padding: 5px;
	justify-content: space-between;
	margin: 20px 0;
}

.toggle-btn {
	flex: 1;
	border: none;
	border-radius: 30px;
	padding: 10px 0;
	font-weight: bold;
	cursor: pointer;
	background-color: transparent;
	color: #333;
	transition: background-color 0.3s, color 0.3s;
}

.toggle-btn.active {
	background-color: #0a2c52;
	color: white;
}

.form-control {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.checkbox-container {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	color: #555;
}

.checkbox-container a {
	text-decoration: none;
	color: #6A0DAD;
}

.btn-primary {
	width: 100%;
	padding: 12px;
	border: none;
	background-color: #6A0DAD;
	color: white;
	font-size: 16px;
	font-weight: bold;
	border-radius: 8px;
	cursor: pointer;
}

.btn-primary:hover {
	background-color: #5A0DA0;
}

.footer-text {
	margin-top: 15px;
	font-size: 14px;
	color: #555;
}

.footer-text a {
	color: #6A0DAD;
	font-weight: bold;
	text-decoration: none;
}

.divider {
	margin: 15px 0;
	font-size: 14px;
	color: #888;
}
</style>
</head>
<body>

	<div class="login-container">
		<div class="brand-name">
			<i class="bi bi-graph-up fs-4 brand-icon"></i> Next Hire
		</div>
		<h1>Holla, Welcome Back</h1>
		<p>Hey, welcome back to your special place</p>

		<!-- Google Login Button -->
		<%
		String clientId = "837241615326-2dcgl5qdu9nsuugeeermrhh9pljunmrc.apps.googleusercontent.com"; // Replace with your real client ID
		String redirectUri = "http://localhost:8080/JobPortal/OAuth2Callback"; // Use your real project path
		String oauthUrl = "https://accounts.google.com/o/oauth2/v2/auth" + "?scope=email%20profile" + "&access_type=online"
				+ "&include_granted_scopes=true" + "&response_type=code" + "&redirect_uri="
				+ java.net.URLEncoder.encode(redirectUri, "UTF-8") + "&client_id=" + clientId;
		%>
		<button class="google-btn" onclick="window.location.href='<%= oauthUrl %>'">
			<img src="img/GoogleIcon.png" alt="Google Logo"> Login with
			Google
		</button>

		<div class="divider">or</div>

		<form id="loginForm" action="LoginServlet" method="POST">
			<input type="email" name="email" class="form-control"
				placeholder="Email" required> <input type="password"
				name="password" class="form-control" placeholder="Password" required>
			<!-- Toggle Button for Candidate/Recruiter -->
			<div class="toggle-container">
				<button class="toggle-btn active" onclick="setUserType('candidate')">As
					Candidate</button>
				<button class="toggle-btn" onclick="setUserType('recruiter')">As
					Recruiter</button>
			</div>
			<input type="hidden" name="userType" id="userType" value="candidate">


			<div class="checkbox-container">
				<label><input type="checkbox" name="remember">
					Remember me</label> <a href="#">Forgot Password?</a>
			</div>

			<button type="submit" class="btn-primary">Log In</button>
		</form>

		<p class="footer-text">
			Don't have an account? <a href="SignUp.jsp">Create an account</a>
		</p>
	</div>
	<script>
  function setUserType(type) {
    document.getElementById('userType').value = type;

    const buttons = document.querySelectorAll('.toggle-btn');
    buttons.forEach(btn => btn.classList.remove('active'));

    if (type === 'candidate') {
      buttons[0].classList.add('active');
    } else {
      buttons[1].classList.add('active');
    }
  }
</script>

</body>
</html>
