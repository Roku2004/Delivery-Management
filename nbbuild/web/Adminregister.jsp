<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Adminregisterservlet" method="post">
		<input type="text" name="user" placeholder="User_name" required><br>
		<input type="text" name="pass" placeholder="Password" required><br>
		<input type="text" name="full_name" placeholder="Fullname" required><br> 
		<input type="text" name="phone"placeholder="Phone" required><br>
		<button type="submit" class="input-login">Register</button>
	</form>
</body>
</html>