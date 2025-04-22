<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Next Hire-Find Your Dream Job</title>
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
/* General Styling */
body {
	font-family: "Poppins", sans-serif;
}

/* Hero Section */
.hero {
	padding: 30px 0;
	background: #f8f9fa;
}

#NextHire {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

#navbarNav ul li a, #catagory {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

#login-btn, #SignUp-btn, #profileDropdown, #button-search {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
}

/* Animated Text */
.animated-text {
	display: inline-block;
	animation: fadeIn 2s ease-in-out infinite alternate;
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

@
keyframes fadeIn { 0% {
	opacity: 0.3;
}

100
%
{
opacity
:
1;
}
}

/* Search Bar */
.search-bar .form-control, .search-bar .form-select {
	border-radius: 25px 0 0 25px;
}

.search-bar .btn {
	border-radius: 0 25px 25px 0;
}

/* Hover Effects */
.badge {
	padding: 8px 12px;
	font-size: 14px;
	cursor: pointer;
	transition: 0.3s;
	animation: 2s ease-in-out infinite alternate;
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

/* Hero Image */
.hero-image {
	animation: floatImage 3s ease-in-out infinite alternate;
	z-index: 1;
}

@
keyframes floatImage { 0% {
	transform: translateY(0);
}

100
%
{
transform
:
translateY(
-20px
);
}
}
.img-fluid {
	border-radius: 10px;
	position: relative;
}

.dropdown-menu {
	position: absolute;
	z-index: 1000;
}

.mt-3 {
	animation-duration: 8s;
	animation-name: slide-in;
	animation-iteration-count: infinite;
}

.collapse a {
	transition: opacity 0.5s allow-discrete;
}

.collapse a:hover, a:focus {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
}

.job-box {
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.job-box h5 {
	font-weight: bold;
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.job-box p {
	color: #404446;
	margin: 0;
}

.job-box:hover p {
	color: #4f4a4a;
}

.active, #get-started {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: #fff;
}

.popular-job, #BuyAny, #Frequently {
	font-weight: bold;
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.active p {
	color: #fff;
}

.container {
	max-width: 90vw;
}

#title {
	font-size: 30px;
	font-weight: bold;
	color: #0c0b0b;
}

.subtitle {
	font-size: 16px;
	color: #666;
	margin-bottom: 20px;
}

.job-list {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.job-card {
	display: flex;
	align-items: center;
	background: white;
	border-radius: 10px;
	padding: 15px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	justify-content: space-between;
}

.job-card img {
	width: 40px;
	height: 40px;
}

.job-info {
	flex: 1;
	margin-left: 15px;
}

.job-info h5 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

.job-info p {
	margin: 5px 0 0;
	font-size: 14px;
	color: #666;
}

.apply-btn {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	font-weight: 700;
	border: none;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
}

.apply-btn:hover {
	background: rgb(87, 54, 130);
	background: linear-gradient(131deg, rgb(87, 57, 126) 0%,
		rgb(223, 163, 237) 83%);
	border-radius: 5px;
	color: white;
	font-size: 16px;
	font-weight: 700;
}

.see-more-btn {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: #eadada;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	margin-top: 20px;
	cursor: pointer;
}

.see-more-btn:hover {
	background: rgb(87, 54, 130);
	background: linear-gradient(131deg, rgb(87, 57, 126) 0%,
		rgb(223, 163, 237) 83%);
}

html {
	scroll-behavior: smooth;
}

.FAQ {
	width: 100%;
}

.accordion {
	background: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.accordion-item {
	border-bottom: 1px solid #e2e8f0;
}

.accordion-item:last-child {
	border-bottom: none;
}

.accordion-header {
	padding: 1rem 1.25rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
	background: white;
	transition: background-color 0.3s ease;
}

.accordion-header:hover {
	background: #f8fafc;
}

.accordion-title {
	font-weight: 500;
	color: #2d3748;
	font-size: 1rem;
}

.accordion-icon {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background: #f1f5f9;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: transform 0.3s ease;
}

.accordion-icon::before, .accordion-icon::after {
	content: "";
	position: absolute;
	background: #64748b;
	border-radius: 1px;
	transition: transform 0.3s ease;
}

.accordion-icon::before {
	width: 12px;
	height: 2px;
}

.accordion-icon::after {
	width: 2px;
	height: 12px;
}

.accordion-content {
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.3s ease-out;
	background: white;
}

.accordion-body {
	padding: 0 1.25rem 1rem;
	color: #4a5568;
	font-size: 0.95rem;
}

.accordion-item.active .accordion-icon {
	transform: rotate(45deg);
	background: #e2e8f0;
}

.accordion-item.active .accordion-header {
	background: #f8fafc;
}



/*Map*/
.mapouter {
	position: relative;
	text-align: right;
	width: 100%;
	height: 254px;
}

.gmap_canvas {
	overflow: hidden;
	background: none !important;
	width: 100%;
	height: 254px;
}

.gmap_iframe {
	height: 254px !important;
}
</style>
</head>
<body>
	<!-- Header Section -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<div id="NextHire">
				<a class="navbar-brand fw-bold fs-3" href="#">Next Hire</a> <i
					class="bi bi-graph-up fs-3"> </i>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto" id="tagItems">
					<li class="nav-item"><a class="nav-link"
						href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
					<li class="nav-item"><a class="nav-link" href="#title">Jobs</a></li>
					<li class="nav-item"><a class="nav-link" href="#platform-section">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="#FAQ">FAQ</a></li>
				</ul>
				<a href="Login.jsp" class="btn btn-outline-light me-2"
					id="login-btn">Login</a> <a href="SignUp.jsp"
					class="btn btn-outline-light me-2" id="SignUp-btn">Sign
					Up</a>
			</div>
		</div>
	</nav>

	<!-- 1st Section -->
	<section class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="maintext">
						<h1 class="fw-bold">
							Find Your <span class="animated-text">Dream Job</span> And Make
							Your Goal
						</h1>
						<p class="text-muted">Connecting talent with opportunities
							worldwide. Start your journey to career success today.</p>
					</div>
					<!-- Search Box -->
					<form class="search-bar">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Job title, keyword" /> <select
								class="form-select">
								<option selected disabled>Location</option>
								<option value="1">India</option>
								<option value="2">London</option>
								<option value="3">New York</option>
								<option value="4">Canada</option>
								<option value="5">America</option>
								<option value="6">China</option>
								<option value="7">Australia</option>
							</select>
							<button class="btn btn-outline-light" id="button-search">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                  </svg>
							</button>
						</div>
					</form>

					<!-- Popular Searches -->
					<div class="mt-3" id="catagories">
						<span class="badge">UI/UX</span> <span class="badge">Web
							Development</span> <span class="badge">App Development</span> <span
							class="badge">Graphic Designing</span> <span class="badge">Data
							Analyst</span> <span class="badge">Content Writing</span> <span
							class="badge">Sales</span> <span class="badge">Health &
							Care</span> <span class="badge">Artificial Intelligence</span> <span
							class="badge">Cyber Security</span>
					</div>
				</div>

				<!-- Right Side Image -->
				<div class="col-lg-6 text-center">
					<img
						src="https://cdn.pixabay.com/photo/2015/01/08/18/11/laptops-593296_1280.jpg"
						class="img-fluid hero-image" />
				</div>
			</div>
		</div>
	</section>

	<!-- 2nd Section -->
	<div class="container text-center mt-5">
		<h2>
			<span class="fw-bold">Job</span> <span class="fw-bold" id="catagory">Category</span>
		</h2>
		<p id="subheading">Get the most exciting jobs and grow your career
			fast with others</p>
		<div class="jobopening">
			<div class="row mt-4">
				<div class="col-md-4">
					<div class="job-box">
						<h5>UI/UX Designer</h5>
						<p>25 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Website Development</h5>
						<p>27 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Digital Marketing</h5>
						<p>7 Vacancy</p>
					</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-md-4">
					<div class="job-box">
						<h5>Health & Care</h5>
						<p>15 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Cyber Security</h5>
						<p>20 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Content Writing</h5>
						<p>16 Vacancy</p>
					</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-md-4">
					<div class="job-box">
						<h5>Data Analyst</h5>
						<p>32 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Sales</h5>
						<p>45 Vacancy</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="job-box">
						<h5>Graphic Designing</h5>
						<p>23 Vacancy</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 3rd Section -->
	<div class="container text-center mt-5">
		<h2 id="title">
			Popular <span class="popular-job fs-2">Jobs</span>
		</h2>
		<p class="subtitle">Check out featured jobs from top companies
			around the globe and apply now</p>

		<div class="job-list">
			<!-- Job 1 -->
			<div class="job-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/512px-Dell_Logo.svg.png"
					alt="Dell" />
				<div class="job-info">
					<h5>UI/UX Designer</h5>
					<p>Remote | Berlin | 5+ Hours | Intermediate-Level | Full Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>

			<!-- Job 2 -->
			<div class="job-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/4/4a/Amazon_icon.svg"
					alt="Amazon" />
				<div class="job-info">
					<h5>iOS Developer</h5>
					<p>Remote | US | 7 Hours | Beginner-Level | Part Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>

			<!-- Job 3 -->
			<div class="job-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg"
					alt="Microsoft" />
				<div class="job-info">
					<h5>Project Manager</h5>
					<p>Remote | UK | 12 Hours | Advance-Level | Full Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>

			<!-- Job 4 -->
			<div class="job-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg"
					alt="Netflix" />
				<div class="job-info">
					<h5>Website Developer</h5>
					<p>Remote | Canada | 8 Hours | Mid-Level | Full Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>
			<!-- Job 5 -->
			<div class="job-card">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp6USWqalVPkaZStvG0omKPtHPMKwGMtXR6A&s"
					alt="Pinterest" />
				<div class="job-info">
					<h5>iOS Developer</h5>
					<p>Remote | US | 7 Hours | Beginner-Level | Part Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>

			<!-- Job 6 -->
			<div class="job-card">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf9UCBtO1xeRnNJ6hhcIE0dXGEszNg_vDwQQ&s"
					alt="Game" />
				<div class="job-info">
					<h5>Game Developer</h5>
					<p>Remote | UK | 7 Hours | Beginner-Level | Part Time</p>
				</div>
				<button class="apply-btn">Apply Now</button>
			</div>
		</div>

		<button class="see-more-btn">
			<a href="../Sample Login/index.html"
				class="text-light text-decoration-none">See More -></a>
		</button>
	</div>

	<!--4th section-->
	<section id="pricing" class="bg-light py-5">
		<div class="container py-5">
			<div class="text-center mb-5">
				<h2>
					<span class="fw-bold" id="BuyAny">Buy Any</span> <span
						class="text-dark fw-bold">Plans</span>
				</h2>
				<p class="text-muted">Choose the plan that works for you</p>
			</div>
			<div class="row g-4">
				<div class="col-lg-4">
					<div class="card pricing-card h-100 p-4 shadow-sm">
						<div class="card-body">
							<h5 class="text-muted">Basics</h5>
							<h2 class="display-4 fw-bold mb-4">
								$9<small class="fs-6">/year</small>
							</h2>
							<ul class="list-unstyle mb-4">
								<li class="mb-3"><i class="bi bi-check me-2"></i>Know about
									Vacancy</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>Get
									verified badge</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>Profile
									engagement to Company Recruiters</li>
								<a href="#" class="btn btn-outline-light w-100" id="get-started">Get
									Started</a>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="card pricing-card h-100 p-4 shadow-sm">
						<div class="card-body">
							<span class="badge bg-primary mb-2">Popular</span>
							<h5 class="text-muted">Pro</h5>
							<h2 class="display-4 fw-bold mb-4">
								$19<small class="fs-6">/year</small>
							</h2>
							<ul class="list-unstyle mb-4">
								<li class="mb-3"><i class="bi bi-check me-2"></i>All Basic
									Features</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>Boost your
									account</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>20000+
									users</li>
								<a href="#" class="btn btn-outline-light w-100" id="get-started">Get
									Started</a>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="card pricing-card h-100 p-4 shadow-sm">
						<div class="card-body">
							<h5 class="text-muted">Premium</h5>
							<h2 class="display-4 fw-bold mb-4">
								$49<small class="fs-6">/year</small>
							</h2>
							<ul class="list-unstyle mb-4">
								<li class="mb-3"><i class="bi bi-check me-2"></i>All
									Popular Features</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>Get more
									opportunity</li>
								<li class="mb-3"><i class="bi bi-check me-2"></i>Account
									mostly preferred by HR's</li>
								<a href="#" class="btn btn-outline-light w-100" id="get-started">Get
									Started</a>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--Frequently Asked Questions-->
	<div id="FAQ">
		<h1 class="text-center fw-bold fs-2 p-4" id="Frequently">
			Frequently Asked Questions</h1>
		<div class="accordion">
			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title"> How do I create an account?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">To create an account, click on
						the "Sign Up" button, enter your details, and verify your email.
						Once verified, you can complete your profile and start applying
						for jobs.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title"> Is creating a profile free?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">Yes, creating a job seeker
						profile and applying for jobs is completely free.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title">How do I apply for jobs?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">After logging in, search for jobs
						using filters like location, industry, and job type. Click on the
						job listing and select "Apply Now" to submit your application.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title">Can I edit my
						profile and resume after submitting an application?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">Yes, you can edit your profile at
						any time. However, once you've applied for a job, any updates to
						your profile won't affect past applications.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title">How do I apply for jobs?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">After logging in, search for jobs
						using filters like location, industry, and job type. Click on the
						job listing and select "Apply Now" to submit your application.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title">How do I contact an employer?</span>
					<span class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">If the employer allows direct
						contact, their details will be provided in the job description.
						Otherwise, wait for them to reach out after you apply.</div>
				</div>
			</div>

			<div class="accordion-item">
				<div class="accordion-header">
					<span class="accordion-title">How can I delete my account?</span> <span
						class="accordion-icon"></span>
				</div>
				<div class="accordion-content">
					<div class="accordion-body">You can request account deletion
						from your profile settings. Once deleted, all your data will be
						permanently removed.</div>
				</div>
			</div>
		</div>
	</div>

	<!--Footer About US-->
	<div id="aboutus">
		
		<section class="contact-header text-center bg-light" id="platform-section">
			<h1 class="fw-bold fs-4 mt-1" id="Frequently">About Us</h1>
			<p class="aboutparagraph">At Next Hire, we bridge the gap between
				talent and opportunity. Whether you're a job seeker looking for your
				dream role or an employer searching for top talent, our platform is
				designed to make the hiring process smooth, efficient, and
				successful. We are a dynamic job marketplace committed to helping
				individuals find the right job and businesses find the right people.
				With cutting-edge technology, AI-powered job matching, and a vast
				network of recruiters and employers, we make job searching and
				hiring hassle-free.</p>
		</section>
		<section class="contact-section py-5">
			<div class="container">
				<div class="row">
					<!-- Contact Info -->
					<div class="col-md-6">
						<h3 id="Frequently">Get In Touch</h3>
						<p>For more query contact us on the details given below.</p>
						<p>
							<strong>Address: </strong> India ,West Bengal
						</p>
						<p id="phone">
							<strong>Phone Number:</strong> +123-456-7890
						</p>
						<p>
							<strong>Email: </strong><a href="next.hire1234@gmail.com"
								class="text-decoration-none" id="email-id">next.hire1234@gmail.com</a>
						</p>
						<div class="social-icons">
							<a href="#"><i class="bi bi-twitter text-primary"></i></a> <a
								href="#"><i class="bi bi-linkedin text-primary"></i></a> <a
								href="#"><i class="bi bi-instagram" id="insta"></i></a> <a
								href="#"><i class="bi bi-facebook text-primary"></i></a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="contact-form bg-light p-4 rounded shadow-sm">
							<h4>Send a Message</h4>
							<form>
								<div class="mb-3">
									<input type="text" class="form-control" placeholder="Name" />
								</div>
								<div class="mb-3">
									<input type="email" class="form-control"
										placeholder="E-mail address" />
								</div>
								<div class="mb-3">
									<textarea class="form-control" rows="4" placeholder="Message"></textarea>
								</div>
								<button type="submit" class="btn btn-outline-light w-100"
									id="get-started">Submit</button>
							</form>
						</div>
					</div>
				</div>

				<!-- Map -->
				<div class="row mt-4">
					<div class="col-12">
						<div class="mapouter">
							<div class="gmap_canvas">
								<iframe class="gmap_iframe" width="90%" frameborder="0"
									scrolling="no" marginheight="0" marginwidth="0"
									src="https://maps.google.com/maps?width=440&amp;height=254&amp;hl=en&amp;q=India&amp;t=k&amp;z=16&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
								<a href="https://sprunkin.com/">India Map</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<footer >
			<%@ include file="Footer.jsp"%>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>

	<script>
      // Text Animation
      document.addEventListener("DOMContentLoaded", function () {
        const words = ["Dream Job", "Perfect Career", "Success"];
        let i = 0;

        setInterval(() => {
          document.querySelector(".animated-text").textContent = words[i];
          i = (i + 1) % words.length;
        }, 2000);
      });
      
      // GSAP Animations
      document.addEventListener("DOMContentLoaded", function () {
        // GSAP Fade-in Animation for Navbar, Hero Text, and Job Category
        gsap.from(".navbar", { opacity: 0, y: -30, duration: 1 });
        gsap.from(".hero-image", {
          opacity: 0,
          scale: 0.8,
          duration: 1.5,
          delay: 0.5,
        });
        gsap.from(".fw-bold", {
          opacity: 0,
          x: -50,
          duration: 1.2,
          ease: "power2.out",
        });

        gsap.from(".job-box", {
          opacity: 0,
          y: 30,
          duration: 1,
          stagger: 0.2,
          delay: 1.2,
        });

        // Bouncing Effect for the Main Heading
        gsap.to(".animated-text", {
          y: -5,
          repeat: -1,
          yoyo: true,
          duration: 0.8,
          ease: "power1.inOut",
        });

        // Adding Hover Effect to Job Boxes
        document.querySelectorAll(".job-box").forEach((box) => {
          box.addEventListener("mouseenter", () => {
            gsap.to(box, { scale: 1.05, duration: 0.2, ease: "power1.out" });
          });
          box.addEventListener("mouseleave", () => {
            gsap.to(box, { scale: 1, duration: 0.2 });
          });
        });
      });

      //Accordion
      document.querySelectorAll(".accordion-header").forEach((button) => {
        button.addEventListener("click", () => {
          const accordionItem = button.parentElement;
          const accordionContent = button.nextElementSibling;

          // Get current height of content for smooth animation
          const contentHeight =
            accordionContent.querySelector(".accordion-body").offsetHeight;

          // If this item is already active
          if (accordionItem.classList.contains("active")) {
            // Close it
            accordionContent.style.maxHeight = "0px";
            accordionItem.classList.remove("active");
            accordionContent.classList.remove("active");
          } else {
            // Close any open items first
            document
              .querySelectorAll(".accordion-item.active")
              .forEach((activeItem) => {
                activeItem.classList.remove("active");
                activeItem.querySelector(".accordion-content").style.maxHeight =
                  "0px";
                activeItem
                  .querySelector(".accordion-content")
                  .classList.remove("active");
              });

            // Open clicked item
            accordionContent.style.maxHeight = contentHeight + "px";
            accordionItem.classList.add("active");
            accordionContent.classList.add("active");
          }
        });
      });

      //Search for Job
      document.addEventListener("DOMContentLoaded", function () {
        document
          .getElementById("jobSearchForm")
          .getElementById("submit", function (click) {
            click.preventDefault(); // Prevent default form submission

            // Get input values
            let jobTitle = document.getElementById("jobTitle").value.trim();
            let location = document.getElementById("location").value;

            // Check if fields are filled
            if (jobTitle === "" || location === "") {
              alert("Please enter a job title and select a location.");
              return;
            }

            // Redirect to search results page (modify URL as needed)
            let searchURL = `search-results.html?job=${encodeURIComponent(
              jobTitle
            )}&location=${encodeURIComponent(location)}`;
            window.location.href = searchURL;
          });
      });

      //submit form
      document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        const submitButton = form.querySelector("button");

        form.addEventListener("submit", function (click) {
          click.preventDefault(); // Prevent default form submission

          // Get form values
          let name = document.getElementById("name").value.trim();
          let email = document.getElementById("email").value.trim();
          let message = document.getElementById("message").value.trim();
          let submitButton = document.getElementById("submitButton");

          // Basic validation
          if (name === "" || email === "" || message === "") {
            alert("Please fill out all fields before submitting.");
            return;
          }

          let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
          if (!email.match(emailPattern)) {
            alert("Please enter a valid email address.");
            return;
          }

          submitButton.textContent = "Sending...";
          submitButton.disabled = true;
          submitButton.style.backgroundColor = "#ffa500";

          // Simulate form submission process
          setTimeout(() => {
            alert("Message sent successfully!");
            submitButton.style.backgroundColor = "green";
            submitButton.textContent = "Submitted";
            submitButton.disabled = true;
            setTimeout(() => {
              location.reload();
            }, 1000);
          }, 1000);
        });
      });
    </script>
</body>
</html>
