<%-- 
    Document   : login
    Created on : Nov 12, 2024, 8:11:31 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <title>Modern Login</title>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
      background-size: 400% 400%;
      animation: gradient 15s ease infinite;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      height: 100vh;
    }

    @keyframes gradient {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .container {
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      position: relative;
      overflow: hidden;
      width: 768px;
      max-width: 100%;
      min-height: 480px;
    }

    .container p {
      font-size: 14px;
      line-height: 20px;
      letter-spacing: 0.3px;
      margin: 20px 0;
      color: #fff;
    }

    .container span {
      font-size: 14px;
      color: #666;
      margin: 15px 0;
    }

    .container a {
      color: #333;
      font-size: 13px;
      text-decoration: none;
      margin: 15px 0 10px;
      transition: color 0.3s ease;
    }

    .container a:hover {
      color: #e73c7e;
    }

    .container button {
      background: linear-gradient(45deg, #e73c7e, #23a6d5);
      color: #fff;
      font-size: 12px;
      padding: 12px 45px;
      border: none;
      border-radius: 50px;
      font-weight: 600;
      letter-spacing: 0.5px;
      text-transform: uppercase;
      margin-top: 10px;
      cursor: pointer;
      transition: transform 0.3s ease;
    }

    .container button:hover {
      transform: translateY(-2px);
    }

    .container button.hidden {
      background: transparent;
      border: 2px solid #fff;
    }

    .container form {
      background-color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      padding: 0 40px;
      height: 100%;
    }

    .container input {
      background-color: #f4f8f7;
      border: 2px solid #eee;
      margin: 8px 0;
      padding: 12px 15px;
      font-size: 13px;
      border-radius: 50px;
      width: 100%;
      outline: none;
      transition: border-color 0.3s ease;
    }

    .container input:focus {
      border-color: #e73c7e;
    }

    .form-container {
      position: absolute;
      top: 0;
      height: 100%;
      transition: all 0.6s ease-in-out;
    }

    .sign-in {
      left: 0;
      width: 50%;
      z-index: 2;
    }

    .container.active .sign-in {
      transform: translateX(100%);
    }

    .sign-up {
      left: 0;
      width: 50%;
      opacity: 0;
      z-index: 1;
    }

    .container.active .sign-up {
      transform: translateX(100%);
      opacity: 1;
      z-index: 5;
      animation: move 0.6s;
    }

    @keyframes move {
      0%, 49.99% {
        opacity: 0;
        z-index: 1;
      }
      50%, 100% {
        opacity: 1;
        z-index: 5;
      }
    }

    .social-icons {
      margin: 20px 0;
    }

    .social-icons a {
      border: 1px solid #ddd;
      border-radius: 50%;
      display: inline-flex;
      justify-content: center;
      align-items: center;
      margin: 0 5px;
      width: 40px;
      height: 40px;
      transition: all 0.3s ease;
    }

    .social-icons a:hover {
      background: linear-gradient(45deg, #e73c7e, #23a6d5);
      border-color: transparent;
      color: white;
    }

    .toggle-container {
      position: absolute;
      top: 0;
      left: 50%;
      width: 50%;
      height: 100%;
      overflow: hidden;
      transition: all 0.6s ease-in-out;
      border-radius: 150px 0 0 100px;
      z-index: 1000;
    }

    .container.active .toggle-container {
      transform: translateX(-100%);
      border-radius: 0 150px 100px 0;
    }

    .toggle {
      background: linear-gradient(to right, #e73c7e, #23a6d5);
      height: 100%;
      color: #fff;
      position: relative;
      left: -100%;
      height: 100%;
      width: 200%;
      transform: translateX(0);
      transition: all 0.6s ease-in-out;
    }

    .container.active .toggle {
      transform: translateX(50%);
    }

    .toggle-panel {
      position: absolute;
      width: 50%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      padding: 0 30px;
      text-align: center;
      top: 0;
      transform: translateX(0);
      transition: all 0.6s ease-in-out;
    }

    .toggle-left {
      transform: translateX(-200%);
    }

    .container.active .toggle-left {
      transform: translateX(0);
    }

    .toggle-right {
      right: 0;
      transform: translateX(0);
    }

    .container.active .toggle-right {
      transform: translateX(200%);
    }

    .container h1 {
      color: #333;
      margin-bottom: 10px;
      font-weight: 700;
    }

    .toggle-panel h1 {
      color: #fff;
    }
  </style>
</head>
<body>
  <div class="container" id="container">
    <div class="form-container sign-up">
      <form action="registerservlet" method="post">
        <h1>Create Account</h1>
        <div class="social-icons">
          <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
        </div>
        <input type="text" name="user" placeholder="Username" required>
        <input type="password" name="pass" placeholder="Password" required>
        <input type="text" name="full_name" placeholder="Full Name" required>
        <input type="tel" name="phone" placeholder="Phone" required>
        <button type="submit">Sign Up</button>
      </form>
    </div>

    <div class="form-container sign-in">
      <form action="loginservlet" method="Post">
        <h1>Sign In</h1>
        <div class="social-icons">
          <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
          <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
        </div>
        <span>or use your email password</span>
        <input type="text" name="Username" placeholder="Username" required />
        <input type="password" name="Password" placeholder="Password" required />
        <a href="#">Forgot Your Password?</a>
        <button type="submit">Sign In</button>
      </form>
    </div>

    <div class="toggle-container">
      <div class="toggle">
        <div class="toggle-panel toggle-left">
          <h1>Welcome Back!</h1>
          <p>Enter your personal details to use all site features</p>
          <button class="hidden" id="login">Sign In</button>
        </div>
        <div class="toggle-panel toggle-right">
          <h1>Hello, Friend!</h1>
          <p>Register with your personal details to use all site features</p>
          <button class="hidden" id="register">Sign Up</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    const container = document.getElementById("container");
    const registerBtn = document.getElementById("register");
    const loginBtn = document.getElementById("login");
    
    registerBtn.addEventListener("click", () => {
      container.classList.add("active");
    });
    
    loginBtn.addEventListener("click", () => {
      container.classList.remove("active");
    });
  </script>
</body>

</html>
