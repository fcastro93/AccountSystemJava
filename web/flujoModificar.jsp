<%@page import="java.sql.PreparedStatement"%>
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
    if (valor.equals("0")) {
        response.sendRedirect("log.jsp");
    } 
    if (razon.equals("0")) {
        razon = "Todos";
    }
%>
<html>

    <head>
        <title>Flujo - SIT STT</title>
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
            $(document).ready(function() {

                var myCounter = 1;
                $(".myDate").datepicker();

                $("#moreDates").click(function() {

                    $('.myTemplate')
                            .clone()
                            .removeClass("myTemplate")
                            .addClass("additionalDate")
                            .show()
                            .appendTo('#importantDates');

                    myCounter++;
                    $('.additionalDate input[name=inputDate]').each(function(index) {
                        $(this).addClass("myDate");
                        $(this).attr("name", $(this).attr("name") + myCounter);
                    });

                    $(".myDate").on('focus', function() {
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


        <script>
            $(document).ready(function() {
                $("#txtModIngreso").change(function() {
                    var value = $(this).val();
                    $.get("data.jsp", {q: value}, function(data) {
                        $("#txtModConceptoIng").html(data);
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

                            <label><span>ID Interno del Flujo &nbsp;&nbsp;</span>
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        Statement statement = connection.createStatement();
                                        ResultSet resultset = statement.executeQuery("select * from AA_FLUJO");
                                %>
                                <select id="txtModIngreso" name="txtModIngreso">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(1)%></option>
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
                                <span>Concepto &nbsp;&nbsp;</span>
                                <input value="" type="text" name="txtModConceptoIng" id="txtModConceptoIng"/>
                            </label><br/><br/>
                            <label>
                                <span>Fecha: &nbsp;&nbsp;</span>
                                <input class="myDate" type="text" name="txtModFechaIng"/>
                                <br/><br/>
                            </label>
                            <label>
                                <span>Cuenta &nbsp;&nbsp;</span>

                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                        String sql = "SELECT CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO = (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD = ?);";
                                        PreparedStatement pstmt = connection.prepareStatement(sql);
                                        pstmt.setString(1, razon);
                                        ResultSet resultset = pstmt.executeQuery();
                                %>
                                <select id="id" name="txtModCuentaIng">
                                    <option disabled selected> </option>
                                    <%  while (resultset.next()) {%>
                                    <option><%= resultset.getString(1)%></option>
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

                            <span>Monto </span>
                            <input value="" type="text" name="txtModMontoIng" />
                            </label><br/><br/>
                            <label>Pasar a Real/Estimado</label>
                            <input type="checkbox" id="chbPasarReal" name="chbPasarReal" /><br/><br/>
                            <label>Eliminar</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="chbEliminarFlujo" name="chbEliminarFlujo" /><br/><br/>
                            <p><a><input class="submit" type="submit" name="btnModFlujo"  value="Guardar"/></a></p><br/><br/>

                            <h5>*Recordar: Si van a eliminar un flujo estimado, colocar cero en el monto*</h5>
                        </div>
                    </form>
                </div>
            </div>

            <script type="text/javascript" src="js/jquery.tablescroll.js"></script>



            <div id="scroll">
                <a title="Scroll to the top" class="top" href="#"><img src="images/top.png" alt="top" /></a>
            </div>
        </div>
        

    <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
    <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
    <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $('ul.sf-menu').sooperfish();
                                                        $('.top').click(function() {
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
