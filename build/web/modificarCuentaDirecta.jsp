<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    if (valor.equals("0") || razon.equals("0")) {
        response.sendRedirect("log.jsp");
    }
%>
<html>

    <head>
        <title>Modificar - SIT STT</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables jsp5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery.tablescroll.css"/> 
        <script type="text/javascript" src="js/Script.js"></script>
        <script language="JavaScript" src="ts_picker.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

        <!-- Styles -->

        <style type="text/css">

            /**
 * basic layout
 */


            /* sizes */
            #main-wrap > div {
                min-height: 450px;
            }


            #header,
            #footer {
                min-height: 40x;
            }



            #main-wrap > div { min-height: 450px; }


            #header,
            #footer {
                min-height: 40px;
            }


            /* layout */
            #main-wrap {
                /* overflow to handle inner floating block */
                overflow: hidden;
            }

            #sidebar {
                float: left;
                width: 50%;
            }

            #content-wrap {
                float: right;
                width: 50%;
            }  
            .content {
                text-align: left;
                width: auto;
                margin: 0 0 15px 0;
                float: left;
                font-size: 120%;
                padding: 14px 0 0 0;
            }

        </style>

        <script language="JavaScript" type="text/javascript" src="js/pop-up.js"></script> 
    </head>

    <body>

        <div id="main">
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
                            <li><a href="#">Preferencias</a>
                                <ul>
                                    <li><a href="creacionBeneficiaros.jsp">Incluir Beneficiario</a></li>
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a href="creacionUsuario.jsp">Incluir Usuario</a></li>
                                    <li><a href="privilegios.jsp">Privilegios</a></li>                                    <li><a href="modCuenta.jsp">Modificar Cuenta</a></li>                                     <li><a href="modCambio.jsp">Modificar Tipo de Cambio</a></li> <li><a href="modFondo.jsp">Modificar Fondo</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="crearMovimientos.jsp">Creación de Movimientos</a></li>
                            <li><a href="#">Flujo</a>
                                <ul>
                                    <li><a href="ingresos.jsp">Ingresos</a></li>
                                    <li><a href="egresos.jsp">Egresos</a></li>
                                    <li><a href="transferencias.jsp">Transferencias</a></li>
                                    <li><a href="divisas.jsp">Divisas</a></li>
                                    <li><a href="fondoInversion.jsp">Fondo de Inversión</a></li>
                                    <li><a href="cierre.jsp">Cierres</a></li>
                                </ul>
                            </li>
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
                        <h3>Links Ãštiles</h3>
                        <ul>
                            <li><a href="https://system.netsuite.com/pages/customerlogin.jsp?country=US">NetSuite</a></li>
                            <li><a href="https://drive.google.com/drive/u/0/#my-drive">Google Drive</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content" style="padding: 14px 0 0 50px;">
                    <form name="form" action="${pageContext.request.contextPath}/GestorLogica" method="post">
                        <div class="form_settings">

                            <label><span>Cuenta a modificar  &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        ResultSet resultset = statement.executeQuery("select * from AA_BANCO_CUENTA");
                                %>
                                <select id="id" name="txtModCuenta">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(3)%></option>
                                    <% } %>
                                </select>

                                <%
                                } catch (Exception e) {

                                %>
                                <script>
                                    alert("Error: " + e.toString());
                                </script>

                                <%                                }
                                %>
                            </label><br/><br/>
                            
                            <label>
                                <span>Banco &nbsp;&nbsp;</span>
                                <input value="" type="text" name="txtModNuevoBanco"/>
                            </label> &nbsp;&nbsp;
                            <p><a><input class="submit" type="submit" name="btnModBanco"  value="Guardar"/></a></p><br/><br/>

                            <label>
                                <span>Cuenta &nbsp;&nbsp;</span>
                                <input value="" type="text" name="txtModNuevaCuenta" />
                            </label>&nbsp;&nbsp;
                            <p><a><input class="submit" type="submit" name="btnModCuenta"  value="Guardar"/></a></p><br/><br/>
                            
                            <label>
                                <span>Saldo Inicial Nuevo &nbsp;&nbsp;</span>
                                <input value="" type="text" name="txtModNuevoMontoI" />
                            </label>&nbsp;&nbsp;
                            <p><a><input class="submit" type="submit" name="btnModInicial"  value="Guardar"/></a></p><br/><br/>
                            
                            <label>
                                <span>Saldo Final Nuevo &nbsp;&nbsp;</span>
                                <input value="" type="text" name="txtModNuevoMontoF" />
                            </label>&nbsp;&nbsp;
                            <p><a ><input class="submit" type="submit" name="btnModFinal"  value="Guardar"/></a></p><br/><br/>
                            

                        </div>
                    </form>
                </div>
            </div>

            <script type="text/javascript" src="js/jquery.tablescroll.js"></script>

            <div id="scroll">
                <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
            </div>
        </div>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/utilitarios.js"></script>
        
        <footer>
            <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
            <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
        </footer>
    </body>
</html>
