<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.CallableStatement"%>
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
        <title>Transferencias - SIT STT</title>
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

        <script type="text/javascript">
            $(document).ready(function () {

                var myCounter = 1;
                $(".myDate").datepicker();

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
                                <%
                                    if (rol.equals("3")) {
                                %>
                            <li><a href="#">Preferencias</a>
                                <ul>
                                    <li><a href="creacionBeneficiaros.jsp">Incluir Beneficiario</a></li>
                                    <li><a href="creacionPaises.jsp">Incluir Pais</a></li>
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a href="creacionUsuario.jsp">Incluir Usuario</a></li>
                                    <li><a href="privilegios.jsp">Privilegios</a></li>
                                    <li><a href="modCuenta.jsp">Modificar Cuenta</a></li>
                                    <li><a href="modCambio.jsp">Modificar Tipo de Cambio</a></li>
                                    <li><a href="modFondo.jsp">Modificar Fondo</a></li>
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
                                    <li><a  style="background-color:lightgrey" href="transferencias.jsp">Transferencias</a></li>
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
                                <span>Fecha (MM/DD/YY)&nbsp;&nbsp;</span>
                                <input class="myDate" type="text" name="txtTransFecha"/>

                                <br/><br/>
                            </label>
                            <label>
                                <label>
                                    <span>Cuenta Origen&nbsp;&nbsp;</span>
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                            String sql = "SELECT CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO = (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD = ?);";
                                            PreparedStatement pstmt = connection.prepareStatement(sql);
                                            pstmt.setString(1, razon);
                                            ResultSet resultset = pstmt.executeQuery();


                                    %>
                                    <select id="id" name="cmbTransOrigen">
                                        <option disabled selected> </option>
                                        <%  while (resultset.next()) {%>
                                        <option><%= resultset.getString(1)%></option>
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
                                </label>
                                <br/><br/>
                                <label>
                                    <span>Cuenta Destino&nbsp;&nbsp;</span>
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                            String sql = "SELECT CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO = (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD = ?);";
                                            PreparedStatement pstmt = connection.prepareStatement(sql);
                                            pstmt.setString(1, razon);
                                            ResultSet resultset = pstmt.executeQuery();


                                    %>
                                    <select id="id" name="cmbTransDestino">
                                        <option disabled selected> </option>
                                        <%  while (resultset.next()) {%>
                                        <option><%= resultset.getString(1)%></option>
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
                                </label>

                                <br/><br/>
                                <span>Monto Salida: &nbsp;&nbsp;</span><input type="text" name="txtMontoTransSalida" value="" onchange="fnc()"/><br/><br/>
                                <span>Monto Entrada: &nbsp;&nbsp;</span><input type="text" name="txtMontoTransEntrada" value="" /><br/><br/>
                                <label>
                                    <span>Comisión Bancaria &nbsp;&nbsp;</span>
                                    <input id="colones" type="text" name="txtTransComi" value="0" /><br/><br/>
                                </label>
                                
                                <span>Concepto&nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection
                                                = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true",
                                                        "adminstt_soporte", "zAqwsx12");
                                        String sql = "call mostrarConceptos()";
                                        PreparedStatement pstmt = connection.prepareStatement(sql);
                                        ResultSet resultset = pstmt.executeQuery();


                                %>
                                <select name="txtConceptoTrans">
                                    <optgroup>
                                        <%                                            while (resultset.next()) {

                                        %>
                                        <option><%= resultset.getString(1)%></option>
                                        <%
                                            } %>
                                    </optgroup>
                                </select>

                                <%
                                    pstmt.close();
                                    connection.close();
                                } catch (Exception e) {

                                %>
                                <script>
                                    alert("Error: " + e.toString());
                                </script>

                                <%                                }
                                %>
                                <br/><br/>
                            </label>   
                                


                                <b>&#42; Recordar que ahora si se deja el campo "Monto Entrada" en blanco tomará el mismo de "Monto Salida"</b>

                                <br/><br/>

                                <input class="submit" type="submit" name="btnTrans" value="Procesar" />


                            </label>

                            <!--
                            
                                                        <script type="text/javascript">
                                                            function fnc()
                                                            {
                                                                console.log("entro");
                            
                                                                var selectV = document.getElementById("cmbBancoTrans");
                                                                var select = document.getElementById("cmbCuentaTrans");
                                                                var opt = document.createElement("option");
                                                                var length = select.options.length;
                                                                select.addEventListener("keyup", function(e) {
                                                                    if (e.target.value.length !== 1) {
                                                                        for (i = 0; i < length; i++) {
                                                                            select.options[i] = null;
                                                                        }
                                                                        opt.value = "";
                                                                        select.appendChild(opt);
                                                                    }
                                                                });
                            
                                                                var statement = null;
                                                                var connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192/BD_STT_Finanzas", "adminstt@mocha6005.mochahost.com", "adminstt@mocha6005.mochahost.com");
                                                                statement = connection.prepareCall("{call bancos_mostrar(?)}");
                                                                statement.setString(1, selectV.value);
                            
                                                                statement.execute();
                                                                var resultset = statement.getResultSet();
                            
                                                                while (resultset.next()) {
                                                                    opt.value = resultset.getString(1);
                                                                    select.appendChild(opt);
                            
                                                                }
                            
                                                            }
                            
                            
                            
                                                        </script>
                            -->
                        </div>
                    </form>
                </div>
            </div>

            <script type = "text/javascript" src = "js/jquery.tablescroll.js" ></script>

            <div id="scroll">
                <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
            </div>
        </div>

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






        <footer>
            <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
            <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
        </footer>
    </body>
</html>
