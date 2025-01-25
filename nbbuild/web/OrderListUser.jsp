<%-- 
    Document   : OrderListUser
    Created on : Dec 8, 2024, 3:53:20 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order</title>
    </head>
    <body>
        <form action="searchorderuserservlet" method="GET">
            <label for="id">Nhập ID:</label>
            <input type="text" id="id" name="id" required>
            <button type="submit">Search</button>
        </form>
        
        <c:if test="${empty order}">
            Not Found
        </c:if>
        <c:if test="${not empty order}">
            <table>
            <tr>
                <th>Bill of lading no</th>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Origin_address</th>
                <th>Destination_address</th>
                <th>Sender_phone</th>
                <th>Receiver_phone</th>
                <th>Status</th>
                <th>Weight</th>
                <th>Total_cost</th>
                <th>Payment status</th>
            </tr>    
            <c:forEach var="ten" items="${order}">
            <tr>
                <td>${ten.order_id}</td>
                <td>${ten.sender}</td>
                <td>${ten.receiver}</td>
                <td>${ten.originAddress}</td>
                <td>${ten.destinationAddress}</td>
                <td>${ten.sender_phone}</td>
                <td>${ten.receiver_phone}</td>
                <td>${ten.status}</td>
                <td>${ten.weight}</td>
                <td>${ten.total_cost}</td>
                <td>${ten.payment_status ? Paid : Unpaid}</td>
                <td><a href="UserListOrderToUpdate">Update</a></td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>
        
        
        
        <c:if test="${empty orderlist}">
            List NULL
        </c:if>
        <c:if test="${not empty orderlist}">
        <table>
            <tr>
                <th>Bill of lading no</th>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Origin_address</th>
                <th>Destination_address</th>
                <th>Sender_phone</th>
                <th>Receiver_phone</th>
                <th>Status</th>
                <th>Weight</th>
                <th>Total_cost</th>
                <th>Payment status</th>
            </tr>    
            <c:forEach var="ten" items="${orderlist}">
            <tr>
                <td>${ten.order_id}</td>
                <td>${ten.sender}</td>
                <td>${ten.receiver}</td>
                <td>${ten.originAddress}</td>
                <td>${ten.destinationAddress}</td>
                <td>${ten.sender_phone}</td>
                <td>${ten.receiver_phone}</td>
                <td>${ten.status}</td>
                <td>${ten.weight}</td>
                <td>${ten.total_cost}</td>
                <td>${ten.payment_status ? Paid : Unpaid}</td>
                <td><a href="UserListOrderToUpdate">Update</a></td>
            </tr>
            </c:forEach>
        </table> 
        </c:if>     
    </body>
</html>
