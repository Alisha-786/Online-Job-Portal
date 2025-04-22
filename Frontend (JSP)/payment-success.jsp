<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Check if payment was successful
if (session.getAttribute("paymentSuccess") == null) {
    response.sendRedirect("Subscription.jsp");
    return;
}

String plan = (String) session.getAttribute("paymentPlan");
String planName = "";

switch(plan) {
    case "basic": planName = "Basic Plan"; break;
    case "professional": planName = "Professional Plan"; break;
    case "enterprise": planName = "Enterprise Plan"; break;
}

// Clear payment attributes
session.removeAttribute("paymentSuccess");
session.removeAttribute("paymentPlan");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful | Next Hire</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            text-align: center;
        }
        .success-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .checkmark {
            color: #28a745;
            font-size: 80px;
            margin-bottom: 20px;
        }
        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }
        .btn-home {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
            transition: opacity 0.3s;
        }
        .btn-home:hover {
            opacity: 0.9;
            color: white;
        }
    </style>
    <script>
        // Redirect to home after 5 seconds
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 5000);
    </script>
</head>
<body>
    <div class="success-container">
        <div class="checkmark">
            <i class="bi bi-check-circle-fill"></i>
        </div>
        <h1>Payment Successful!</h1>
        <p>Thank you for subscribing to our <strong><%= planName %></strong>.</p>
        <p>Your account has been upgraded and you can now enjoy all premium features.</p>
        <p>A confirmation email has been sent to your registered email address.</p>
        
        <a href="index.jsp" class="btn-home">
            Return to Homepage
        </a>
        
        <p class="mt-3 text-muted">You will be automatically redirected in 5 seconds...</p>
    </div>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</body>
</html>