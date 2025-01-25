<%-- 
    Document   : register
    Created on : Nov 12, 2024, 8:15:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="registerservlet" method="post">
            <input type="text" name="user" placeholder="User_name" required><br>
            <input type="text" name="pass" placeholder="Password" required><br>
            <input type="text" name="full_name" placeholder="Fullname" required><br>
            <input type="text" name="phone" placeholder="Phone" required><br>
            <button type="submit" class="input-login">Register</button>
        </form>
    </body>
</html>
