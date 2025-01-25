<%-- 
    Document   : updateRoute
    Created on : Dec 19, 2024, 10:11:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updateRouteservlet" method="post">
             <input type="hidden" name="route_id" value="${route_id}">
            StartPoint: <input type="text" name="startpoint"><br>
            EndPoint: <input type="text" name="endpoint"><br>
            Driver: <input type="text" name="driver"><br>
            Vehical: <input type="text" name="vehical"><br>
        <button type="submit">Submit</button>
        </form>
    </body>
</html>
