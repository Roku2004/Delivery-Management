<%-- 
    Document   : createRouteAdmin
    Created on : Dec 12, 2024, 4:03:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="createRouteservlet" method="post">
            StartPoint: <input type="text" name="startpoint"><br>
            EndPoint: <input type="text" name="endpoint"><br>
            Driver: <input type="text" name="driver"><br>
            Vehical: <input type="text" name="vehical"><br>
        <button type="submit">Submit</button>
        </form>
    </body>
</html>
