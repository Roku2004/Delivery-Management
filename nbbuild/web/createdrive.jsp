<%-- 
    Document   : createdrive
    Created on : Dec 11, 2024, 7:01:21 AM
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
        <form action="createDriveradminservlet" method="post">
            Driver_name:<input type="text" name="drive_name"><br>
            Driver_phone:<input type="text" name="phone"><br>
            Status: <select id="choice" name="status">
                                <option value="true">Doing</option>
                                <option value="false">Took a break</option>
                </select><br>
                <button type="submit" >Submit</button>
        </form>
    </body>
</html>
