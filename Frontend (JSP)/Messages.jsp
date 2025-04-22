<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="icon" type="image/png" href="Favicon- Next Hire.png" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
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
	background-color: white;
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

.content {
  margin-left: 40px;
  padding: 30px 20px;
}
.card-container {
  width: 60%; /* Adjust as needed, try 50%, 60%, or a fixed value like 700px */
  margin: 0 auto;
}

.card {
   border: none;
  border-radius: 15px;
  padding: 20px;
  margin-bottom: 20px;
  background-color: #fff;
  box-shadow: 0 4px 20px rgba(43, 18, 76, 0.4);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 30px rgba(170, 73, 193, 0.5);
}
.card h4 {
  font-size: 20px;
  color: #2B124C;
  margin-bottom: 10px;
}

.card p {
  margin: 5px 0;
  font-size: 16px;
  color: #333;
}

.status-tag {
  font-weight: bold;
  padding: 4px 8px;
  border-radius: 8px;
  color: white;
  font-size: 14px;
  display: inline-block;
  margin-top: 10px;
}

.status-interview { background-color: #00B894; }
.status-rejected { background-color: #D63031; }
.status-shortlisted { background-color: #0984E3; }
.status-waitlist { background-color: #FDCB6E; color: #2d3436; }
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
        <li class="nav-item"><a class="nav-link" href="job_alerts.jsp"> <i class="bi bi-bell"></i></a></li> 
                </ul>

                <!-- Profile Icon (Clickable) -->
                <a href="CandidateProfile.jsp" class="nav-link d-flex align-items-center">
                    <img src="https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg" class="rounded-circle me-2" alt="Profile" width="30" height="30" />
                </a>
            </div>
		</div>
	</nav>
<div class="notification-heading-container">
  <h2 class="notification-heading">📬 Messages & Updates</h2>
</div>

<div class="content">
<div class="card-container ">
  <div class="card">
    <h4>🧑‍💻 Keep your profile up-to-date for better visibility.</h4>
    <p>📅 Last updated: 2 days ago</p>
    <p>⚙️ Add certifications, internships, or recent projects.</p>
  </div>
  <div class="card">
    <h4>📝 You applied for <strong>Front-End Developer</strong> at Pixel Tech.</h4>
    <p>📍 Location: Mumbai</p>
    <p>⏰ Application Date: 21 April 2025</p>
    <span class="status-tag status-interview">📞 Call for Interview</span>
  </div>
<div class="card">
    <h4>📄 Reminder: Update your resume to increase chances for new roles!</h4>
    <p>💡 Tip: Tailor it to match trending keywords & latest skills.</p>
  </div>
  <div class="card">
    <h4>❌ Your application for <strong>Data Analyst</strong> at FinLogic has been reviewed.</h4>
    <p>📍 Location: Bengaluru</p>
    <p>⏰ Application Date: 20 April 2025</p>
    <span class="status-tag status-rejected">❌ Rejected</span>
  </div>

  <div class="card">
    <h4>✨ Your profile has been <strong>shortlisted</strong> for <strong>Cloud Engineer</strong> at NetSoft.</h4>
    <p>📍 Location: Pune</p>
    <p>⏰ Application Date: 20 April 2025</p>
    <span class="status-tag status-shortlisted">⭐ Shortlisted</span>
  </div>

  <div class="card">
    <h4>⏳ Application for <strong>UI/UX Designer</strong> at CreativeHive is currently on the <strong>Waitlist</strong>.</h4>
    <p>📍 Location: Hyderabad</p>
    <p>⏰ Application Date: 8 April 2025</p>
    <span class="status-tag status-waitlist">🕓 Waitlisted</span>
  </div>

  

  </div>

</div>
<footer >
			<%@ include file="Footer.jsp"%>
		</footer>
</body>
</html>
