<%-- 
    Document   : routeList
    Created on : Dec 19, 2024, 10:25:10 PM
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
        <c:if test="${empty list}">
            List NULL
        </c:if>
        <c:if test="${not empty list}">
        <table>
            <tr>
                <th>Route_id</th>
                <th>StartPoint</th>
                <th>EndPoint</th>
                <th>Driver</th>
                <th>Vehical</th>
            </tr>    
            <c:forEach var="ten" items="${list}">
            <tr>
                <td>${ten.route_id}</td>
                <td>${ten.startPoint}</td>
                <td>${ten.endPoint}</td>
                <td>${ten.driver.driver_id}</td>
                <td>${ten.vehical.vehical_id}</td>
                <td><a href="AdminRouteListToUpdate">Update</a></td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>   
    </body>
</html>
