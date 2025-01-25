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


.search-bar {
	margin: 20px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 14px;
}

table th, table td {
	text-align: left;
	padding: 8px;
	border: 1px solid #ddd;
}

table th {
	background-color: #f1f1f1;
}

table tr:nth-child(even) {
	background-color: #f9f9f9;
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
			<h1>Home</h1>
			<a href = "AdminLogOurServlet"><button class="logout-btn">Log out</button></a>    
		</div>

      <!-- Search Bar -->
		<form action="AdminTrackRouteservlet" class="search-bar" method="POST">
			<input type="text" name="search" placeholder="Track Route"
				class="form-control d-inline-block w-75" />
			<button type="submit" class="btn btn-primary d-inline-block"
				data-bs-toggle="modal" data-bs-target="#searchModal">Search</button>
		</form>

		<%-- <c:if test="${empty list}">
			<div class="alert alert-warning">List is empty.</div>
		</c:if> --%>

		<c:if test="${not empty list}">
			<table>
				<thead>
					<tr>
						<th>Bill of Lading No</th>
						<th>Address</th>
						<th>Time</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ten" items="${list}">
						<tr>
							<td>${ten.order.order_id}</td>
							<td>${ten.address}</td>
							<td>${ten.formattedTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
