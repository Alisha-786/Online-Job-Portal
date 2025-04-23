<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Post a Job</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: #f8f9fa;
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

.form-container {
	max-width: 800px;
	margin: 80px auto 20px;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.page-header {
	color: #2b124c;
	margin-bottom: 2rem;
	padding-bottom: 1rem;
	border-bottom: 2px solid #aa49c1;
}

.btn-submit {
	background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
		rgba(170, 73, 193, 1) 83%);
	border: none;
	padding: 10px 25px;
	font-weight: 500;
}

.btn-submit:hover {
	opacity: 0.9;
	transform: translateY(-2px);
}

.preview-logo {
	max-width: 150px;
	max-height: 150px;
	margin-top: 10px;
	display: none;
	border-radius: 5px;
	border: 1px solid #dee2e6;
}

.recruiter-info {
	background-color: #f8f9fa;
	padding: 1rem;
	border-radius: 5px;
	margin-bottom: 1.5rem;
}

#successMessage {
	position: fixed;
	top: 80px;
	right: 20px;
	z-index: 1100;
	display: none;
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
    if (userName == null) userName = "Guest"; // Fallback
%>
<span><%= userName %></span>
			
		</div>
	</div>

	<!-- Success message container (initially hidden) -->
	<div id="successMessage"
		class="alert alert-success alert-dismissible fade show" role="alert">
		Job posted successfully!
		<button type="button" class="btn-close" onclick="hideSuccessMessage()"></button>
	</div>

	<div class="content">
		<div class="form-container">
			<h2 class="page-header text-center">Post a New Job Opportunity</h2>

			<form id="jobForm" novalidate>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="jobTitle" class="form-label">Job Title *</label> <input
							type="text" class="form-control" id="jobTitle" name="jobTitle"
							required>
						<div class="invalid-feedback">Please provide a job title.</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="jobType" class="form-label">Job Type *</label> <select
							class="form-select" id="jobType" name="jobType" required>
							<option value="" selected disabled>Select job type</option>
							<option value="Full-Time">Full-Time</option>
							<option value="Part-Time">Part-Time</option>
							<option value="Contract">Contract</option>
							<option value="Internship">Internship</option>
						</select>
						<div class="invalid-feedback">Please select a job type.</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="location" class="form-label">Location *</label> <input
							type="text" class="form-control" id="location" name="location"
							required>
						<div class="invalid-feedback">Please provide a location.</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="companyName" class="form-label">Company Name *</label>
						<input type="text" class="form-control" id="companyName"
							name="companyName" required>
						<div class="invalid-feedback">Please provide your company
							name.</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="salary" class="form-label">Salary *</label> <input
							type="text" class="form-control" id="salary" name="salary"
							required>
						<div class="invalid-feedback">Please provide salary
							information.</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="experience" class="form-label">Experience
							Required *</label> <input type="text" class="form-control"
							id="experience" name="experience" required>
						<div class="invalid-feedback">Please specify required
							experience.</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="industry" class="form-label">Industry *</label> <input
						type="text" class="form-control" id="industry" name="industry"
						required>
					<div class="invalid-feedback">Please specify the industry.</div>
				</div>

				<div class="mb-3">
					<label for="website" class="form-label">Company Website</label> <input
						type="url" class="form-control" id="website" name="website"
						placeholder="https://example.com">
					<div class="invalid-feedback">Please provide a valid URL.</div>
				</div>

				<div class="mb-3">
					<label for="description" class="form-label">Job Description
						*</label>
					<textarea class="form-control" id="description" name="description"
						rows="6" required></textarea>
					<div class="invalid-feedback">Please provide a job
						description.</div>
					<div class="form-text">Describe the responsibilities,
						requirements, and benefits of the position.</div>
				</div>

				<div class="mb-3 recruiter-info">
					<h5>
						<i class="bi bi-person-badge me-2"></i>Recruiter Information
					</h5>
					<div class="mb-3">
						<label for="postedBy" class="form-label">Your Name *</label> <input
							type="text" class="form-control" id="postedBy" name="postedBy"
							value="<%=session.getAttribute("user") != null ? session.getAttribute("user") : "Admin User"%>"
							required>
						<div class="invalid-feedback">Please provide your name as
							the recruiter.</div>
						<div class="form-text">This will be displayed as the contact
							person for this job posting.</div>
					</div>
				</div>

				<div class="mb-4">
					<label for="logo" class="form-label">Company Logo *</label> <input
						type="file" class="form-control" id="logo" name="logo"
						accept="image/*" required>
					<div class="invalid-feedback">Please upload a company logo.</div>
					<img id="logoPreview" class="preview-logo" alt="Logo preview">
				</div>

				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button type="reset" class="btn btn-outline-secondary me-md-2">Reset
						Form</button>
					<button type="submit" class="btn btn-submit text-white">
						<i class="bi bi-send-fill me-1"></i> Post Job
					</button>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Form validation and AJAX submission
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('jobForm');
            const successMessage = document.getElementById('successMessage');
            
            // Logo preview
            const logoInput = document.getElementById('logo');
            const logoPreview = document.getElementById('logoPreview');
            
            logoInput.addEventListener('change', function() {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        logoPreview.style.display = 'block';
                        logoPreview.src = e.target.result;
                    }
                    reader.readAsDataURL(file);
                }
            });
            
            // Auto-format URL field
            const websiteInput = document.getElementById('website');
            websiteInput.addEventListener('blur', function() {
                if (this.value && !this.value.startsWith('http://') && !this.value.startsWith('https://')) {
                    this.value = 'https://' + this.value;
                }
            });
            
            // Form submission handler
            form.addEventListener('submit', function(event) {
                event.preventDefault();
                
                if (!form.checkValidity()) {
                    event.stopPropagation();
                    form.classList.add('was-validated');
                    return;
                }
                
                // Create FormData object
                const formData = new FormData(form);
                
                // AJAX request to PostJobServlet
                fetch('PostJobServlet', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    }
                    
                })
                .then(data => {
                    // Show success message
                    showSuccessMessage();
                    // Reset form
                    form.reset();
                    form.classList.remove('was-validated');
                    // Hide logo preview
                    logoPreview.style.display = 'none';
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Error posting job: ' + error.message);
                });
            });
        });
        
        function showSuccessMessage() {
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'block';
            
            // Hide message after 5 seconds
            setTimeout(hideSuccessMessage, 5000);
        }
        
        function hideSuccessMessage() {
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'none';
        }
    </script>
</body>
</html>