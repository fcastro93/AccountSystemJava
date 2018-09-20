<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String valor = "0";
    String rol = "0";
    String razon = "0";

    DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
    Date date = new Date();

    String desde = "vacio";
    String hasta = "vacio";
    String cuenta = "vacio";

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
            if (c.getName().equals("desde")) {
                desde = c.getValue();
            }
            if (c.getName().equals("hasta")) {
                hasta = c.getValue();
            }
            if (c.getName().equals("cuenta")) {
                cuenta = c.getValue();
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
        <title>Egresos - SIT STT</title>
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
                                    <li><a style="background-color:lightgrey" href="egresos.jsp">Egresos</a></li>
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
                <div class="content" style="padding: 14px 0 0 50px;">

                    <div class="form_settings">

                        <form action="GestorLogica" method="post">

                            <input class="submit" type="submit" name="btnEgresoPanel" value="Agregar" />


                            <input class="submit" type="submit" name="btnModEntrada" value="Modificar" />

                            <div id="main-wrap" style="width: 1000px">

                                <div id="sidebar">  
                                    <%
                                        if (desde.equals("vacio")) {
                                    %>
                                    <label>
                                        <span>Desde: &nbsp;&nbsp;</span>
                                        <input class="myDate" type="text" name="txtEgresoDesde"/>

                                        <br/><br/>
                                    </label>
                                    <%
                                    } else {
                                    %>
                                    <label>
                                        <span>Desde: &nbsp;&nbsp;</span>
                                        <input class="myDate" type="text" value="<%=desde%>" name="txtEgresoDesde"/>

                                        <br/><br/>
                                    </label>
                                    <%
                                        }

                                    %>

                                    <label>
                                        <span>Cuenta Corriente&nbsp;&nbsp;</span>
                                        <%                                    try {
                                                String bancoFlag = "";
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                String sql = "call llevarCuentaBanco(?)";
                                                PreparedStatement pstmt = connection.prepareStatement(sql);
                                                pstmt.setString(1, razon);
                                                ResultSet resultset = pstmt.executeQuery();
                                        %>
                                        <select id="id" name="cmbFiltroCuentaEgreso">
                                            <option selected>Todos</option>
                                            <%  while (resultset.next()) {%>
                                            <%
                                                if (!bancoFlag.equals(resultset.getString(2))) {
                                                    bancoFlag = resultset.getString(2);
                                            %>
                                            </optgroup>
                                            <optgroup label="<%= resultset.getString(2)%>">
                                                <option>   <%= resultset.getString(1)%></option>
                                                <%
                                                } else {
                                                %>
                                                <option><%= resultset.getString(1)%></option>
                                                <%
                                                    }
                                                %>

                                                <% } %>

                                            </optgroup>
                                        </select>

                                        <%
                                        } catch (Exception e) {

                                        %>
                                        <script>
                                            alert("Error: " + e.toString());
                                        </script>

                                        <%                                }
                                        %>
                                        <br/><br/>
                                    </label>


                                    <h2>Egresos Reales</h2>
                                    <div STYLE = " height: 400px; width: 400px; font-size: 12px; overflow: auto;"> 
                                        <table style = "width:100%; border-spacing:0;"> <tr> <th> ID Interno</th > <th>Fecha</th > <th>Cuenta</th > <th>Concepto</th > <th>Monto</th > </tr> 
                                                    <% int totalColonesReales = 0;
                                                        int totalDolaresReales = 0;
                                                        DecimalFormat df = new DecimalFormat("#,###.##");

                                                        df.setRoundingMode(RoundingMode.DOWN);

                                                        try {
                                                            CallableStatement statement = null;
                                                            df.setRoundingMode(RoundingMode.DOWN);
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                                                                    + "adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_con", "zAqwsx12");
                                                            if (!desde.equals("vacio")) {
                                                                DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                                                                date = formatter.parse(desde.toString());
                                                                statement = connection.prepareCall("{call mostrarEgresosRealesFiltro(?,?,?,?)}");
                                                                statement.setString(1, razon);

                                                                statement.setDate(2, new java.sql.Date(date.getTime()));
                                                                date = formatter.parse((hasta.toString()));
                                                                statement.setDate(3, new java.sql.Date(date.getTime()));
                                                                statement.setString(4, cuenta);

                                                            } else {

                                                                statement = connection.prepareCall("{call mostrarEgresosReales(?)}");
                                                                statement.setString(1, razon);
                                                            }
                                                            boolean hadResults = statement.execute();
                                                            ResultSet resultset = statement.getResultSet();
                                                            while (resultset.next()) {
                                                    %>
                                            <tr>
                                                <td class="rowID"><%= resultset.getString(1)%></td>
                                                <%
                                                    Statement statement2 = connection.createStatement();
                                                    ResultSet resultset2 = statement2.executeQuery("select * from AA_BANCO_CUENTA where ID_CUENTA = " + resultset.getString(6));

                                                    resultset2.next();
                                                    dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                                    Calendar cal = Calendar.getInstance();
                                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                                                    cal.setTime(sdf.parse(resultset.getString(3)));// all done
%>
                                                <td class="rowDolares"><%= dateFormat.format(cal.getTime())%></td>
                                                <td class="rowConcepto"><%= resultset2.getString(3)%></td>
                                                <td class="rowDolares"><%= resultset.getString(4)%></td>
                                                <td class="rowColones"><%= df.format(Double.parseDouble(resultset.getString(2)))%></td>
                                                <!--<form name="submitForm" method="POST" action="/servlet/ServletName">
            
                                                    <A HREF="javascript:document.submitForm.submit()">Click Me</A>
                                                </form>-->

                                            </tr>
                                            <% }

                                                connection.close();
                                            } catch (Exception e) {

                                            %>

                                            <%                                }
                                            %>



                                        </table>
                                    </div>
                                </div>
                                <%
                                    if (hasta.equals("vacio")) {
                                %>
                                <label>
                                    <span>Hasta: &nbsp;&nbsp;</span>
                                    <input class="myDate" type="text" name="txtEgresoHasta"/>
                                    <br/><br/>
                                </label>
                                <input class="submit" type="submit" name="btnEgresoFechaB"  value="Buscar"/>
                                <%
                                } else {
                                %>
                                <label>
                                    <span>Hasta: &nbsp;&nbsp;</span>
                                    <input class="myDate" type="text" value="<%=hasta%>" name="txtEgresoHasta"/>
                                    <br/><br/>
                                </label>

                                <input class="submit" type="submit" name="btnEgresoFechaB"  value="Buscar"/>

                                <%
                                    }

                                %>
                                <div id="content-wrap">
                                    <div style="float:left; width:80%; margin-left:10px;">

                                        <h2>Egresos Estimados</h2>


                                        <div STYLE=" height: 400px; width: 400px; font-size: 12px; overflow: auto;">
                                            <table style="width:100%; border-spacing:0;">
                                                <tr> <th> ID Interno</th > <th>Fecha</th > <th>Cuenta</th > <th>Concepto</th > <th>Monto</th > </tr>


                                                <%                                                try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        CallableStatement statement = null;
                                                        df.setRoundingMode(RoundingMode.DOWN);
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                                                                + "adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_con", "zAqwsx12");
                                                        /*if (!desde.equals("vacio")) {
                                                            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                                                            date = formatter.parse(desde.toString());
                                                            statement = connection.prepareCall("{call mostrarEgresosEstimadosFiltro(?,?,?)}");
                                                            statement.setString(1, razon);

                                                            statement.setDate(2, new java.sql.Date(date.getTime()));
                                                            date = formatter.parse((hasta.toString()));
                                                            statement.setDate(3, new java.sql.Date(date.getTime()));

                                                        } else {*/
                                                        statement = connection.prepareCall("{call mostrarEgresosEstimados(?)}");
                                                        statement.setString(1, razon);
                                                        //}
                                                        boolean hadResults = statement.execute();
                                                        ResultSet resultset = statement.getResultSet();
                                                        while (resultset.next()) {
                                                %>
                                                <tr>
                                                    <td class="rowID"><%= resultset.getString(1)%></td>
                                                    <%
                                                        Statement statement2 = connection.createStatement();
                                                        ResultSet resultset2 = statement2.executeQuery("select * from AA_BANCO_CUENTA where ID_CUENTA = " + resultset.getString(6));

                                                        resultset2.next();
                                                        dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                                        Calendar cal = Calendar.getInstance();
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                                                        cal.setTime(sdf.parse(resultset.getString(3)));// all done
%>
                                                    <td class="rowDolares"><%= dateFormat.format(cal.getTime())%></td>
                                                    <td class="rowConcepto"><%= resultset2.getString(3)%></td>
                                                    <td class="rowDolares"><%= resultset.getString(4)%></td>
                                                    <td class="rowColones"><%= df.format(Double.parseDouble(resultset.getString(2)))%></td>
                                                </tr>
                                                <%

                                                    }
                                                    connection.close();
                                                } catch (Exception e) {
                                                    System.out.println("Error: " + e.toString());
                                                %>

                                                <%                                }
                                                %>



                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div>
                            <div>
                                <br/><br/><br/><br/><br/>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript" src="js/jquery.tablescroll.js"></script>
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

    <script type="text/javascript" src="js/utilitarios.js"></script>

    <footer>
        <p><img src="images/twitter.png" alt="twitter" />&nbsp;<img src="images/facebook.png" alt="facebook" />&nbsp;<img src="images/rss.png" alt="rss" /></p>
        <p><a href="index.jsp">Inicio</a> | <a href="creacionBeneficiaros.jsp">Creación de Beneficiarios</a> | <a href="crearMovimientos.jsp">Creación de Movimientos</a> | <a href="buscadorParametros.jsp">Búsqueda por parámetros</a> | <a href="reporteria.jsp">Creación de Reportería</a>| <a href="logout.jsp">Logout</a></p>            
    </footer>
</body>
</html>
