<%@page import="java.util.Date"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>CSS3_bokeh</title>

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
                $(".myDate").datepicker({dateFormat: 'yy-mm-dd'})

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

    </head>

    <body>
        <%
            ResultSet resultset = null;
        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <h1><a href="index.jsp">Grupo<span class="logo_colour">STT</span></a></h1>
                        <h2>Aplicativo Contable</h2>
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
                                    <li><a href="bancoAgregar.jsp">Incluir Banco</a></li>
                                    <li><a href="cuentaAgregar.jsp">Incluir Cuenta</a></li>
                                    <li><a href="creacionUsuario.jsp">Incluir Usuario</a></li>
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

                                    <li><a style="background-color:lightgrey" href="cierre.jsp">Cierres</a></li>
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
                <div class="content" style="padding: 14px 0 0 50px;">
                    <div class="form_settings">
                        <form action="GestorLogica" method="post">


                            <H2>Hacer cierre del 

                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                                            + "databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                    try {

                                        CallableStatement statement = connection.prepareCall("{call traer_fecha(?)}");
                                        statement.setString(1, razon);
                                        statement.execute();
                                        resultset = statement.getResultSet();
                                        resultset.next();
                                        String arreglo;
                                        arreglo = resultset.getString(1).replace("00:00:00.0", "");
                                %>  

                                
                                <%= arreglo%>

                                <%
                                } catch (Exception e) {
                                %><script>alert("Error: " + e.toString());</script>                              <%
                                    }
                                %>

                            </H2>

                            <input hidden="true" size="50"  type="text" name="selCierreBen" value="<%=razon%>" />
                            <h3>Tipo de cambio</h3>
                            <h4>Compra</h4><input type="text" name="txtCambioCompra" value="" />
                            <h4>Venta</h4><input type="text" name="txtCambioVenta" value="" />
                            <br><br>

                            <input class="submit" type="submit" name="btnCierre" value="Cierre" />



                        </form>
                    </div>
                </div>
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

    <footer>
        <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
        <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
    </footer>
</body>
</html>
