<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.DB.DBConnect, com.dao.JobDAO, com.entity.jobs, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f8f9fa; 
        }

        .navbar { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 15px 20px; 
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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

        .logo{
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 28px;
            font-weight: bold;
        }

        .text{
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
            font-size: 16px;
        }

        .com-logo{
            width: 80px; 
            height: 80px; 
            border-radius: 50%; 
            margin-right: 10px;
            object-fit: cover;
        }

        .navbar ul { 
            list-style: none; 
            display: flex; 
            gap: 20px; 
            margin: 0;
            padding: 0;
        }

        .auth-buttons a { 
            text-decoration: none; 
            color: white; 
            margin-left: 10px; 
            padding: 8px 12px; 
            font-size: 14px;
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%); 
            border-radius: 5px; 
        }

        .auth-buttons{
            display: flex;
            gap: 10px;
        }

        .auth-buttons a:hover{
            background: rgb(168, 24, 168);
        }

        .job-container { 
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between; 
            gap: 20px;
            padding: 40px;
            min-height: 100vh;
            box-sizing: border-box;
        }

        .job-details { 
            flex: 1;
            min-width: 300px;
            background: white; 
            padding: 30px; 
            border-radius: 8px; 
            box-shadow: 0px 4px 6px rgba(0,0,0,0.1); 
        }

        .details{
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-top: 20px;
        }

        .job-sidebar { 
            width: 350px;
            background: white; 
            padding: 30px; 
            border-radius: 8px; 
            box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
        }

        .save-apply { 
            display: block; 
            width: 100%; 
            padding: 12px; 
            margin: 10px 0; 
            border: none; 
            cursor: pointer; 
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .save-apply{
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            color: white; 
        }
        
        .save-apply:hover{
            background: rgb(168, 24, 168);
            color: white;
        }
        
        .job-type-badge {
            background: rgba(43,18,76,0.1);
            color: rgb(43,18,76);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            margin-left: 10px;
        }
        
        .job-overview p {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>

<body>
    <%
    int jobId = Integer.parseInt(request.getParameter("id"));
    JobDAO dao = new JobDAO(DBConnect.getConn());
    jobs job = dao.getJobById(jobId);
    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM d, yyyy");
    %>

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
        <li class="nav-item"><a class="nav-link" href="../Browse-Jobs/browse.html">Jobs</a></li>
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
    
    <main class="job-container">
        <section class="job-details">
            <img src="<%= job.getLogo() %>" alt="company logo" class="com-logo">
            <h1 class="details"><%= job.getTitle() %></h1>
            <p class="company"><%= job.getCompanyName() %> | <%= job.getLocation() %></p>
            <p class="salary">$<%= job.getSalary() %> <span class="job-type-badge"><%= job.getJobType() %></span></p>
            
            <h2 class="details">Job Description</h2>
            <p><%= job.getDescription() %></p>
            
            <% if(job.getDescription().contains("Responsibilities:")) { %>
                <h2 class="details">Responsibilities:</h2>
                <ul>
                    <% String[] responsibilities = job.getDescription().split("Responsibilities:")[1].split("Skills And Qualifications:")[0].split("\n"); %>
                    <% for(String resp : responsibilities) { 
                        if(!resp.trim().isEmpty()) { %>
                            <li><%= resp.trim() %></li>
                        <% } 
                    } %>
                </ul>
            <% } %>
            
            <% if(job.getDescription().contains("Skills And Qualifications:")) { %>
                <h2 class="details">Skills And Qualifications:</h2>
                <ul>
                    <% String[] skills = job.getDescription().split("Skills And Qualifications:")[1].split("\n"); %>
                    <% for(String skill : skills) { 
                        if(!skill.trim().isEmpty()) { %>
                            <li><%= skill.trim() %></li>
                        <% } 
                    } %>
                </ul>
            <% } %>
        </section>
        
        <aside class="job-sidebar">
            <a href="#" class="save-apply">Save Job</a>
            <!-- Change this line in JobDetails.jsp -->
<a href="ApplyJobs.jsp?id=<%= jobId %>" class="save-apply">Apply Now</a>
            
            <div class="job-overview mt-4">
                <h3 class="details">Job Overview</h3>
                <p><strong>Published on:</strong> <%= dateFormat.format(job.getPostedDate()) %></p>
                <p><strong>Experience:</strong> <%= job.getExperience() %></p>
                <p><strong>Job Location:</strong> <%= job.getLocation() %></p>
                <p><strong>Salary:</strong> $<%= job.getSalary() %></p>
                <p><strong>Industry:</strong> <%= job.getIndustry() %></p>
                <p><strong>Job Type:</strong> <%= job.getJobType() %></p>
                <p><strong>Status:</strong> <%= job.getStatus() %></p>
                <p><strong>Company Website:</strong> <a href="<%= job.getWebsite() %>" target="_blank"><%= job.getWebsite() %></a></p>
            </div>
        </aside>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>