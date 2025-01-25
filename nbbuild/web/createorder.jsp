<%-- 
    Document   : createorder
    Created on : Dec 7, 2024, 10:07:42 PM
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
        <form action="createorderservlet" method="post"><br>
            Sender:<input type="text" name="sender"><br>
            Receiver:<input type="text" name="receiver"><br>
            Origin_address: <input type="text" name="origin_address"><br>
            Destination_address:<input type="text" name="destination_address"><br>
            Sender_phone:<input type="text" name="sender_phone"><br>
            Receiver_phone:<input type="text" name="receiver_phone"><br>
            Weight:<input type="text" name="weight"><br>
            <button type="submit">Submit</button>
        </form>
        ${msg}
        <!-- <button><a href="CreateOrderUserToHomePage">Exit</a></button> -->
    </body>
</html>
