<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect, com.dao.JobDAO, com.entity.jobs, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Advanced Job Search</title>
    <!-- Include your existing CSS and JS links -->
    <style>
        .filter-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .filter-section {
            margin-bottom: 15px;
        }
        .filter-label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Include your existing navbar -->

    <div class="container mt-5">
        <div class="row">
            <!-- Filters Column -->
            <div class="col-md-3">
                <div class="filter-card">
                    <h4 class="mb-4">Filters</h4>
                    <form method="get" action="JobSearch.jsp">
                        <div class="filter-section">
                            <label class="filter-label">Job Title</label>
                            <input type="text" name="title" class="form-control" 
                                   value="<%= request.getParameter("title") != null ? request.getParameter("title") : "" %>">
                        </div>
                        
                        <div class="filter-section">
                            <label class="filter-label">Company</label>
                            <input type="text" name="company" class="form-control" 
                                   value="<%= request.getParameter("company") != null ? request.getParameter("company") : "" %>">
                        </div>
                        
                        <div class="filter-section">
                            <label class="filter-label">Location</label>
                            <select name="location" class="form-select">
                                <option value="">All Locations</option>
                                <%
                                JobDAO dao = new JobDAO(DBConnect.getConn());
                                List<String> locations = dao.getAllLocations();
                                for(String loc : locations) {
                                    String selected = request.getParameter("location") != null && 
                                                    request.getParameter("location").equals(loc) ? "selected" : "";
                                %>
                                <option value="<%= loc %>" <%= selected %>><%= loc %></option>
                                <% } %>
                            </select>
                        </div>
                        
                        <div class="filter-section">
                            <label class="filter-label">Experience</label>
                            <select name="experience" class="form-select">
                                <option value="">Any Experience</option>
                                <option value="Fresher" <%= "Fresher".equals(request.getParameter("experience")) ? "selected" : "" %>>Fresher</option>
                                <option value="1-3 years" <%= "1-3 years".equals(request.getParameter("experience")) ? "selected" : "" %>>1-3 years</option>
                                <option value="3-5 years" <%= "3-5 years".equals(request.getParameter("experience")) ? "selected" : "" %>>3-5 years</option>
                                <option value="5+ years" <%= "5+ years".equals(request.getParameter("experience")) ? "selected" : "" %>>5+ years</option>
                            </select>
                        </div>
                        
                        <div class="filter-section">
                            <label class="filter-label">Job Type</label>
                            <select name="job_type" class="form-select">
                                <option value="">Any Type</option>
                                <option value="Full-Time" <%= "Full-Time".equals(request.getParameter("job_type")) ? "selected" : "" %>>Full-Time</option>
                                <option value="Part-Time" <%= "Part-Time".equals(request.getParameter("job_type")) ? "selected" : "" %>>Part-Time</option>
                                <option value="Contract" <%= "Contract".equals(request.getParameter("job_type")) ? "selected" : "" %>>Contract</option>
                                <option value="Internship" <%= "Internship".equals(request.getParameter("job_type")) ? "selected" : "" %>>Internship</option>
                            </select>
                        </div>
                        
                        <div class="filter-section">
                            <label class="filter-label">Salary Range</label>
                            <select name="salary" class="form-select">
                                <option value="">Any Salary</option>
                                <option value="0-30000" <%= "0-30000".equals(request.getParameter("salary")) ? "selected" : "" %>>$0 - $30,000</option>
                                <option value="30000-60000" <%= "30000-60000".equals(request.getParameter("salary")) ? "selected" : "" %>>$30,000 - $60,000</option>
                                <option value="60000-90000" <%= "60000-90000".equals(request.getParameter("salary")) ? "selected" : "" %>>$60,000 - $90,000</option>
                                <option value="90000+" <%= "90000+".equals(request.getParameter("salary")) ? "selected" : "" %>>$90,000+</option>
                            </select>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100">Apply Filters</button>
                    </form>
                </div>
            </div>
            
            <!-- Results Column -->
            <div class="col-md-9">
                <%
                String title = request.getParameter("title");
                String company = request.getParameter("company");
                String location = request.getParameter("location");
                String experience = request.getParameter("experience");
                String job_type = request.getParameter("job_type");
                String salary = request.getParameter("salary");
                
                List<jobs> jobs = dao.searchJobs(title, location, experience, company);
                %>
                
                <h4 class="mb-4">Search Results (<%= jobs.size() %>)</h4>
                
                <% if(jobs.isEmpty()) { %>
                    <div class="alert alert-info">No jobs found matching your criteria.</div>
                <% } else { 
                    for(jobs j : jobs) { %>
                    <div class="job-card mb-3" id="boxes">
                        <h5><%= j.getTitle() %></h5>
                        <p class="text-muted"><%= j.getCompanyName() %> • <%= j.getLocation() %></p>
                        <p><%= j.getDescription() %></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="badge bg-primary"><%= j.getJobType() %></span>
                            <a href="JobDetails.jsp?id=<%= j.getId() %>" class="btn btn-sm see-details">See Details</a>
                        </div>
                    </div>
                <% } } %>
            </div>
        </div>
    </div>
</body>
</html>