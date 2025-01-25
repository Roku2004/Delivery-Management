<%-- 
    Document   : admincreateorder
    Created on : Dec 9, 2024, 8:57:21 PM
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
        <form action="createorderadminservlet" method="post"><br>
            Sender:<input type="text" name="sender"><br>
            Receiver:<input type="text" name="receiver"><br>
            Origin_address: <input type="text" name="origin_address"><br>
            Destination_address:<input type="text" name="destination_address"><br>
            Sender_phone:<input type="text" name="sender_phone"><br>
            Receiver_phone:<input type="text" name="receiver_phone"><br>
            Weight:<input type="text" name="weight"><br>
            Total cost: <input type="text" name="cost"><br>
            Payment status:<select id="choice" name="payment">
                                <option value="true">Paid</option>
                                <option value="false">Not yet paid</option>
            </select><br>
            Status:<select id="choice" name="status">
                                <option value="wait confirm">Wait confirm</option>
                                <option value="wait delivery">Wait delivery</option>
                                <option value="delivering">Delivering</option>
                                <option value="delivered">Delivered</option>
                                <option value="canceled">Canceled</option>
                    </select><br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
