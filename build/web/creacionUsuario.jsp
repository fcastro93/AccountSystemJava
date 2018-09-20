<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String valor = "0";
   String rol = "0";
   String razon = "0";
    try {
        for (Cookie c : cookies) {
            if (c.getName().equals("validado")) {
                valor = c.getValue();
            }
            if (c.getName().equals("rol")) {
                rol = c.getValue();
            }
            if (c.getName().equals("razon")) {
                razon = c.getValue();
            }
        }
    } catch (Exception e) {

    }
        if (valor.equals("0")) {
        response.sendRedirect("log.jsp");
    }
    if(razon.equals("0")){
        razon = "Todos";
    }
%>
<html>

    <head>
        <title>Agregar Usuario - SIT STT</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables jsp5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>



    </head>

    <body>
        <header>
            <div id="logo">
                <div id="logo_text">
                    <!-- class="logo_colour", allows you to change the colour of the text -->
                    <h1><a href="index.jsp"><span class="logo_colour">SIT</span></a></h1>
                        <h2>Sistema Integrado de Tesoreria</h2>
                </div>
            </div>
            <nav>
                <div id="menu_container">
                    <ul class="sf-menu" id="nav">
                            <li><a href="index.jsp">Inicio</a></li>
                                <%
                                    if (rol.equals("3")) {
                                %>
                            <li><a style="background-color:lightgrey" href="#">Preferencias</a>
                                <ul>
                                    <li><a href="creacionBeneficiaros.jsp">Incluir Beneficiario</a></li>
                                    <li><a href="creacionPaises.jsp">Incluir Pais</a></li>
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a style="background-color:lightgrey" href="creacionUsuario.jsp">Incluir Usuario</a></li>
                                    <li><a href="privilegios.jsp">Privilegios</a></li>                                    <li><a href="modCuenta.jsp">Modificar Cuenta</a></li>                                     <li><a href="modCambio.jsp">Modificar Tipo de Cambio</a></li> <li><a href="modFondo.jsp">Modificar Fondo</a></li>
                                </ul>

                            </li>
                            <%
                                }
                            %>
                            
                                <%
                                    if (!rol.equals("2")) {
                                %>
                            <li><a href="crearMovimientos.jsp">Creación de Solicitud</a></li>
                            <li><a href="#">Flujo</a>
                                <ul>
                                    <li><a href="ingresos.jsp">Ingresos</a></li>
                                    <li><a href="egresos.jsp">Egresos</a></li>
                                    <li><a href="transferencias.jsp">Transferencias</a></li>
                                    <li><a href="divisas.jsp">Divisas</a></li>
                                    <li><a href="fondoInversion.jsp">Fondo de Inversión</a></li>
                                        <%
                                            if (rol.equals("3")) {
                                        %>

                                    <li><a href="cierre.jsp">Cierres</a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                            <%
                                }
                            %>
                            <li><a href="buscadorParametros.jsp">Búsqueda por parámetros</a></li>
                            <li><a href="reporteria.jsp">Creación de Reportería</a></li>
                        </ul>
                </div>
            </nav>
        </header>
        <div id="site_content">
            <div id="sidebar_container">
                <div class="sidebar">
                    <h2>Tienes alguna duda?</h2>
                    <h4>Consulta nuestra guia de</h4>
                    <a href="#"> Preguntas Frecuentes</a>
                </div>
                <div class="sidebar">
                    <h3>Links Útiles</h3>
                    <ul>
                        <li><a href="https://system.netsuite.com/pages/customerlogin.jsp?country=US">NetSuite</a></li>
                        <li><a href="https://drive.google.com/drive/u/0/#my-drive">Google Drive</a></li>
                    </ul>
                </div>

            </div>
            <div class="content">
                <div class="form_settings">
                    <form action="GestorLogica" method="post">
                        <p><span>Nombre</span><input type="text" name="txtUsuarioNombre" value="" /></p>
                        <p><span>Usuario</span><input type="text" name="txtUsuarioUsuario" value="" /></p>
                        <p><span>Contraseña</span><input type="text" name="txtUsuarioContraseña" value="" /></p>
                        
                            
                            <label><span>Rol  &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");        
                                        Statement statement = connection.createStatement();
                                        ResultSet resultset = statement.executeQuery("select * from AA_ROL");
                                %>
                                <select id="selCuentaLugar" name="selUsuarioRol">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(2)%></option>
                                    <% } %>
                                </select>

                                <%
                                    } catch (Exception e) {
                                      
                            %>
                            <script>
                                alert("Error: " + e.toString());
                            </script>

                            <%
                                    }
                                %>


                            </label><br/><br/>
                        <p style="padding-top: 10px"><input class="submit" type="submit" name="btnUsuarioGuardar"  value="Guardar"/>
                    </form>



                </div>
            </div>
        </div>
        <div id="scroll">
            <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
        </div>
        
        <footer>
            <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
            <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
        </footer>
    </div>
    <!-- javascript at the bottom for fast page loading -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
    <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
    <script type="text/javascript" src="js/utilitarios.js"></script>
</body>
</html>
