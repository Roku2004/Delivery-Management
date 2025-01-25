<%-- 
    Document   : vehicleList
    Created on : Dec 10, 2024, 4:30:31 PM
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
                <th>Vehical_id</th>
                <th>Vehicaltype</th>
                <th>Capacity(KG)</th>
                <th>NumberPlate</th>
            </tr>    
            <c:forEach var="ten" items="${list}">
            <tr>
                <td>${ten.vehical_id}</td>
                <td>${ten.vehicalType}</td>
                <td>${ten.capacity}</td>
                <td>${ten.numberPlate}</td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>   

    </body>
</html>
