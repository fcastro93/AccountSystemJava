<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String valor = "0";
    String rol = "0";
    String razon = "0";
    String error = "0";
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
            if (c.getName().equals("error")) {
                error = c.getValue();
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
        <title>Fondos de Inversion - SIT STT</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables jsp5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script type="text/javascript" src="js/Script.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {

                var myCounter = 1;
                $(".myDate").datepicker({dateFormat: 'yy-mm-dd'})

                $("#moreDates").click(function () {

                    $('.myTemplate')
                            .clone()
                            .removeClass("myTemplate")
                            .addClass("additionalDate")
                            .show()
                            .appendTo('#importantDates');

                    myCounter++;
                    $('.additionalDate input[name=inputDate]').each(function (index) {
                        $(this).addClass("myDate");
                        $(this).attr("name", $(this).attr("name") + myCounter);
                    });

                    $(".myDate").on('focus', function () {
                        var $this = $(this);
                        if (!$this.data('datepicker')) {
                            $this.removeClass("hasDatepicker");
                            $this.datepicker();
                            $this.datepicker("show");
                        }
                    });

                });

            });
        </script>

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
                                <%                                    if (rol.equals("3")) {
                                %>
                            <li><a href="#">Preferencias</a>
                                <ul>
                                    <li><a href="creacionBeneficiaros.jsp">Incluir Beneficiario</a></li>
                                    <li><a href="creacionPaises.jsp">Incluir Pais</a></li>
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a href="creacionUsuario.jsp">Incluir Usuario</a></li>
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
                            <li><a style="background-color:lightgrey" href="#">Flujo</a>
                                <ul>
                                    <li><a href="ingresos.jsp">Ingresos</a></li>
                                    <li><a href="egresos.jsp">Egresos</a></li>
                                    <li><a href="transferencias.jsp">Transferencias</a></li>
                                    <li><a href="divisas.jsp">Divisas</a></li>
                                    <li><a style="background-color:lightgrey" href="fondoInversion.jsp">Fondo de Inversión</a></li>
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
            <div id="site_content" >
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

                            <div class="accordion">
                                <div class="accordion-section">
                                    <a class="accordion-section-title" href="#accordion-1"><label name="txtCambioUno" id="txtCambioUno">Apertura</label></a>
                                    <div id="accordion-1" class="accordion-section-content">
                                        <% if (error.equals("1")) {%>
                                        <label>
                                            <span style="background-color: red; color: white">ERROR: El cierre no se ha realizado aún&nbsp;&nbsp;</span>
                                            <br/><br/><br/><br/>
                                        </label>
                                        <%
                                                Cookie cookie = new Cookie("error", "0");
        cookie.setPath("/");
                                                response.addCookie(cookie);
                                            }%>
                                        <label>
                                            <span>Fecha de Creacion (MM/DD/YY)&nbsp;&nbsp;</span>
                                            <input class="myDate" type="text" name="txtFechaFondoA"/>

                                            <br/><br/>
                                        </label>
                                        <label>
                                            <span>Nombre &nbsp;&nbsp;</span>
                                            <input type="text" name="txtNombreFondo" id="datepicker"/><br/><br/>
                                        </label>  
                                        <label>
                                            <span>Monto &nbsp;&nbsp;</span>
                                            <input type="text" name="txtMontoFondoAP" id="datepicker"/><br/><br/>
                                        </label>  
                                        <label><span>Moneda  &nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultset = statement.executeQuery("select * from AA_MONEDA");
                                            %>
                                            <select id="id" name="txtFondoMonedaAP">
                                                <option disabled selected> </option>
                                                <%  while (resultset.next()) {%>
                                                <option><%= resultset.getString(2)%></option>
                                                <% } %>
                                            </select>

                                            <%
                                            } catch (Exception e) {
                                                System.out.println(e.toString());
                                            %>

                                            <%                                                }
                                            %>
                                        </label>
                                        <br/><br/>

                                        <label>
                                            <span>Cuenta Origen&nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    String sql = "SELECT CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO = (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD = ?);";
                                                    PreparedStatement pstmt = connection.prepareStatement(sql);
                                                    pstmt.setString(1, razon);
                                                    ResultSet resultset = pstmt.executeQuery();
                                            %>
                                            <select id="id" name="cmbFondoCuentaO">
                                                <option disabled selected> </option>
                                                <%  while (resultset.next()) {%>
                                                <option><%= resultset.getString(1)%></option>
                                                <% } %>
                                            </select>

                                            <%
                                            } catch (Exception e) {
                                                System.out.println(e.toString());
                                            %>
                                            <%                                                }
                                            %>
                                            <br/><br/>
                                            <label>
                                                <span>Nombre de Flujo &nbsp;&nbsp;</span>
                                                <input type="text" name="txtFondoCuentaD" id=""/><br/><br/>
                                            </label> 
                                            <label>
                                                <span>Fecha de caducidad (MM/DD/YY)&nbsp;&nbsp;</span>
                                                <input class="myDate" type="text" name="txtFechaFondoCadu"/>
                                            </label> 
                                            <br/><br/>
                                        </label>
                                        <br/><br/>
                                        </label>
                                        <p>
                                        <p style="padding-top: 10px">
                                            <input class="submit" type="submit" name="btnFondoAPGuardar"  value="Guardar"/>
                                        </p>


                                        <br/><br/>
                                    </div><!--end .accordion-section-content-->
                                </div><!--end .accordion-section-->
                            </div>
                            </a><br/>

                            <div class="accordion">
                                <div class="accordion-section">
                                    <a class="accordion-section-title" href="#accordion-2"><label name="txtCambioUno" id="txtCambioUno">Liquidacion</label></a>
                                    <div id="accordion-2" class="accordion-section-content">
                                        <label>
                                            <span>Fecha (MM/DD/YY)&nbsp;&nbsp;</span>
                                            <input class="myDate" type="text" name="txtFechaFondoL"/>

                                            <br/><br/>
                                        </label>
                                        <label>
                                            <span>Monto &nbsp;&nbsp;</span>
                                            <input type="text" name="txtMontoFondoLI" id="datepicker"/><br/><br/>
                                        </label>  
                                        <label>
                                            <span>Intereses generados &nbsp;&nbsp;</span>
                                            <input type="text" name="txtIntFondoLI" id="datepicker"/><br/><br/>
                                        </label>  


                                        <label><span>Fondo de Inversión  &nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultset = statement.executeQuery("select * from AA_BANCO_FONDO");
                                            %>
                                            <select id="id" name="txtFondoLI">
                                                <option disabled selected> </option>
                                                <%  while (resultset.next()) {%>
                                                <option><%= resultset.getString(2)%></option>
                                                <% } %>
                                            </select>

                                            <%
                                            } catch (Exception e) {
                                                System.out.println(e.toString());
                                            %>


                                            <%                                                }
                                            %>
                                        </label>
                                        <br/><br/>
                                        <label>
                                            <span>Cuenta Destino&nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    String sql = "SELECT CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO = (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD = ?);";
                                                    PreparedStatement pstmt = connection.prepareStatement(sql);
                                                    pstmt.setString(1, razon);
                                                    ResultSet resultset = pstmt.executeQuery();
                                            %>
                                            <select id="id" name="cmbFondoCuentaDLI">
                                                <option disabled selected> </option>
                                                <%  while (resultset.next()) {%>
                                                <option><%= resultset.getString(1)%></option>
                                                <% } %>
                                            </select>

                                            <%
                                            } catch (Exception e) {
                                                System.out.println(e.toString());
                                            %>

                                            <%                                                }
                                            %>
                                        </label>
                                        <br/><br/>
                                        <p style="padding-top: 10px">
                                            <input class="submit" type="submit" name="btnFondoLIGuardar"  value="Guardar"/>
                                        </p>
                                        <br/><br/>
                                    </div><!--end .accordion-section-content-->
                                </div><!--end .accordion-section-->
                            </div>


                            <h2>Fondo de Inversión</h2>


                            <table style="width:900px; border-spacing:0;">
                                <tr><th>Fecha de Emisión</th><th>Nombre</th><th>Monto</th><th>Moneda</th><th>Cuenta Origen</th><th>Fecha de Caducidad</th><!-- <th style="text-align:center"></th><th style="text-align:center"></th><th style="text-align:center"></th></tr> -->
                                        <%
                                            DecimalFormat df = new DecimalFormat("#,###.##");
                                            df.setRoundingMode(RoundingMode.DOWN);
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                                                        + "adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_con", "zAqwsx12");
                                                Statement statement1 = connection.createStatement();
                                                String sentencia = "select * from AA_BANCO_FONDO";
                                                ResultSet resultset = statement1.executeQuery(sentencia);
                                                while (resultset.next()) {

                                        %>
                                <tr>
                                    <%                                        Statement statement2 = connection.createStatement();
                                        ResultSet resultset2 = statement2.executeQuery("select * from AA_BANCO_CUENTA where ID_CUENTA = " + resultset.getString(4));

                                        resultset2.next();

                                    %>
                                    <td class="row"><%= resultset.getString(6)%></td>
                                    <td class="rowID">
                                        <%= resultset.getString(2)%>
                                    <td class="rowID">
                                        <%= String.format("%.2f", (Double.parseDouble(resultset.getString(5))))%>
                                    <td class="rowID">
                                        <% if (resultset.getString(3).equals("1")) {
                                        %>
                                        LOCAL
                                        <%
                                        } else {
                                        %>
                                        DOLARES
                                        <%
                                            }
                                        %>
                                    <td class="rowID">
                                        <%= resultset2.getString(3)%>
                                    </td>
                                    <td class="rowID">
                                        <%= resultset.getString(8)%>
                                    </td>


                                </tr>
                                <%
                                    }
                                    connection.close();

                                } catch (Exception e) {
                                    System.out.println(e.toString());
                                %>

                                <%                                }
                                %>



                            </table>
                        </form>
                    </div>
                </div>
                <br/><br/><br/><br/>
                <div id="content-wrap">

                </div>
            </div>
        </div>
        <div id="scroll">
            <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
        </div>



        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('ul.sf-menu').sooperfish();
                $('.top').click(function () {
                    $('html, body').animate({scrollTop: 0}, 'fast');
                    return false;
                });
            });
        </script>

        <script type="text/javascript" src="js/utilitarios.js"></script>
        <footer>
            <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
            <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
        </footer>
    </body>
</html>
