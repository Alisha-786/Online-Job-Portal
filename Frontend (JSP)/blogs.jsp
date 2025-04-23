<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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

<head>
  <meta charset="UTF-8" />
  <title>Job Blog Articles</title>
  <style>
    body {
	font-family: "Poppins", sans-serif;
	height: 100vh;
	background-image:
		url("https://images.pexels.com/photos/3183183/pexels-photo-3183183.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
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

    .logo {
      font-size: 1.5rem;
      font-weight: bold;
      color: #511f52;
    }

    .search-bar input {
      padding: 0.5rem;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    .btn {
      background-color: #f3f4f6;
      border: none;
      padding: 0.5rem 1rem;
      border-radius: 5px;
      cursor: pointer;
      font-size: 0.9rem;
    }

    .btn-primary {
      background-color: #fceabb;
      color: #000;
    }

    .filter-bar {
      text-align: center;
      margin: 1rem auto;
    }

    .filter-btn {
      background-color: #f3f4f6;
      border: 1px solid #ccc;
      padding: 0.5rem 1rem;
      margin: 0 0.3rem;
      border-radius: 20px;
      cursor: pointer;
      font-size: 0.9rem;
      transition: background 0.3s;
    }

    .filter-btn:hover {
      background-color: #ddd;
    }

    .articles-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 1.5rem;
      padding: 2rem;
    }

    .card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      overflow: hidden;
      transition: transform 0.2s;
      cursor: pointer;
      text-decoration: none;
      color: inherit;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .card-content {
      padding: 1rem;
    }

    .card-content h3 {
      font-size: 1.1rem;
      margin-bottom: 0.5rem;
      color: #693b69;
    }

    .card-content p {
      color: #777;
      font-size: 0.9rem;
    }

    .tag {
      display: inline-block;
      background: #e0f0ff;
      color: #a987ab;
      padding: 0.25rem 0.5rem;
      border-radius: 4px;
      font-size: 0.8rem;
      margin-top: 0.5rem;
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
        <li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Blogs</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
        <li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
        <li class="nav-item"><a class="nav-link" href="#"> <i class="bi bi-envelope"></i></a></li>
        <li class="nav-item"><a class="nav-link" href="#"> <i class="bi bi-bell"></i></a></li> 
                </ul>

                <!-- Profile Icon (Clickable) -->
                <a href="CandidateProfile.jsp" class="nav-link d-flex align-items-center">
                    <img src="https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg" class="rounded-circle me-2" alt="Profile" width="30" height="30" />
                </a>
            </div>
		</div>
	</nav>
  <!-- Category Filter -->
  <div class="filter-bar">
    <button class="filter-btn" onclick="filterCards('All')">All</button>
    <button class="filter-btn" onclick="filterCards('Resumes')">Resumes</button>
    <button class="filter-btn" onclick="filterCards('Interviews')">Interviews</button>
    <button class="filter-btn" onclick="filterCards('Career Growth')">Career Growth</button>
    <button class="filter-btn" onclick="filterCards('Job Hunt')">Job Hunt</button>
    <button class="filter-btn" onclick="filterCards('Networking')">Networking</button>
  </div>

  <main class="articles-grid">

    <a href="https://www.linkedin.com/pulse/tips-writing-thank-you-message-your-boss-nicely-done-dheeraj-yadav/" class="card" target="_blank">
      <img src="images/tips.jpg" alt="Thank You Message" />
      <div class="card-content">
        <h3>Tips for Writing a Thank You Message</h3>
        <p>30+ samples & tips to appreciate your boss after an achievement.</p>
        <div class="tag">#Career Growth</div>
      </div>
    </a>

    <a href="https://www.naukri.com/blog/performance-appraisal-comments/" class="card" target="_blank">
      <img src="images/appraisa+tips.jpeg" alt="Appraisal Tips" />
      <div class="card-content">
        <h3>Performance Appraisal Tips</h3>
        <p>15+ phrases & examples to ace your review process.</p>
        <div class="tag">#Career Growth</div>
      </div>
    </a>

    <a href="https://www.geeksforgeeks.org/python-keywords/" class="card" target="_blank">
      <img src="images/python.jpeg" alt="Python Keywords" />
      <div class="card-content">
        <h3>Python Keywords Explained</h3>
        <p>Understand all reserved keywords in Python with code.</p>
        <div class="tag">#Job Hunt</div>
      </div>
    </a>

    <a href="https://www.spglobal.com/en/news-insights/latest-news-headlines/s-p-global-opens-new-office-in-bengaluru-2024-04-01/" class="card" target="_blank">
      <img src="images/s&p.jpeg" alt="S&P Global" />
      <div class="card-content">
        <h3>S&P Global Expands India Operations</h3>
        <p>New office in Bengaluru boosts hiring & development.</p>
        <div class="tag">#Networking</div>
      </div>
    </a>

    <a href="https://www.naukri.com/blog/self-appraisal-comments-examples/" class="card" target="_blank">
      <img src="images/self.png" alt="Self-Appraisal Comments" />
      <div class="card-content">
        <h3>80+ Self-Appraisal Comments</h3>
        <p>Boost your performance reviews with these examples.</p>
        <div class="tag">#Career Growth</div>
      </div>
    </a>

    <a href="https://www.npcil.nic.in/WriteReadData/userfiles/file/Advt_1_2024_English.pdf" class="card" target="_blank">
      <img src="images/NPCIL-Assistant-Grade-1-Recruitment-2024.webp" alt="NPCIL recruitment" />
      <div class="card-content">
        <h3>NPCIL Assistant Grade 1 Recruitment</h3>
        <p>58 new posts in HR, Finance, and Materials Management.</p>
        <div class="tag">#Job Hunt</div>
      </div>
    </a>

    <a href="https://resumegenius.com/resume-help/how-to-write-a-resume" class="card" target="_blank">
      <img src="images/resume-writing.jpg" alt="Resume Writing Guide" />
      <div class="card-content">
        <h3>How to Write a Resume</h3>
        <p>Step-by-step guide with examples and templates.</p>
        <div class="tag">#Resumes</div>
      </div>
    </a>

    <a href="https://www.indeed.com/career-advice/interviewing/interview-questions-and-answers" class="card" target="_blank">
      <img src="images/interview.jpg" alt="Interview Tips" />
      <div class="card-content">
        <h3>Top Interview Questions & Answers</h3>
        <p>Prepare for job interviews with real examples.</p>
        <div class="tag">#Interviews</div>
      </div>
    </a>

    <a href="https://www.themuse.com/advice/how-to-build-your-professional-network" class="card" target="_blank">
      <img src="images/networking.jpg" alt="Networking Tips" />
      <div class="card-content">
        <h3>How to Network Effectively</h3>
        <p>Build meaningful professional connections.</p>
        <div class="tag">#Networking</div>
      </div>
    </a>

  </main>

  <!-- JS Filter Script -->
  <script>
    function filterCards(category) {
      const cards = document.querySelectorAll(".card");
      cards.forEach(card => {
        const tag = card.querySelector(".tag")?.textContent?.trim().replace("#", "");
        if (category === "All" || tag === category) {
          card.style.display = "block";
        } else {
          card.style.display = "none";
        }
      });
    }
  </script>
<%@ include file="Footer.jsp" %>
</body>
</html>