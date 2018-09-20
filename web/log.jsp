<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
// Leemos la variable de sessión 'validado'
    Cookie[] cookies = request.getCookies();
    String valor = "0";
    try {
        for (Cookie c : cookies) {
            if (c.getName().equals("validado")) {
                valor = c.getValue();
            }
        }
    } catch (Exception e) {

    }
// Si la variable de session 'valiadado' ya
// ha sido creada o el valor es 'true'

    System.out.println("Valor: " + valor);
    if (valor.equals("1")) // Redireccionamos a la página bienvenido.jsp
    {
        response.sendRedirect("index.jsp");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
    <head>

        <link rel="stylesheet" href="css/login.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
    </head>
    <body>

        <form action="GestorLogica" method="post">


            <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            <div id="logmsk" style="display: block;">
                <div id='close'>X</div>
                <div id="userbox">
                    <h1 id="signup" style="  background: #555; color: #FFF; background-position: initial initial; background-repeat: initial initial;">Log In</h1>
                    <div id="sumsk" style="display: none;">Sending</div>
                    <input id="name" name="usuario" placeholder="Usuario" style="opacity: 1; background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">
                    <input id="pass" name="pass" type="password" placeholder="Contraseña" style="opacity: 1; background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">
                    <button id="signupb" name="signupb" >Entrar</button>
                </div>
            </div>

            <!--<script src="js/login.js"></script>-->





        </form>
    </body>