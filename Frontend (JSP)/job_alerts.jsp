<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Alerts</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="icon" type="image/png" href="Favicon- Next Hire.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap-grid.min.css"
	integrity="sha512-i1b/nzkVo97VN5WbEtaPebBG8REvjWeqNclJ6AItj7msdVcaveKrlIIByDpvjk5nwHjXkIqGZscVxOrTb9tsMA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
	background-color: white; /* Removed background image */
}

.heading {
	width: 100vw;
	display: flex;
	justify-content: space-between;
}

#next-logo, #icons {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.navbar-nav .nav-item a {
    font-size: 1.2rem; /* Increase font size */
     margin-left: 10px; 
}

.content {
  margin-left: 40px;
  padding: 50px 20px 20px 20px;
}
.notification-heading-container {
  width: 50%;
  margin: 40px auto 20px auto;
  background-color: white;
  border-radius: 15px;
  padding: 15px 25px;
  text-align: center;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.notification-heading {
  font-size: 32px;
  font-weight: bold;
  background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin: 0;
}

.card {
   border: none;
  border-radius: 15px;
  padding: 20px;
  margin-bottom: 20px;
  background-color: #fff;
  box-shadow: 0 4px 20px rgba(43, 18, 76, 0.4); /* Gradient tone shadow */
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 30px rgba(170, 73, 193, 0.5); /* Deeper glow on hover */
}
.card h3 {
  margin: 0;
  font-size: 22px;
  color: #2B124C;
}

.card p {
  margin: 8px 0;
  color: #333;
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
  margin-right: auto;
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
  background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
  color: white;
  padding: 10px 15px;
  border-radius: 0 25px 25px 0;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
}

.notification {
  margin-left: 20px;
  margin-right: 20px;
  color: #555;
  font-size: 20px;
  cursor: pointer;
}
</style>
</head>
<body>
  <nav
		class="navbar navbar-expand-lg navbar-light bg-light shadow-sm p-2"
		id="headering">
		<div class="container-fluid">
			<!-- Brand and Logo -->
			<div class="d-flex align-items-center" id="next-logo">
				<a class="navbar-brand fw-bold fs-3" href="#">Next Hire</a> <i
					class="bi bi-graph-up fs-3 text-primary ms-2"></i>
			</div>

			<!-- Mobile Toggle Button -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Links -->
			<!-- Navbar Links with new icons -->
<div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto" id="icons">
                    <li class="nav-item"><a class="nav-link" href="CandidateHomePage.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="browse.jsp">Jobs</a></li>
      
        <li class="nav-item"><a class="nav-link" href="blogs.jsp">Blogs</a></li>
        <li class="nav-item"><a class="nav-link" href="#footer">Contact Us</a></li>
        
         <li class="nav-item"><a class="nav-link" href="Messages.jsp"> <i class="bi bi-envelope"></i></a></li>
        <li class="nav-item"><a class="nav-link" href="job-alerts.jsp"> <i class="bi bi-bell"></i></a></li> 
                </ul>

                <!-- Profile Icon (Clickable) -->
                <a href="CandidateProfile.jsp" class="nav-link d-flex align-items-center">
                    <img src="https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg" class="rounded-circle me-2" alt="Profile" width="30" height="30" />
                </a>
            </div>
		</div>
	</nav>
<div class="notification-heading-container">
  <h2 class="notification-heading">Notification - Job Alerts</h2>
</div>

  <div class="content">
    <div class="card">
      <h3>AI Engineer - Goa</h3>
      <p><strong>Salary:</strong> 198521</p>
      <p><strong>Experience:</strong> 4 years | <strong>Type:</strong> Full-Time</p>
      <p><strong>Industry:</strong> IT</p>
      <p><strong>Description:</strong> Artificial intelligence (AI) engineers are responsible for developing, programming and training the complex networks of algorithms that make up AI so that they can function like a human brain...</p>
    </div>
    <div class="card">
      <h3>ML Engineer - Haryana</h3>
      <p><strong>Salary:</strong> 78963</p>
      <p><strong>Experience:</strong> 4 years | <strong>Type:</strong> Part-Time</p>
      <p><strong>Industry:</strong> IT</p>
      <p><strong>Description:</strong> A Machine Learning Engineer (ML Engineer) designs, develops, and deploys machine learning systems, focusing on creating and optimizing algorithms that enable computers to learn from data...</p>
    </div>
    <div class="card">
      <h3>Project Manager - Bangalore</h3>
      <p><strong>Salary:</strong> 72000</p>
      <p><strong>Experience:</strong> 4 years | <strong>Type:</strong> Part-Time</p>
      <p><strong>Industry:</strong> IT</p>
      <p><strong>Description:</strong> A Project Manager is responsible for planning, organizing, and overseeing projects to ensure they are completed on time, within budget, and within scope...</p>
    </div>
  </div>
  <footer >
			<%@ include file="Footer.jsp"%>
		</footer>
</body>
</html>