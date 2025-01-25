<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Lookup</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      line-height: 1.6;
      background-color: #f0f2f5;
    }

    .navbar {
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
      padding: 1rem;
    }

    .navbar-brand {
      font-weight: 600;
      font-size: 1.5rem;
    }

    .hero-section {
      background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                  url('./Image/background_in_space.jpg') no-repeat center center/cover;
      color: white;
      padding: 80px 0;
      text-align: center;
    }

    .hero-section h1 {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 2rem;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    .search-container {
      max-width: 600px;
      margin: 0 auto;
      position: relative;
    }

    .search-container input {
      height: 50px;
      border-radius: 25px;
      padding-left: 20px;
      border: none;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .search-container button {
      position: absolute;
      right: 0;
      height: 50px;
      width: 50px;
      border-radius: 0 25px 25px 0;
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
      border: none;
    }

    .search-container button:hover {
      background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
    }

    .order-info {
      max-width: 800px;
      margin: 30px auto;
      background: white;
      border-radius: 20px;
      padding: 20px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }

    .order-info table {
      margin: 0;
      width: 100%;
    }

    .order-info th {
      background: #f8f9fa;
      padding: 15px;
      font-weight: 600;
      color: #1e3c72;
      width: 40%;
      border: none;
    }

    .order-info td {
      padding: 15px;
      color: #444;
      border: none;
      background: white;
    }

    .order-info tr {
      border-bottom: 1px solid #eee;
      transition: background-color 0.3s;
    }

    .order-info tr:last-child {
      border-bottom: none;
    }

    .order-info tr:hover {
      background-color: #f8f9fa;
    }
  .content-wrapper {
      flex: 1 0 auto;
    }

    .image-gallery {
      padding: 50px 0;
      background: #f8f9fa;
    }

    .image-gallery .container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      padding: 20px;
    }

    .gallery-item {
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      transition: transform 0.3s;
    }

    .gallery-item:hover {
      transform: translateY(-5px);
    }

    .gallery-item img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }
    footer {
      flex-shrink: 0;
      padding: 1rem 0;
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
      color: white;
    }

    footer p {
      margin: 0;
      font-size: 0.9rem;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .order-info {
      animation: fadeIn 0.5s ease-out;
    }
  </style>
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="GoHomePage">
        <i class="fas fa-shipping-fast me-2"></i>Logistics
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#members">
              <i class="fas fa-users me-1"></i>Members
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="GoLoginAdmin">
              <i class="fas fa-sign-in-alt me-1"></i>Sign in | Sign up
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container">
      <h1>Track Your Order</h1>
      <div class="search-container">
        <form action="SearchOrderAdmin" method="POST" class="d-flex">
          <input type="text" class="form-control" placeholder="Enter your tracking number..." name="id" required>
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-search"></i>
          </button>
        </form>
      </div>

      <c:if test="${order != null}">
        <div class="order-info">
          <table class="table">
            <tr>
              <th>Bill of Lading No</th>
              <td>${order.order_id}</td>
            </tr>
            <tr>
              <th>Sender</th>
              <td>${order.sender}</td>
            </tr>
            <tr>
              <th>Receiver</th>
              <td>${order.receiver}</td>
            </tr>
            <tr>
              <th>Origin</th>
              <td>${order.originAddress}</td>
            </tr>
            <tr>
              <th>Destination</th>
              <td>${order.destinationAddress}</td>
            </tr>
            <tr>
              <th>Contact Info</th>
              <td>
                <div>Sender: ${order.sender_phone}</div>
                <div>Receiver: ${order.receiver_phone}</div>
              </td>
            </tr>
            <tr>
              <th>Status</th>
              <td><span class="badge bg-primary">${order.status}</span></td>
            </tr>
            <tr>
              <th>Package Details</th>
              <td>
                <div>Weight: ${order.weight} kg</div>
                <div>Cost: $${order.total_cost}</div>
                <div>Payment: ${order.payment_status ? '<span class="badge bg-success">Paid</span>' : '<span class="badge bg-warning">Pending</span>'}</div>
              </td>
            </tr>
          </table>
        </div>
      </c:if>
    </div>
  </section>
<div class="content-wrapper">
    <!-- Image Gallery Section -->
    <section class="image-gallery">
      <div class="container">
        <div class="gallery-item">
          <img src="/api/placeholder/400/200" alt="Logistics 1">
        </div>
        <div class="gallery-item">
          <img src="/api/placeholder/400/200" alt="Logistics 2">
        </div>
        <div class="gallery-item">
          <img src="/api/placeholder/400/200" alt="Logistics 3">
        </div>
        <div class="gallery-item">
          <img src="/api/placeholder/400/200" alt="Logistics 4">
        </div>
      </div>
    </section>
  </div>
  <!-- Footer -->
  <footer>
    <div class="container">
      <p>© 2024 Logistics Company. All rights reserved.</p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
