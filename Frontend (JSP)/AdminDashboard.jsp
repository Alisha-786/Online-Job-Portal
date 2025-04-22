<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="slidestyle.css">
<link
	href="https://fonts.googleapis.com/css?family=Jost:wght@500&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Include html2canvas -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<!-- Include jsPDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	background: white;
}

.dashboard {
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

.flashcards-container {
	display: flex;
	justify-content: space-around;
	margin-top: 60px;
}

.card {
	width: 220px;
	height: 140px;
	background: white;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	padding: 15px;
	text-align: center;
}

.chart-container {
	position: relative;
	width: 80px;
	height: 80px;
	margin: auto;
}

.chart-value {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 16px;
	font-weight: 600;
}

.charts-section {
	display: flex;
	justify-content: space-around;
	margin-top: 40px;
}

.chart-box {
	width: 45%;
}
.download-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #8A2BE2;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 14px;
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
	<div class="search-bar">
    <form action="browsejobs.jsp" method="get" onsubmit="return handleSearch()">
        <input type="text" name="query" placeholder="Search for jobs..." required>
        <button type="submit"><i class="fas fa-search"></i></button>
    </form>
</div>

		<!-- Notification Icon -->
	<div class="notification">
		<i class="fas fa-bell"></i>
	</div>
		
		<div class="profile">
			<img src="img/female.webp" alt="Profile Icon"> 
			<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) userName = "Guest"; // Fallback
%>
<span><%= userName %></span>
			
		</div>
	</div>
	<div class="dashboard">
		<!-- Flashcards -->
		<div class="flashcards-container">
			<div class="card">
				<h3>Total Jobs</h3>
				<div class="chart-container">
					<canvas id="jobsChart"></canvas>
					<div class="chart-value">1,205</div>
				</div>
			</div>
			<div class="card">
				<h3>Applicants</h3>
				<div class="chart-container">
					<canvas id="applicantsChart"></canvas>
					<div class="chart-value">980</div>
				</div>
			</div>
			<div class="card">
				<h3>Interviews</h3>
				<div class="chart-container">
					<canvas id="interviewsChart"></canvas>
					<div class="chart-value">5,432</div>
				</div>
			</div>
		</div>

		<!-- Charts Section -->
		<div class="charts-section">
			<div class="chart-box">
				<canvas id="barChart"></canvas>
			</div>
			<div class="chart-box">
				<canvas id="userChart"></canvas>
			</div>

		</div>
	</div>
 <button class="download-btn" onclick="generatePDF()">Download Report</button>
	<script>
	async function generatePDF() {
        const { jsPDF } = window.jspdf;

        // Get current date & time
        const now = new Date();
        const dateStr = now.toLocaleDateString();
        const timeStr = now.toLocaleTimeString();

        // Capture the full dashboard
        const dashboardElement = document.querySelector('.dashboard');
        const canvas = await html2canvas(dashboardElement, { scale: 2 });
        const imgData = canvas.toDataURL('image/png');

        // Create PDF
        const pdf = new jsPDF('p', 'mm', 'a4');
        const pageWidth = pdf.internal.pageSize.getWidth();
        const pageHeight = pdf.internal.pageSize.getHeight();

        // Add header title
        pdf.setFontSize(18);
        pdf.setTextColor('#4A1F72');
        pdf.text('NextHire Report', pageWidth / 2, 20, { align: 'center' });

        // Add timestamp
        pdf.setFontSize(10);
        pdf.setTextColor('#555');
        pdf.text(`Generated on: ${dateStr} at ${timeStr}`, pageWidth - 10, 28, { align: 'right' });

        // Add image of the dashboard (fit to A4 size with margin)
        const imgProps = pdf.getImageProperties(imgData);
        const ratio = imgProps.width / imgProps.height;
        const imgWidth = pageWidth - 20;
        const imgHeight = imgWidth / ratio;

        pdf.addImage(imgData, 'PNG', 10, 35, imgWidth, imgHeight);

        // Save PDF
        pdf.save("NextHire_Report.pdf");
    }

		function createChart(canvasId, value, color) {
			const ctx = document.getElementById(canvasId).getContext('2d');
			new Chart(ctx, {
				type : 'doughnut',
				data : {
					datasets : [ {
						data : [ value, 100 - value ],
						backgroundColor : [ color, '#EAEAEA' ],
						borderWidth : 0,
					} ]
				},
				options : {
					cutout : '75%',
					responsive : true,
					maintainAspectRatio : false,
					plugins : {
						legend : {
							display : false
						}
					}
				}
			});
		}
		createChart('jobsChart', 70, '#7D3C98');
		createChart('applicantsChart', 50, '#A569BD');
		createChart('interviewsChart', 80, '#D2B4DE');

		$(document).ready(
				function() {
					const userCtx = document.getElementById('userChart')
							.getContext('2d');
					new Chart(userCtx, {
						type : 'doughnut',
						data : {
							labels : [ 'Active Users', 'Job Seekers',
									'Employers' ],
							datasets : [ {
								label : 'User Distribution',
								data : [ 10, 20, 30 ],
								backgroundColor : [ '#AA49C1', '#6A2D8C',
										'#4A1F72' ]
							} ]
						},
						options : {
							responsive : true,
							maintainAspectRatio : false
						}
					});

					const barCtx = document.getElementById('barChart')
							.getContext('2d');
					new Chart(barCtx, {
						type : 'bar',
						data : {
							labels : [ 'Sunday', 'Monday', 'Tuesday',
									'Wednesday', 'Thursday', 'Friday',
									'Saturday' ],
							datasets : [ {
								label : 'Users Signed Up',
								backgroundColor : '#D2B4DE',
								data : [ 50, 80, 60, 90, 70, 100, 85 ]
							}, {
								label : 'Interviews Scheduled',
								backgroundColor : '#A569BD',
								data : [ 30, 60, 45, 70, 55, 80, 65 ]
							}, {
								label : 'Users Rejected',
								backgroundColor : '#7D3C98',
								data : [ 20, 40, 35, 50, 45, 60, 50 ]
							} ]
						},
						options : {
							responsive : true,
							maintainAspectRatio : false,
							scales : {
								y : {
									beginAtZero : true
								}
							}
						}
					});
				});
		
	</script>
</body>
</html>
