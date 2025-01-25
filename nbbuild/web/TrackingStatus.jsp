<%-- 
    Document   : TrackingStatus
    Created on : Dec 21, 2024, 4:17:53 PM
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
        <c:if test="${empty list}">
            List NULL
        </c:if>
        <c:if test="${not empty list}">
        <table>
            <tr>
                <th>Address</th>
                <th>Time</th>
            </tr>    
            <c:forEach var="ten" items="${list}">
            <tr>
                <td>${ten.address}</td>
                <td>${ten.time}</td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>     
    </body>
</html>
