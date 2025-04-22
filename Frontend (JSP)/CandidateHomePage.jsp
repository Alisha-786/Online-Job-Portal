<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home Page</title>
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

#search-icon {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
}

.search-bar .form-control, .search-bar .form-select {
	border-radius: 50px 0 0 50px;
}

.search-bar .btn {
	border-radius: 0 25px 25px 0;
}

.carousel-container {
	max-width: 800px;
	margin: auto;
	padding: 40px 0;
}

.job-card {
	background: #f8f9faf8;
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	min-height: 220px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.job-title {
	font-size: 20px;
	font-weight: bold;
	color: #343a40;
}

#danger:hover {
	background-color: rgba(255, 0, 0, 0.422);
}

.company-name {
	font-size: 16px;
	color: #6c757d;
	margin-bottom: 5px;
}

.job-details {
	font-size: 14px;
	color: #495057;
}

.apply-btn {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block;
	margin-top: 10px;
	font-weight: bold;
}

.apply-btn:hover {
	background-color: #0056b3;
}

.carousel-control-prev, .carousel-control-next {
	width: 40px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	color: white;
}

.carousel-item {
	transition: transform 0.8s ease-in-out, opacity 0.8s ease-in-out;
}

.job-box {
	background: #fffffffa;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.job-box h5 {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	font-weight: bold;
}

.job-box p {
	margin: 0;
}

.job-box:hover {
	box-shadow: 0 12px 12px 12px rgba(0, 0, 0, 0.2);
	background: rgba(184, 180, 180, 0.409);
	color: black;
}

.job-box:hover p {
	color: #fff;
}

.testimonial-img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	object-fit: cover;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: rgba(0, 0, 0, 0.596);
	border-radius: 50%;
}

#alert-message {
	position: absolute;
	background-color: #ffdddd;
	left: 45%;
	color: rgb(234, 60, 60);
	padding: 5px 10px;
	border: 1px solid red;
	border-radius: 5px;
	font-size: 10px;
	margin-top: 5px;
	display: none;
	align-items: center;
}

.card:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	transform: scale(1.01);
	transition: 0.3s ease;
}

.highlight-purple, #link-read, #interactive-profile {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

#join-now {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	width: 130px;
	height: 50px;
	border-radius: 10px;
	padding: 10px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

#join-now:hover {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 0.778) 0%,
		rgba(171, 73, 193, 0.799) 83%);
}

.section-title {
	font-weight: 800;
	font-size: 2rem;
}

.CTA {
	background-color: white;
	border-radius: 10px;
	padding: 30px;
}

#icon-assesment {
	font-size: 3rem;
	justify-content: center;
	align-items: center;
}

.footer-section {
	width: 100%;
	height: 100%;
	margin-top: 20px;
}

#email-id {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.social-icons a {
	font-size: 1.5rem;
	margin-right: 15px;
	background: white;
}

#insta {
	background: rgb(21, 6, 41);
	background: linear-gradient(122deg, rgba(21, 6, 41, 1) 0%,
		rgba(43, 18, 76, 1) 1%, rgba(94, 12, 111, 1) 12%,
		rgba(139, 26, 145, 1) 27%, rgba(205, 74, 228, 1) 45%,
		rgba(251, 89, 213, 1) 62%, rgba(245, 147, 147, 1) 75%,
		rgba(223, 164, 127, 1) 84%, rgba(219, 209, 62, 1) 93%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.footer {
	text-align: center;
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
}

.footer a {
	text-decoration: none;
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

#get-started {
	background: rgb(43, 18, 76);
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
}
</style>
</head>
<body>
	<!-- Header Section-->
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
        <li class="nav-item"><a class="nav-link" href="#platform-section">About Us</a></li>
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

	<!--Search box-->
	<div class="middlebody p-2">
		<div class="jobsearch mt-5">
			<form class="search-bar">
				<div class="input-group w-50 mx-auto">
					<input type="search" id="job-control"
						class="form-control form-control-lg" name="from"
						placeholder="Job title" /> <select
						class="form-select" id="locationSelect"
						aria-labelledby="locationLabel">
						<option selected disabled>Location</option>
						<option value="1">India</option>
						<option value="2">London</option>
						<option value="3">New York</option>
						<option value="4">Canada</option>
						<option value="5">America</option>
						<option value="6">China</option>
						<option value="7">Australia</option>
					</select> <select class="form-select" id="experienceSelect"
						aria-labelledby="experienceLabel">
						<option selected disabled>Experience</option>
						<option value="1">Freshers</option>
						<option value="2">1-9 Year</option>
						<option value="3">9-15 Years</option>
						<option value="4">15+ Years</option>
						<option value="5">25+ Years</option>
						<option value="6">35+ Years</option>
					</select> <select class="form-select" id="companySelect"
						aria-labelledby="companyLabel">
						<option selected disabled>Company</option>
						<option value="1">Google</option>
						<option value="2">Apple</option>
						<option value="3">Microsoft</option>
						<option value="4">Tesla</option>
						<option value="5">Amazon</option>
						<option value="6">NVIDIA</option>
						<option value="7">IBM</option>
						<option value="8">Adobe</option>
					</select>
					<button class="btn btn-outine-light" id="search-icon">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
              </svg>
					</button>
				</div>
			</form>

			<div id="alert-message"></div>
		</div>

		<!-- First Section -->
		<div class="container carousel-container">
			<h3 class="text-center fw-bold text-light">Job Opportunities</h3>

			<div id="jobCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<!-- Slide 1 -->
					<div class="carousel-item active">
						<div class="d-flex justify-content-center">
							<div class="job-card w-75">
								<div class="company-name">TechNova</div>
								<div class="job-title">Software Engineer (Backend)</div>
								<div class="job-details">📍 Remote | 💰 $90K - $120K +
									Benefits</div>
								<p>Join our AI team to build high-performance APIs and
									scalable systems!</p>
								<a href="browse.jsp" class="apply-btn">Apply Now</a>
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item">
						<div class="d-flex justify-content-center">
							<div class="job-card w-75">
								<div class="company-name">CreativeLabs</div>
								<div class="job-title">UI/UX Designer</div>
								<div class="job-details">📍 New York, NY (Hybrid) | 💰
									$70K - $90K</div>
								<p>Craft intuitive and user-friendly experiences for mobile
									and web applications.</p>
								<a href="browse.jsp" class="apply-btn">Apply Now</a>
							</div>
						</div>
					</div>

					<!-- Slide 3 -->
					<div class="carousel-item">
						<div class="d-flex justify-content-center">
							<div class="job-card w-75">
								<div class="company-name">FinTech Hub</div>
								<div class="job-title">Product Manager</div>
								<div class="job-details">📍 Remote | 💰 Competitive +
									Stock Options</div>
								<p>Lead our product roadmap and drive innovation in
									financial solutions.</p>
								<a href="browse.jsp" class="apply-btn">Apply Now</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Navigation Buttons -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#jobCarousel" data-bs-slide="prev"
					title="Previous job" aria-label="Previous job opportunity">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#jobCarousel" data-bs-slide="next" title="Next job"
					aria-label="Next job opportunity">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>

	<!-- Second Section -->
	<div class="container text-center mt-5">
		<h2>
			<span class="text-light fw-bold">Job</span> <span
				class="text-light fw-bold">Category</span>
		</h2>
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

	<!--Third Section-->
	<section id="testimonials" class="py-5">
		<div class="container py-5">
			<div class="text-center mb-5">
				<h2 class="fw-bold text-light">Follow</h2>
			</div>

			<div id="ceoCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<!-- Slide 1 -->
					<div class="carousel-item active">
						<div class="row text-center">
							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://i.pinimg.com/736x/29/3a/95/293a95ac45fab6249c593bdff49ee894.jpg"
										alt="pic1" />
									<h5>Alex Volkov</h5>
									<small class="text-muted">CEO, Archer Group</small>
									<p class="text-muted">"Innovation is the bridge between
										dreams and reality."</p>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://i.pinimg.com/736x/16/a9/b9/16a9b9f6146fd0358ff0eb1397890c70.jpg"
										alt="pic2" />
									<h5>Jules Ambrose</h5>
									<small class="text-muted">Lawyer, Silver&Klein</small>
									<p class="text-muted">"A person who is quietly confident
										makes the best leader."</p>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://i.pinimg.com/236x/a6/40/33/a640337a30c0c2589169a8749830610a.jpg"
										alt="pic3" />
									<h5>Rhys Larsen</h5>
									<small class="text-muted">Bodyguard, Eldorra</small>
									<p class="text-muted">"You should learn from your
										competitor, but never copy. Copy and you die."</p>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item">
						<div class="row text-center">
							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://i.pinimg.com/736x/1b/91/c8/1b91c828b016749e88a0ec19992e8900.jpg"
										alt="pic4" />
									<h5>Christian Harper</h5>
									<small class="text-muted">CEO, Harper Security</small>
									<p class="text-muted">"Success is built on persistence, not
										luck."</p>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Xku0Yh4G8Z2k4GSCGMnnp_3qO_URsT-rHQ&s"
										alt="pic5" />
									<h5>Dante Russo</h5>
									<small class="text-muted">CEO, Russo Group</small>
									<p class="text-muted">"Every setback is a setup for a
										comeback."</p>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-4 shadow-sm">
									<div class="follow">
										<span class="badge bg-primary mb-2">Follow
											<i class="bi bi-plus-circle"></i>
										</span>
									</div>
									<img class="testimonial-img mx-auto d-block"
										src="https://i.pinimg.com/736x/9e/5c/7b/9e5c7b209dc709dcc4f5608930e93a11.jpg"
										alt="pic6" />
									<h5>Zade Meadows</h5>
									<small class="text-muted">CEO ,Z Organisation</small>
									<p class="text-muted">"A leader is someone who brings
										people together."</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Carousel Controls -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#ceoCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#ceoCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</button>
			</div>
		</div>
	</section>

	<!--Fourth section-->
	<div class="container py-3" id="platform-section">
		<!-- Heading and CTA -->
		<div class="CTA">
			<div class="row mb-5">
				<div class="col text-center">
					<h2 class="section-title">
						India's Best <span class="highlight-purple">Platform</span><br />
						For Seekers
					</h2>
					<p class="text-muted">Our job-seeking platform is a
						comprehensive solution designed to connect skilled professionals
						with leading employers across industries. With advanced
						algorithms, tailored job recommendations, and intuitive tools for
						profile optimization, we streamline the employment journey from
						discovery to placement. By fostering meaningful connections
						between talent and opportunity, we are committed to accelerating
						career growth and supporting workforce development on a global
						scale.</p>
				</div>
			</div>

			<!-- Image Grid and Text -->
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="row g-3">
						<div class="col-6">
							<img
								src="https://images.unsplash.com/photo-1604328699206-5f24c5ed8dd4?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
								class="img-fluid rounded" alt="Office 1" />
						</div>
						<div class="col-6">
							<img
								src="https://images.unsplash.com/photo-1606857521015-7f9fcf423740?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
								class="img-fluid rounded" alt="Office 2" />
						</div>
						<div class="col-12">
							<img
								src="https://plus.unsplash.com/premium_photo-1661331603643-e5d639f4e10a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
								class="img-fluid rounded" alt="Team Meeting" />
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<h3 class="fw-bold">
						Our Service To The<br /> Provide Your <span
							class="highlight-purple">Career Growth</span>
					</h3>
					<p class="text-muted">Our platform offers a suite of
						professional services tailored to support every stage of the
						job-seeking journey. These include advanced resume building tools,
						personalized career assessments, skill-based job matching, and
						interactive interview preparation modules. Users can also access
						industry-specific insights, mentorship programs, and real-time job
						alerts to stay ahead in a competitive market. With a focus on
						efficiency and effectiveness, our services are designed to empower
						individuals to achieve their career goals with confidence and
						clarity.</p>
					<a href="#" class="btn btn-outine-light" id="join-now">Join
						Now <i class="bi bi-arrow-right-circle"></i>
					</a>
				</div>
			</div>
		</div>

		<!-- First Row - Cards -->
		<div class="row mt-4 text-center justify-content-center">
			<div class="col-md-4">
				<div class="card p-3">
					<i class="bi bi-search" id="icon-assesment"></i>
					<div class="card-body">
						<h5 class="card-title fw-bold" id="interactive-profile">
							Profile Highlighters</h5>
						<p class="card-text">Professionally enable open-source leader
							skills without front-end scenarios. Best of reconceptualize
							intermandated intellectual capital.</p>
						<a href="#" class="text-decoration-none" id="link-read">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card p-3">
					<i class="bi bi-journal-check" id="icon-assesment"></i>
					<div class="card-body">
						<h5 class="card-title fw-bold" id="interactive-profile">
							Interactive Assessment</h5>
						<p class="card-text">Professionally enable open-source leader
							skills without front-end scenarios. Best of reconceptualize
							intermandated intellectual capital.</p>
						<a href="#" class="text-decoration-none" id="link-read">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card p-3">
					<i class="bi bi-lightbulb" id="icon-assesment"></i>
					<div class="card-body">
						<h5 class="card-title fw-bold" id="interactive-profile">
							Smart Career Tools</h5>
						<p class="card-text">Access intelligent tools that enhance
							your job search—from AI-driven resume optimization to automated
							job matching tailored to your skills and goals.</p>
						<a href="#" class="text-decoration-none" id="link-read">Read
							More</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Footer-->
	<div class="footer-section bg-light" id="footer">
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
      //Header section
      document.addEventListener("DOMContentLoaded", function () {
        // Mobile Toggle Button
        const navbarToggler = document.querySelector(".navbar-toggler");
        const navbarCollapse = document.querySelector("#navbarNav");

        navbarToggler.addEventListener("click", function () {
          navbarCollapse.classList.toggle("show");
        });

        // Profile Dropdown Toggle
        const profileDropdown = document.querySelector("#profileDropdown");

        profileDropdown.addEventListener("click", function (click) {
          click.preventDefault(); // Prevents page jump
          let dropdownMenu = this.nextElementSibling;
          dropdownMenu.classList.toggle("show");
        });

        // Close dropdown when clicking outside
        document.addEventListener("click", function (click) {
          let isClickInside =
            profileDropdown.contains(click.target) ||
            (profileDropdown.nextElementSibling && 
             profileDropdown.nextElementSibling.contains(click.target));

          if (!isClickInside && profileDropdown.nextElementSibling) {
            profileDropdown.nextElementSibling.classList.remove("show");
          }
        });
      });

      //Confirm logout
      // Logout Confirmation Popup
      const logoutButton = document.getElementById("danger");
      if (logoutButton) {
        logoutButton.addEventListener("click", function (click) {
          click.preventDefault(); // Prevent default logout action

          const confirmLogout = document.createElement("div");
          confirmLogout.innerHTML = `<p>Are you sure you want to log out?</p>
             <button id="confirm-yes" style="margin-right: 10px; padding: 5px 10px; background-color: green; color: white; border: none; border-radius: 5px; cursor: pointer;">Yes</button>
             <button id="confirm-no" style="padding: 5px 10px; background-color: red; color: white; border: none; border-radius: 5px; cursor: pointer;">No</button>`;
          confirmLogout.style.cssText =
            "position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); border-radius: 5px; text-align: center; z-index: 1001;";

          document.body.appendChild(confirmLogout);

          document
            .getElementById("confirm-yes")
            .addEventListener("click", function () {
              window.location.href = "../Landing page/index1.html";
            });

          document
            .getElementById("confirm-no")
            .addEventListener("click", function () {
              document.body.removeChild(confirmLogout);
            });
        });
      }

      //Search box
      document.addEventListener("DOMContentLoaded", function () {
        const searchForm = document.querySelector(".search-bar");
        const searchBtn = document.getElementById("search-button");

        // Create alert message element
        const alertMessage = document.createElement("div");
        alertMessage.id = "alert-message";
        alertMessage.style.cssText =
          "color: white; background-color: red; padding: 10px; margin-top: 10px; text-align: center; display: none; border-radius: 5px;";
        searchForm.parentElement.appendChild(alertMessage); // Append alert below the form

        // Function to validate form
        function validateForm() {
          const jobTitle = document.querySelector("#job-control").value.trim();
          const location = document.querySelector("#locationSelect").value;
          const experience = document.querySelector("#experienceSelect").value;
          const company = document.querySelector("#companySelect").value;

          if (
            !jobTitle ||
            location === "Location" ||
            experience === "Experience" ||
            company === "Company"
          ) {
            alertMessage.innerText = "⚠️ Please fill in all fields before searching!";
            alertMessage.style.display = "block"; // Show alert

            // Hide alert after 3 seconds
            setTimeout(() => {
              alertMessage.style.display = "none";
            }, 3000);

            return false; // Stop execution
          }

          return true; // Form is valid
        }

        // Add event listener to the search form
        searchForm.addEventListener("submit", function (click) {
          click.preventDefault(); // Prevent form submission

          if (validateForm()) {
            console.log("Form is valid. Redirecting...");

            // Store search values in localStorage
            localStorage.setItem(
              "jobTitle",
              document.querySelector("#job-control").value.trim()
            );
            localStorage.setItem(
              "location",
              document.querySelector("#locationSelect").value
            );
            localStorage.setItem(
              "experience",
              document.querySelector("#experienceSelect").value
            );
            localStorage.setItem(
              "company",
              document.querySelector("#companySelect").value
            );
            // Redirect to another page (change 'browse.html' to your actual page)
            window.location.href = "browse.jsp";
          }
        });
      });

      //the follow button will turn following
      document.addEventListener("DOMContentLoaded", function () {
        const followButtons = document.querySelectorAll(".follow span");

        followButtons.forEach((button) => {
          button.addEventListener("click", function () {
            if (this.classList.contains("bg-primary")) {
              this.classList.remove("bg-primary");
              this.classList.add("bg-success");
              this.innerHTML = "Following <i class='bi bi-check-circle'></i>";
            } else {
              this.classList.remove("bg-success");
              this.classList.add("bg-primary");
              this.innerHTML = "Follow <i class='bi bi-plus-circle'></i>";
            }
          });
        });
      });

      // Form submission handler
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