<%-- CandidateProfile.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.dao.CandidateProfileDao, com.DB.DBConnect, com.entity.CandidateProfile, com.entity.user" %>
<%
    user user = (user) session.getAttribute("userObj");
    CandidateProfile profile = null;
    if (user != null) {
        CandidateProfileDao dao = new CandidateProfileDao(DBConnect.getConn());
        profile = dao.getProfileByUserId(user.getId());
    }

    String succMsg = (String) session.getAttribute("succMsg");
    String errorMsg = (String) session.getAttribute("errorMsg");
    if (succMsg != null) {
%>
<div class="alert alert-success" role="alert"><%= succMsg %></div>
<%
        session.removeAttribute("succMsg");
    }
    if (errorMsg != null) {
%>
<div class="alert alert-danger" role="alert"><%= errorMsg %></div>
<%
        session.removeAttribute("errorMsg");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: white;
            margin: 0;
            padding: 0;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            position: fixed;
            top: 100px;
            right: 20px;
            z-index: 1000;
            max-width: 300px;
        }

        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }

        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
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
            background: #fff;
            padding: 30px;
            margin: 50px auto; /* Centered */
            margin-top: 80px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
        }

        h1.gradient-heading {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .form-group textarea {
            resize: vertical;
            height: 80px;
        }

        .submit-btn {
            background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%,
            rgba(170, 73, 193, 1) 83%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #574fcb;
        }
        .toggle-buttons {
            display: flex;
            gap: 10px;
            margin-left: auto;
        }

        .toggle-buttons button {
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: 500;
            border: 1px solid #888;
            background-color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%@ include file="CandidateSidePanel.jsp"%>

<div class="top-bar">
    <div class="profile">
        <img src="img/female.webp" alt="Profile Icon">
        <%
            String userName = (String) session.getAttribute("userName");
            if (userName == null) userName = "Guest"; // Fallback
        %>
        <span><%= userName %></span>

    </div>
    <div class="toggle-buttons">
        <form method="get" action="CandidateProfile.jsp">
            <button type="submit">Private View</button>
        </form>
        <form method="get" action="PublicViewProfile.jsp">
            <button type="submit">Public View</button>
        </form>
    </div>
</div>

<div class="content">
    <div class="form-container">
    <h1 class="gradient-heading">Create Your Profile</h1>

    <form onsubmit="redirectToSavePage(); return false;" enctype="multipart/form-data">

        <div class="form-group">
            <label for="fullName">Full Name *</label>
            <input type="text" name="fullName" id="fullName" value="<%= profile != null ? profile.getFullName() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" name="email" id="email" value="<%= profile != null ? profile.getEmail() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone *</label>
            <input type="text" name="phone" id="phone" value="<%= profile != null ? profile.getPhone() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="skills">Skills *</label>
            <textarea name="skills" id="skills" required><%= profile != null ? profile.getSkills() : "" %></textarea>
        </div>

        <div class="form-group">
            <label for="experience">Experience</label>
            <textarea name="experience" id="experience"><%= profile != null ? profile.getExperience() : "" %></textarea>
        </div>

        <div class="form-group">
            <label for="education">Education</label>
            <textarea name="education" id="education"><%= profile != null ? profile.getEducation() : "" %></textarea>
        </div>

        <div class="form-group">
            <label for="certifications">Certifications</label>
            <textarea name="certifications" id="certifications"><%= profile != null ? profile.getCertifications() : "" %></textarea>
        </div>

        <div class="form-group">
            <label for="resume">Upload Resume (PDF, DOCX)</label>
            <input type="file" name="resume" id="resume" accept=".pdf,.doc,.docx">
        </div>

        <button type="submit" class="submit-btn">Save</button>
    </form>
</div>

</div>
<script>
    function redirectToSavePage() {
        window.location.href = "SaveProfile.jsp";
    }
</script>

</body>
</html>