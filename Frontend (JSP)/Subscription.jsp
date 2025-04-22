<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Subscriptions | Next Hire</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        .pricing-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .pricing-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(43, 18, 76, 0.15);
            transition: all 0.3s ease;
            overflow: hidden;
            width: 350px;
            flex: 1 1 300px;
        }
        
        .pricing-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(43, 18, 76, 0.25);
        }
        
        .pricing-header {
            padding: 30px;
            text-align: center;
            background: linear-gradient(131deg, rgba(43,18,76,0.1) 0%, rgba(170,73,193,0.1) 83%);
        }
        
        .pricing-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .pricing-price {
            font-size: 48px;
            font-weight: 700;
            margin: 20px 0;
        }
        
        .pricing-features {
            padding: 30px;
        }
        
        .pricing-features ul {
            list-style: none;
            padding: 0;
        }
        
        .pricing-features li {
            padding: 8px 0;
            position: relative;
            padding-left: 30px;
        }
        
        .pricing-features li:before {
            content: "✓";
            color: #2b124c;
            position: absolute;
            left: 0;
            font-weight: bold;
        }
        
        .pricing-button {
            display: block;
            text-align: center;
            padding: 15px;
            margin: 0 30px 30px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .popular-tag {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #ffd700;
            color: #2b124c;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 12px;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
            padding-top: 30px;
            font-size: 2.5rem;
            background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .footer-note {
            text-align: center;
            margin-top: 50px;
            padding: 20px;
        }
        
        .popular-card {
            border: 2px solid #aa49c1;
            position: relative;
        }
    </style>
</head>
<body>
    <!-- Your header content here -->
    
    <h1 class="section-title">Premium Job Listing Plans</h1>
    
    <div class="pricing-container">
        <!-- Basic Plan -->
        <div class="pricing-card">
            <div class="pricing-header">
                <h3 class="pricing-title">Basic</h3>
                <div class="pricing-price">$9.99<span style="font-size: 16px;">/month</span></div>
                <p>Perfect for small businesses</p>
            </div>
            <div class="pricing-features">
                <ul>
                    <li>5 Premium Job Listings</li>
                    <li>Basic Job Analytics</li>
                    <li>Company Profile Page</li>
                    <li>Email Support</li>
                    <li>Standard Visibility</li>
                </ul>
            </div>
            <a href="payment.jsp?plan=basic" class="pricing-button" 
               style="background: rgba(43,18,76,0.1); color: #2b124c; border: 2px solid #2b124c;">
                Choose Basic
            </a>
        </div>
        
        <!-- Professional Plan (Popular) -->
        <div class="pricing-card popular-card">
            <div class="popular-tag">MOST POPULAR</div>
            <div class="pricing-header">
                <h3 class="pricing-title">Professional</h3>
                <div class="pricing-price">$29.99<span style="font-size: 16px;">/month</span></div>
                <p>Best for growing businesses</p>
            </div>
            <div class="pricing-features">
                <ul>
                    <li>20 Premium Job Listings</li>
                    <li>Advanced Job Analytics</li>
                    <li>Featured Company Profile</li>
                    <li>Priority Email Support</li>
                    <li>Enhanced Visibility (2x)</li>
                    <li>Candidate Matching</li>
                    <li>Branded Job Posts</li>
                </ul>
            </div>
            <a href="payment.jsp?plan=professional" class="pricing-button" 
               style="background: linear-gradient(131deg, rgba(43,18,76,1) 0%, rgba(170,73,193,1) 83%); color: white;">
                Choose Professional
            </a>
        </div>
        
        <!-- Enterprise Plan -->
        <div class="pricing-card">
            <div class="pricing-header">
                <h3 class="pricing-title">Enterprise</h3>
                <div class="pricing-price">$99.99<span style="font-size: 16px;">/month</span></div>
                <p>For large organizations</p>
            </div>
            <div class="pricing-features">
                <ul>
                    <li>Unlimited Premium Listings</li>
                    <li>Full Analytics Dashboard</li>
                    <li>Dedicated Account Manager</li>
                    <li>24/7 Phone Support</li>
                    <li>Maximum Visibility (5x)</li>
                    <li>Advanced Candidate Matching</li>
                    <li>Custom Branded Career Page</li>
                    <li>ATS Integration</li>
                    <li>Bulk Hiring Tools</li>
                </ul>
            </div>
            <a href="payment.jsp?plan=enterprise" class="pricing-button" 
               style="background: #2b124c; color: white;">
                Choose Enterprise
            </a>
        </div>
    </div>
    
    <div class="footer-note">
        <p style="color: #6c757d;">All plans include a 14-day money-back guarantee</p>
        <p>Need help choosing? <a href="#" style="color: #aa49c1; text-decoration: none;">Contact our sales team</a></p>
    </div>

    <!-- Your footer content here -->
</body>
</html>