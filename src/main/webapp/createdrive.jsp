<%-- 
    Document   : updateorderadmin
    Created on : Dec 10, 2024, 8:27:49 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Driver</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(to right, #ece9e6, #ffffff);
}

.sidebar {
	background-color: #343a40;
	color: #fff;
	height: 100vh;
	position: fixed;
	width: 20%;
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

.content {
	margin-left: 20%;
	padding: 20px;
}

.form-container {
	background: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 20px;
}

.form-label {
	font-weight: bold;
	color: #495057;
}

.btn-submit {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
}

.btn-submit:hover {
	background-color: #0056b3;
}
</style>
</head>

<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h3>Menu</h3>
		<a href="Exit">Home</a> <a href="AdiminpagetoCreateOrder">Create
			Order</a> <a href="orderlistadminservlet">Order List</a> <a
			href="AdminpagetoCreateDriver">Create Driver</a> <a
			href="driverListservlet">Driver List</a> <a
			href="AdminpagetoCreateVehical">Create Vehicle</a> <a
			href="vehicleListservlet">Vehicle List</a> <a
			href="AdminpagetoCreateRoute">Create Route</a> <a
			href="routeListservlet">Route List</a> <a
			href="AdminpagetoCreateTracking">Add Tracking</a> <a
			href="TrackingListservlet">Tracking List</a>
	</div>

	<!-- Content -->
	<div class="content">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Create Order</h1>
			<a href = "AdminLogOurServlet"><button class="logout-btn">Log out</button></a>    
		</div>

		<div class="form-container">
			<form action="createorderadminservlet" method="post">
				<div class="mb-3">
					<label for="Driver name" class="form-label">Driver name</label>
					<input type="text" class="form-control" id="Driver name"
						name="drive_name" placeholder="Driver name" required />
				</div>

				<div class="mb-3">
					<label for="Driver phone" class="form-label">Driver phone</label> <input
						type="text" class="form-control" id="Driver phone" name="Driver phone"
						placeholder="Driver phone" required />
				</div>
	
				<div class="mb-3">
					<label for="payment" class="form-label">Status</label> <select
						class="form-select" id="payment" name="status">
						<option value="true">Doing</option>
						<option value="false">Took a break</option>
					</select>
				</div>
				<button type="submit" class="btn btn-submit w-100">Create</button>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
