<%-- SaveProfile.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Overview</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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

        .overview-group {
            margin-bottom: 20px;
        }

        .overview-label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        .overview-value {
            display: block;
            padding: 10px;
            background: #f2f2f2;
            border-radius: 6px;
            border: 1px solid #ccc;
            white-space: pre-wrap; /* Preserve line breaks */
        }

        .edit-btn {
            background: linear-gradient(131deg, rgba(43, 18, 76, 1) 0%, rgba(170, 73, 193, 1) 83%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 30px;
        }

        .edit-btn:hover {
            background-color: #574fcb;
        }
    </style>
</head>
<body>

<%@ include file="CandidateSidePanel.jsp" %>

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
        <h1 class="gradient-heading">Profile Overview</h1>

        <div class="overview-group">
            <label class="overview-label">Full Name:</label>
            <span class="overview-value">Alisha Parveen</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Email:</label>
            <span class="overview-value">alisha@example.com</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Phone:</label>
            <span class="overview-value">+919876543211</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Skills:</label>
            <span class="overview-value">Python, Django, Machine Learning, Data Analysis</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Experience:</label>
            <span class="overview-value">2 years as Data Scientist at Analytics Pro</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Education:</label>
            <span class="overview-value">M.Sc in Data Science from University of Mumbai</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Certifications:</label>
            <span class="overview-value">Google Data Analytics Professional Certificate</span>
        </div>

        <div class="overview-group">
            <label class="overview-label">Resume Path:</label>
            <span class="overview-value">/NextHire(2).pdf</span>
        </div>

        <form action="CandidateProfile.jsp" method="get">
            <button type="submit" class="edit-btn">Edit Profile</button>
        </form>
    </div>
</div>

</body>
</html>