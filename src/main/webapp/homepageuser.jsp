<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(to right, #ece9e6, #ffffff);
}

.logout-btn {
	background: linear-gradient(90deg, #ff6f61, #ff9472);
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 50px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.logout-btn:hover {
	background: linear-gradient(90deg, #ff9472, #ff6f61);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}

.sidebar {
	background-color: #343a40;
	color: #fff;
	height: 100vh;
	position: fixed;
	width: 16%;
	padding: 20px 15px;
}

.sidebar h3 {
	text-align: center;
	margin-bottom: 20px;
}

.sidebar a {
	color: #adb5bd;
	text-decoration: none;
	padding: 10px;
	display: block;
	margin: 5px 0;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.sidebar a:hover {
	background-color: #007bff;
	color: #fff;
}

.content {
	margin-left: 20%;
	padding: 20px;
}


</style>
</head>

<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h3>Menu</h3>
		<a href="CreateOrderUserToHomePage" class="active">Home</a> 
		<a href="HomeUsertoCreateOrder">Create Order</a> 
		<a href="OrderListUserservlet">Order List</a>
		<a href="UserGoTrack">Track the route</a>
	</div>

	<!-- Content -->
	<div class="content">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Home</h1>
		<a href="UserLogOutServlet"><button class="logout-btn" onclick="location.href='LogoutServlet'">Logout</button></a>
		</div>	
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
