<%-- 
    Document   : updateorderadmin
    Created on : Dec 10, 2024, 8:27:49 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Update Order</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
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

  <!-- Content -->
  <div class="content">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h1>Update Order</h1>
      <a href = "AdminLogOurServlet"><button class="logout-btn">Log out</button></a>
    </div>

    <div class="form-container">
      <form action="UpdateOrderAdminservlet" method="post">
        <div class="mb-3">
          <label for="order_id" class="form-label">Bill of Lading No</label>
          <input type="text" class="form-control" id="order_id" name="order_id" placeholder="Order ID" required />
        </div>
        <div class="mb-3">
          <label for="sender" class="form-label">Sender Name</label>
          <input type="text" class="form-control" id="sender" name="sender" placeholder="Sender Name" required />
        </div>
        <div class="mb-3">
          <label for="receiver" class="form-label">Receiver Name</label>
          <input type="text" class="form-control" id="receiver" name="receiver" placeholder="Receiver Name" required />
        </div>
        <div class="mb-3">
          <label for="origin_address" class="form-label">Origin Address</label>
          <input type="text" class="form-control" id="origin_address" name="origin_address" placeholder="Origin Address"
            required />
        </div>
        <div class="mb-3">
          <label for="destination_address" class="form-label">Destination Address</label>
          <input type="text" class="form-control" id="destination_address" name="destination_address"
            placeholder="Destination Address" required />
        </div>
        <div class="mb-3">
          <label for="sender_phone" class="form-label">Sender Phone</label>
          <input type="text" class="form-control" id="sender_phone" name="sender_phone" placeholder="Sender Phone"
            required />
        </div>
        <div class="mb-3">
          <label for="receiver_phone" class="form-label">Receiver Phone</label>
          <input type="text" class="form-control" id="receiver_phone" name="receiver_phone"
            placeholder="Receiver Phone" required />
        </div>
        <div class="mb-3">
          <label for="status" class="form-label">Status</label>
          <select class="form-select" id="status" name="status">
            <option value="Wait confirm">Wait confirm</option>
            <option value="Wait delivery">Wait delivery</option>
            <option value="Delivering">Delivering</option>
            <option value="Delivered">Delivered</option>
            <option value="Canceled">Canceled</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="weight" class="form-label">Weight</label>
          <input type="text" class="form-control" id="weight" name="weight" placeholder="Weight" required />
        </div>
        <div class="mb-3">
          <label for="total" class="form-label">Total Cost</label>
          <input type="text" class="form-control" id="total" name="total" placeholder="Total Cost" required />
        </div>
        <div class="mb-3">
          <label for="payment" class="form-label">Payment Status</label>
          <select class="form-select" id="payment" name="payment">
            <option value="true">Paid</option>
            <option value="false">Not Yet</option>
          </select>
        </div>
        <button type="submit" class="btn btn-submit w-100">Update</button>
      </form>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
