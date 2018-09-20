<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
    if (razon.equals("0")) {
        razon = "Todos";
    }
%>
<html>

    <head>
        <title>Modificar Tipo de Cambio - SIT STT</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables jsp5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery.tablescroll.css"/> 
        <script type="text/javascript" src="js/Script.js"></script>

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
        <script type="text/javascript">
            function enable_sel()
            {
                if (document.getElementById("chbCuentaEspecial").checked === true)
                {
                    document.getElementById("selCuentasEspecial").disabled = false;
                }
                else {
                    document.getElementById("selCuentasEspecial").disabled = true;
                }
            }

        </script>
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
                                <%
                                    if (rol.equals("3")) {
                                %>
                            <li><a style="background-color:lightgrey" href="#">Preferencias</a>
                                <ul>
                                    <li><a href="creacionBeneficiaros.jsp">Incluir Beneficiario</a></li>
                                    <li><a href="creacionPaises.jsp">Incluir Pais</a></li>
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a href="creacionUsuario.jsp">Incluir Usuario</a></li>
                                    <li><a href="privilegios.jsp">Privilegios</a></li>
                                    <li><a style="background-color:lightgrey" href="modCuenta.jsp">Modificar cuenta</a></li>
                                    <li><a href="modCambio.jsp">Modificar Tipo de Cambio</a></li> <li><a href="modFondo.jsp">Modificar Fondo</a></li>
                                </ul>

                            </li>
                            <%
                                }
                            %>
                            
                                <%
                                    if (!rol.equals("2")) {
                                %>
                            <li><a href="crearMovimientos.jsp">Creaci�n de Solicitud</a></li>
                            <li><a href="#">Flujo</a>
                                <ul>
                                    <li><a href="ingresos.jsp">Ingresos</a></li>
                                    <li><a href="egresos.jsp">Egresos</a></li>
                                    <li><a href="transferencias.jsp">Transferencias</a></li>
                                    <li><a href="divisas.jsp">Divisas</a></li>
                                    <li><a href="fondoInversion.jsp">Fondo de Inversi�n</a></li>
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
                                ;}
                            %>
                            <li><a href="buscadorParametros.jsp">B�squeda por par�metros</a></li>
                            <li><a href="reporteria.jsp">Creaci�n de Reporter�a</a></li>
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
                        <h3>Links Utiles</h3>
                        <ul>
                            <li><a href="https://system.netsuite.com/pages/customerlogin.jsp?country=US">NetSuite</a></li>
                            <li><a href="https://drive.google.com/drive/u/0/#my-drive">Google Drive</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content" style="padding: 14px 0 0 50px;">
                    <form action="GestorLogica" method="post">
                        <div class="form_settings">
                            <label>
                                <span>Cuenta   a modificar &nbsp;&nbsp;</span>
                                <%
                                    String bancoFlag = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                    String sql = "select CUENTA FROM AA_BANCO_CUENTA";
                                    PreparedStatement pstmt = connection.prepareStatement(sql);
                                    ResultSet resultset = pstmt.executeQuery();
                                %>
                                <select id="id" name="txtModCuentaCuenta">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>

                                    <option><%= resultset.getString(1)%></option>
                                    <%
                                        }
                                    %>


                                </select>



                            </label>  <br/><br/>
                            <label>
                                <span>Cuenta  nueva &nbsp;&nbsp;</span>
                                <input type="text" name="txtModCuentaCuentaN" id="datepicker"/><br/><br/>
                            </label>  
                            <label>
                                <span>Banco &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        resultset = statement.executeQuery("select * from AA_BANCO");


                                %>
                                <select  id="cmbCuentaModBancos" name="cmbCuentaModBancos">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(2)%></option>
                                    <% } %>
                                </select>

                                <%
                                    connection.close();
                                } catch (Exception e) {

                                %>

                                <%                                }
                                %>
                                <br/><br/>
                            </label>

                            <label>
                                <span>Raz�n Social &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        resultset = statement.executeQuery("select * from AA_BENEFICIARIO");

                                %>
                                <select id="cmbCuentaModBeneficiario" name="cmbCuentaModBeneficiario">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(3)%></option>
                                    <% } %>
                                </select>

                                <%
                                    connection.close();
                                } catch (Exception e) {

                                %>

                                <%                                }
                                %>
                                <br/><br/>
                            </label>   

                            <label><span>Pais  &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        resultset = statement.executeQuery("select * from AA_LUGAR");
                                %>
                                <select id="selCuentaModLugar" name="selCuentaModLugar">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(2)%></option>
                                    <% } %>
                                </select>

                                <%
                                    connection.close();
                                } catch (Exception e) {

                                %>
                                <script>
                                    alert("Error: " + e.toString());
                                </script>

                                <%                                }
                                %>


                            </label><br/><br/>
                            <label><span>Moneda  &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        resultset = statement.executeQuery("select * from AA_MONEDA");

                                %>
                                <select id="id" name="txtCuentasModListaMoneda">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(2)%></option>
                                    <% } %>
                                </select>

                                <%
                                    connection.close();
                                } catch (Exception e) {

                                %>
                                <script>
                                    alert("Error: " + e.toString());
                                </script>

                                <%                                }
                                %>
                            </label><br/><br/>

                            <p>
                                <a href="ingresos.jsp">
                                    <p style="padding-top: 10px">
                                        <input class="submit" type="submit" name="btnModCuentaGuardar"  value="Guardar"/>
                                </a></p>





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
            <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creaci�n de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creaci�n de Movimientos</a> | <a href="buscadorParametros.jsp">B�squeda por par�metros</a> | <a href="reporteria.jsp">Creaci�n de Reporter�a</a>| <a href="logout.jsp">Logout</a></p>            
        </footer>
    </body>
</html>
