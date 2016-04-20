<%-- 
    Document   : Logout
    Created on : Apr 17, 2016, 11:11:20 PM
    Author     : ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.getSession().invalidate();
            response.sendRedirect("/UMS/HTML/student_login.html");
        %>
    </body>
</html>
