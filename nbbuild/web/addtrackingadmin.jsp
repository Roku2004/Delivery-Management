<%-- 
    Document   : addtrackingadmin
    Created on : Dec 21, 2024, 2:53:06 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addtrackingservlet" method="post">
            Route_id: <input type="text" name="route"><br>
            Order:<input type="text" name ="order"><br>
            Address : <input type="text" name="address"><br>
            Time:<input type="date" name="time"><br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
