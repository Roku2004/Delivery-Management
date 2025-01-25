<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Track the route</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background-color: #f8f9fa;
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
	margin-left: 250px;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: white;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.header h1 {
	margin: 0;
	font-size: 24px;
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
		<a href="CreateOrderUserToHomePage" class="active">Home</a> 
		<a href="HomeUsertoCreateOrder">Create Order</a> 
		<a href="OrderListUserservlet">Order List</a>
		<a href="UserGoTrack">Track the route</a>
	</div>

	<!-- Page Content -->
	<!-- Page Content -->
	<div class="content">
		<!-- Header -->
		<div class="header">
			<h1>List Order</h1>
			<a href="UserLogOutServlet"><button class="logout-btn"
					onclick="location.href='LogoutServlet'">Logout</button></a>
		</div>

		<!-- Search Bar -->
		<form action="SearchTrackOrder" class="search-bar" method="POST">
			<input type="text" name="search" placeholder="Search.."
				class="form-control d-inline-block w-75" />
			<button type="submit" class="btn btn-primary d-inline-block"
				data-bs-toggle="modal" data-bs-target="#searchModal">Search</button>
		</form>

		<c:if test="${empty list}">
			<div class="alert alert-warning">List is empty.</div>
		</c:if>

		<c:if test="${not empty list}">
			<table>
				<thead>
					<tr>
						<th>Bill of Lading No</th>
						<th>Address</th>
						<th>Time/</th>
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

</body>
</html>