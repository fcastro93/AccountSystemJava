<%-- 
    Document   : data
    Created on : Jul 29, 2015, 2:44:44 PM
    Author     : Fernando
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = "";
            String q = request.getParameter("q");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                        + "databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                Statement smt = con.createStatement(); //Create Statement to interact
                ResultSet r = smt.executeQuery("select * from AA_FLUJO where(ID_FLUJO='" + q + "');");
                while (r.next()) {
                    name = r.getString("CONCEPTO");
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        Name:<%out.print(name);%>
    </body>
</html>
