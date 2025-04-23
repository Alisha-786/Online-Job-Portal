<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect, com.dao.JobDAO, com.entity.jobs, com.entity.user" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Job - Next Hire</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Keep all the same styles from JobDetails.jsp */
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
        /* Include all other styles from JobDetails.jsp */
        
        .application-form {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
            margin: 40px auto;
            max-width: 800px;
        }
        
        .form-title {
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
        }
        
        .job-id-badge {
            background: rgba(43,18,76,0.1);
            color: rgb(43,18,76);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            margin-left: 10px;
        }
        
        .form-control, .form-select {
            margin-bottom: 20px;
        }
        
        .submit-btn {
            background: rgb(43,18,76);
            background: linear-gradient(131deg, rgba(43,18,76,1)0%, rgba(170,73,193,1)83%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        
        .submit-btn:hover {
            background: rgb(168, 24, 168);
            color: white;
        }
        
        .read-only-field {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <%
    int jobId = Integer.parseInt(request.getParameter("id"));
    JobDAO dao = new JobDAO(DBConnect.getConn());
    jobs job = dao.getJobById(jobId);
    
    // Get user from session
    user user = (user) session.getAttribute("userObj");
    if (user == null) {
        response.sendRedirect("ApplyJobs.jsp");
        return;
    }
    int candidateId = user.getId();
    %>

    <!-- Same Header as JobDetails.jsp -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm p-2" id="headering">
        <div class="container-fluid">
            <div class="d-flex align-items-center" id="next-logo">
                <a class="navbar-brand fw-bold fs-3" href="#">Next Hire</a> 
                <i class="bi bi-graph-up fs-3 text-primary ms-2"></i>
            </div>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

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

                <a href="CandidateProfile.jsp" class="nav-link d-flex align-items-center">
                    <img src="https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg" class="rounded-circle me-2" alt="Profile" width="30" height="30" />
                </a>
            </div>
        </div>
    </nav>
    
    <div class="container">
        <div class="application-form">
            <h2 class="form-title">
                Application for <%= job.getTitle() %> at <%= job.getCompanyName() %>
                <span class="job-id-badge">Job ID: <%= jobId %></span>
            </h2>
            
            <form action="ProfilePreview.jsp" method="post">
        Full Name: <input type="text" name="fullName"><br><br>
        Email: <input type="email" name="email"><br><br>
        Phone: <input type="text" name="phone"><br><br>
        Skills: <textarea name="skills"></textarea><br><br>
        Experience: <input type="text" name="experience"><br><br>
        Education: <textarea name="education"></textarea><br><br>
        Certifications: <textarea name="certifications"></textarea><br><br>
        <input type="submit" value="Preview">
                <div class="mb-3">
                    <label for="job_id" class="form-label">Job ID</label>
                    <input type="text" class="form-control read-only-field" id="job_id" name="job_id" 
                           value="<%= jobId %>" readonly>
                </div>
                
                <div class="mb-3">
                    <label for="candidate_id" class="form-label">Your Candidate ID</label>
                    <input type="text" class="form-control read-only-field" id="candidate_id" name="candidate_id" 
                           value="<%= candidateId %>" readonly>
                </div>
                
                <div class="mb-3">
                    <label for="resume" class="form-label">Upload Resume (PDF only)</label>
                    <input type="file" class="form-control" id="resume" name="resume" accept=".pdf" required>
                </div>
                
                <div class="mb-3">
                    <label for="cover_letter" class="form-label">Cover Letter</label>
                    <textarea class="form-control" id="cover_letter" name="cover_letter" rows="6" required></textarea>
                </div>
                
                <button type="submit" class="submit-btn">Submit Application</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>