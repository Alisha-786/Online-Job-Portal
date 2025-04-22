<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*"%>
 <%@ page import="com.dao.JobDAO, com.DB.DBConnect, com.entity.Job, java.util.List" %>
<%
    Job job = (Job) request.getAttribute("job"); // Assuming job object is set in the request
    if (job == null) {
        response.sendRedirect("AdminEditJob.jsp"); // Redirect if job is not found
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Job - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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

.form-container {
	max-width: 800px;
	margin: auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	font-weight: bold;
	display: block;
}

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.row {
	display: flex;
	justify-content: space-between;
	gap: 15px;
}

.col-md-6 {
	flex: 1;
}

.button-container {
	display: flex;
	justify-content: flex-end; /* Align buttons to the right */
	margin-top: 20px;
}

.publish-btn {
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s ease-in-out;
}

.publish-btn:hover {
	opacity: 0.9;
}

.error {
	color: red;
	font-size: 14px;
	margin-top: 5px;
}

.required {
	color: red;
	font-weight: bold;
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
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
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
        
    </style>
</head>
<body>
    <%@ include file="SidePanel.jsp"%>
    <div class="top-bar">
        <div class="profile">
            <img src="img/female.webp" alt="Profile Icon">
            <%
                String userName = (String) session.getAttribute("userName");
                if (userName == null) userName = "Guest";
            %>
            <span><%= userName %></span>
        </div>
    </div>

    <div class="content">
        <div class="form-container">
            <h2 class="page-header text-center">Edit Job Opportunity</h2>

            <form action="UpdateJobServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="jobId" value="<%= job.getId() %>" />

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Job Title *</label>
                        <input type="text" class="form-control" name="jobTitle" value="<%= job.getTitle() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Job Type *</label>
                        <select class="form-select" name="jobType" required>
                            <option value="Full-Time" <%= job.getJobType().equals("Full-Time") ? "selected" : "" %>>Full-Time</option>
                            <option value="Part-Time" <%= job.getJobType().equals("Part-Time") ? "selected" : "" %>>Part-Time</option>
                            <option value="Contract" <%= job.getJobType().equals("Contract") ? "selected" : "" %>>Contract</option>
                            <option value="Internship" <%= job.getJobType().equals("Internship") ? "selected" : "" %>>Internship</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Location *</label>
                        <input type="text" class="form-control" name="location" value="<%= job.getLocation() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Company Name *</label>
                        <input type="text" class="form-control" name="companyName" value="<%= job.getCompanyName() %>" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Salary *</label>
                        <input type="text" class="form-control" name="salary" value="<%= job.getSalary() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Experience Required *</label>
                        <input type="text" class="form-control" name="experience" value="<%= job.getExperience() %>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Industry *</label>
                    <input type="text" class="form-control" name="industry" value="<%= job.getIndustry() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Company Website</label>
                    <input type="url" class="form-control" name="website" value="<%= job.getWebsite() %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Job Description *</label>
                    <textarea class="form-control" name="description" rows="6" required><%= job.getDescription() %></textarea>
                </div>

                <div class="mb-3 recruiter-info">
                    <h5><i class="bi bi-person-badge me-2"></i>Recruiter Information</h5>
                    <label class="form-label">Your Name *</label>
                    <input type="text" class="form-control" name="postedBy" value="<%= job.getPostedBy() %>" required>
                </div>

                <div class="mb-4">
                    <label class="form-label">Company Logo</label>
                    <input type="file" class="form-control" name="logo" accept="image/*">
                    <% if (job.getLogo() != null) { %>
                        <img src="<%= job.getLogo() %>" class="preview-logo mt-2" alt="Current Logo">
                    <% } %>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="AdminManageJobs.jsp" class="btn btn-outline-secondary me-md-2">Cancel</a>
                    <button type="submit" class="btn btn-submit text-white">
                        <i class="bi bi-save me-1"></i> Update Job
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
