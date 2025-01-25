<%-- 
    Document   : createvehical
    Created on : Dec 10, 2024, 4:10:47 PM
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
        <form action="createVehicalservlet" method="post">
            VehicalType: <input type="text" name="VehicalType"><br>
            Capacity:<input type="text" name="capacity"><br>
            NumberPlate<input type="text" name="numberPlate"><br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
