<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.entity.jobs"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Job Listings</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet"
/>
<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
/>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
crossorigin="anonymous"
/>
<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
/>
<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap-grid.min.css"
integrity="sha512-i1b/nzkVo97VN5WbEtaPebBG8REvjWeqNclJ6AItj7msdVcaveKrlIIByDpvjk5nwHjXkIqGZscVxOrTb9tsMA=="
crossorigin="anonymous"
referrerpolicy="no-referrer"
/>

<style>
.card {
backdrop-filter: blur(10px);
background: rgba(255, 255, 255, 0.2);
border: 1px solid rgba(255, 255, 255, 0.3);
border-radius: 15px;
box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.2);
color: #000;
margin: 20px;
transition: transform 0.3s ease;
max-width: 1200px; /* Controls how wide each card gets */
margin: 20px auto; /* Centers the card horizontally */
padding: 20px;
width: 100%;
}

.card:hover {
transform: scale(1.02);
box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.card-body {
padding: 20px;
}

.card-body h6 {
font-size: 18px;
font-weight: 600;
margin-top: 10px;
color: #333;
}

.card-body p {
font-size: 14px;
color: #555;
}

.btn-outline-light {
border: none;
color: #fff;
padding: 10px 20px;
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
border-radius: 25px;
font-weight: bold;
transition: opacity 0.3s ease;
}

.btn-outline-light:hover {
opacity: 0.85;
}

.text-center-primary {
text-align: center;
color: #007bff;
margin-bottom: 10px;
}

#next-logo,
#icons {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
}

.navbar-nav .nav-item a {
    font-size: 1.2rem; /* Increase font size */
     margin-left: 10px; 
}


.badge-custom {
font-size: 12px;
padding: 5px 10px;
}
.pagination .page-item.active .page-link {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
}

#see-btn {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
color: white;
transition: all 0.3s ease;
border-radius: 50px;
box-shadow: inset 4px 4px 10px rgba(43, 18, 76, 0.415);
}

#see-btn:hover {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
border-color: rgb(43, 18, 76);
border-radius: 50px;
}

#boxes {
box-shadow: 10px 10px 30px rgba(43, 18, 76, 0.266);
transition: all 0.5s ease;
}

#boxes:hover {
box-shadow: 10px 10px 30px rgba(43, 18, 76, 0.999);
transform: translateY(-3px);
}

#showMoreBtn {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
color: white;
border-radius: 50px;
}

#showMoreBtn:hover {
background: rgba(43, 18, 76, 0.452);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
border-color: rgb(43, 18, 76);
transition: all 0.3s ease;
border-radius: 50px;
box-shadow: inset 4px 5px 20px rgba(43, 18, 76, 0.837);
}

#search-icon {
background: rgb(43, 18, 76);
background: linear-gradient(
131deg,
rgba(43, 18, 76, 1) 0%,
rgba(170, 73, 193, 1) 83%
);
color: white;
}

.search-bar .form-control,
.search-bar .form-select {
border-radius: 50px 0 0 50px;
}

.search-bar .btn {
border-radius: 0 25px 25px 0;
}
</style>
</head>
<body class="bg-light">

<nav
class="navbar navbar-expand-lg navbar-light bg-light shadow-sm p-2"
id="headering"
>
<div class="container-fluid">
<!-- Brand and Logo -->
<div class="d-flex align-items-center" id="next-logo">
<a class="navbar-brand fw-bold fs-3" href="#">Next Hire</a>
<i class="bi bi-graph-up fs-3 ms-2"></i>
</div>

<!-- Mobile Toggle Button -->
<button
class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav"
>
<span class="navbar-toggler-icon"></span>
</button>

<!-- Navbar Links -->
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

<div>
<form class="search-bar m-5">
<div class="input-group w-50 mx-auto">
<input
type="search"
id="job-control"
class="form-control form-control-lg"
name="from"
placeholder="Job title"
/>
<select
class="form-select"
id="locationSelect"
aria-labelledby="locationLabel"
>
<option selected disabled>Location</option>
<option value="1">Any Location</option>
<option value="2">Kolkata</option>
<option value="3">Bangalore</option>
<option value="4">Haryana</option>
<option value="5">Delhi</option>
<option value="6">Goa</option>
</select>
<select
class="form-select"
id="experienceSelect"
aria-labelledby="experienceLabel"
>
<option selected disabled>Experience</option>
<option value="1">Freshers</option>
<option value="2">1-9 Year</option>
<option value="3">9-15 Years</option>
<option value="4">15+ Years</option>
<option value="5">25+ Years</option>
<option value="6">35+ Years</option>
</select>
<select
class="form-select"
id="companySelect"
aria-labelledby="companyLabel"
>
<option selected disabled>Company</option>
<option value="1">Any Company</option>
<option value="2">Google</option>
<option value="3">Microsoft</option>
<option value="4">Tesla</option>
<option value="5">Amazon</option>
<option value="6">NVIDIA</option>
<option value="7">IBM</option>
<option value="8">Adobe</option>
</select>

<button class="btn btn-outine-light" id="search-icon">
<svg
xmlns="http://www.w3.org/2000/svg"
width="16"
height="16"
fill="currentColor"
class="bi bi-search"
viewBox="0 0 16 16"
>
<path
d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"
/>
</svg>
</button>
</div>
<div id="alert-message"></div>
</form>

<%
JobDAO dao = new JobDAO(DBConnect.getConn());
// Get the first job from the list
List<jobs> list = dao.getAllJobs();
if(!list.isEmpty()) {
    jobs j = list.get(0); // Get only the first job
%>
<div class="card mt-2">
<div class="card-body">
<div class="text-center-primary">
<i class="far fa-clipboard fa-2x"></i>
</div>
<h6><%= j.getTitle() %></h6>
<p><%= j.getDescription() %></p>
<button
onclick="window.location.href='JobDetails.jsp?id=<%= j.getId() %>'"
class="btn btn-outline-light btn-sm mt-2 see-details fw-bold"
id="<%= j.getId() %>"
data-title="<%= j.getTitle() %>"
data-description="<%= j.getDescription() %>"
>
See Details
</button>
</div>
</div>
<%
}
%>

<script>
document.getElementById("showMoreBtn").addEventListener("click", function () {
document.getElementById("hidden-jobs").classList.remove("d-none");
this.style.display = "none"; // Hide the button after clicking
});

document.addEventListener("DOMContentLoaded", function () {
// Retrieve stored values from localStorage
const storedJobTitle = localStorage.getItem("jobTitle");
const storedLocation = localStorage.getItem("location");
const storedExperience = localStorage.getItem("experience");
const storedCompany = localStorage.getItem("company");

// Check if values exist and populate the fields
if (storedJobTitle)
document.querySelector("#job-control").value = storedJobTitle;
if (storedLocation)
document.querySelector("#locationSelect").value = storedLocation;
if (storedExperience)
document.querySelector("#experienceSelect").value = storedExperience;
if (storedCompany)
document.querySelector("#companySelect").value = storedCompany;
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>