<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Check if form was submitted
if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Simulate processing delay
    Thread.sleep(2000);
    
    // Set success message in session
    session.setAttribute("paymentSuccess", "true");
    session.setAttribute("paymentPlan", request.getParameter("plan"));
    
    // Redirect to success page
    response.sendRedirect("payment-success.jsp");
    return;
}

// Get plan parameter
String plan = request.getParameter("plan");
String planName = "";
double amount = 0;

switch(plan) {
    case "basic":
        planName = "Basic Plan";
        amount = 9.99;
        break;
    case "professional":
        planName = "Professional Plan";
        amount = 29.99;
        break;
    case "enterprise":
        planName = "Enterprise Plan";
        amount = 99.99;
        break;
    default:
        response.sendRedirect("Subscription.jsp");
        return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment | Next Hire</title>
    <!-- Include your existing CSS links -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .payment-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .payment-plan {
            background: rgba(43,18,76,0.1);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-pay {
            width: 100%;
            padding: 12px;
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: opacity 0.3s;
        }
        .btn-pay:hover {
            opacity: 0.9;
        }
        .card-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        .card-icons img {
            height: 30px;
        }
    </style>
</head>
<body>
    <!-- Your Existing Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm p-2" id="headering">
        <!-- Copy your existing navbar code here -->
    </nav>

    <div class="payment-container">
        <div class="payment-header">
            <h2>Complete Your Payment</h2>
            <p>Secure payment processed through our payment gateway</p>
        </div>
        
        <div class="payment-plan">
            <h4><%= planName %></h4>
            <p class="mb-0">$<%= String.format("%.2f", amount) %> per month</p>
        </div>
        
        <form id="payment-form" method="POST">
            <input type="hidden" name="plan" value="<%= plan %>">
            
            <div class="form-group">
                <label class="form-label">Cardholder Name</label>
                <input type="text" class="form-control" name="cardholder" placeholder="John Smith" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">Card Number</label>
                <input type="text" class="form-control" name="cardnumber" placeholder="4242 4242 4242 4242" required>
            </div>
            
            <div style="display: flex; gap: 15px;">
                <div class="form-group" style="flex: 1;">
                    <label class="form-label">Expiry Date</label>
                    <input type="text" class="form-control" name="expiry" placeholder="MM/YY" required>
                </div>
                
                <div class="form-group" style="flex: 1;">
                    <label class="form-label">CVV</label>
                    <input type="text" class="form-control" name="cvv" placeholder="123" required>
                </div>
            </div>
            
            <button type="submit" class="btn-pay">
                Pay $<%= String.format("%.2f", amount) %>
            </button>
            
            <div class="card-icons">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/visa/visa-original.svg" alt="Visa">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mastercard/mastercard-original.svg" alt="Mastercard">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg" alt="Apple Pay">
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>