<%-- 
    Document   : logout
    Created on : Aug 11, 2015, 12:50:31 PM
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%

            for (Cookie cookie : request.getCookies()) {
                cookie.setValue("");
                cookie.setMaxAge(0);
                cookie.setPath("/");

                response.addCookie(cookie);
            }

            response.sendRedirect("log.jsp");
        %>
    </head>
    <body>
        <h4>Good Bye!</h4>
        <h4>Hasta Luego!</h4>
    </body>
</html>


