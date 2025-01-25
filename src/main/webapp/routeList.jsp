<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>List Route</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

        table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
          font-size: 14px;
        }

        table th,
        table td {
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

.update-btn {
	display: inline-block;
	padding: 8px 16px;
	background: linear-gradient(90deg, #4caf50, #81c784);
	color: white;
	border: none;
	border-radius: 50px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.update-btn:hover {
	background: linear-gradient(90deg, #81c784, #4caf50);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}

        @media screen and (max-width: 768px) {
          table {
            font-size: 12px;
          }

          table th,
          table td {
            white-space: nowrap;
          }
        }
      </style>
    </head>

    <body>
      <!-- Sidebar -->
      <div class="sidebar">
        <h3>Menu</h3>
        <a href="Exit">Home</a>
        <a href="AdiminpagetoCreateOrder">Create Order</a>
        <a href="orderlistadminservlet">Order List</a>
        <a href="AdminpagetoCreateDriver">Create Driver</a>
        <a href="driverListservlet">Driver List</a>
        <a href="AdminpagetoCreateVehical">Create Vehicle</a>
        <a href="vehicleListservlet">Vehicle List</a>
        <a href="AdminpagetoCreateRoute">Create Route</a>
        <a href="routeListservlet">Route List</a>
        <a href="AdminpagetoCreateTracking">Add Tracking</a>
        <a href="TrackingListservlet">Tracking List</a>
      </div>

      <!-- Page Content -->
      <div class="content">
        <!-- Header -->
        <div class="header">
          <h1>List Route</h1>
          <a href = "AdminLogOurServlet"><button class="logout-btn" onclick="location.href='LogoutServlet'">Logout</button></a>  
        </div>

        <!-- Search Bar -->
        <!-- Table -->
        <c:if test="${empty list}">
          <div class="alert alert-warning">List is empty.</div>
        </c:if>

        <c:if test="${not empty list}">
          <table>
            <thead>
              <tr>
                <th>Route_id</th>
                <th>StartPoint</th>
                <th>EndPoint</th>
                <th>Driver</th>
                <th>Vehical</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="ten" items="${list}">
                <tr>
                  <td>${ten.route_id}</td>
                  <td>${ten.startPoint}</td>
                  <td>${ten.endPoint}</td>
                  <td>${ten.driver.driver_id}</td>
                  <td>${ten.vehical.vehical_id}</td>
                  <td><a href="AdminRouteListToUpdate" class ="update-btn">Update</a></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:if>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>