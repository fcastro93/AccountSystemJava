<%@page import="java.sql.PreparedStatement"%>
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
    String razon = "error";
    String usuario = "0";
    int uno = 0;
    int dos = 0;

    int payroll = 0;
    try {
        for (Cookie c : cookies) {
            if (c.getName().equals("validado") && uno == 0) {
                valor = c.getValue();
                uno = 1;
            }
            if (c.getName().equals("rol")) {
                rol = c.getValue();
            }
            if (c.getName().equals("razon") && dos == 0) {
                razon = c.getValue();
                dos = 1;
            }
            if (c.getName().equals("usuario")) {
                usuario = c.getValue();
            }
        }
    } catch (Exception e) {

    }
    if (valor.equals("0")) {
        response.sendRedirect("log.jsp");
    }
    try {
        if (razon.equals("error")) {
            System.out.println("1");
            response.sendRedirect("index.jsp");
        }
    }catch(Exception e){
        System.out.println("2:"+e.toString());
        response.sendRedirect("logout.jsp");
    }

    if (razon.equals("0")) {
        razon = "Todos";
    }

%>
<html>

    <head>
        <title>Bancos - SIT STT</title>

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
        <%            ResultSet resultset = null;
        %>
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
                            <li><a style="background-color:lightgrey" href="index.jsp">Bancos</a></li>
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
                <div class="content" style="padding: 14px 0 0 50px;">

                    <div class="form_settings">

                        <form action="GestorLogica" method="post">
                            <br><br>
                            <H1>Razón Social: </H1>

                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/databaseName?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                    String sql = "call mostrarListarRazon(?)";
                                    PreparedStatement pstmt = connection.prepareStatement(sql);
                                    pstmt.setString(1, usuario);
                                    resultset = pstmt.executeQuery();


                            %>
                            <select id="id" name="cmbUsuarioBeneficiarioDos">
                                <optgroup label="Seleccionada">
                                    <option> <%=razon%> </option>
                                </optgroup>
                                <optgroup label="Otras opciones">
                                    
                                    <% 
                                        while (resultset.next()) {
                                            if (!razon.equals(resultset.getString(1))) {%>
                                    <option><%= resultset.getString(1)%></option>
                                    <% }
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

                            </label>   
                            <br><br>

                            <input class="submit" style="margin: 0 0 0 0px" type="submit" name="btnUsuarioBeneficiarioGuardarDos"  value="Aceptar"/>

                            <br><br>

                            <h1>Fecha:  </h1><input class="myDate"  type="text" name="txtFechaBancos" value="" /><br/><br/>


                            <input class="submit" type="submit" style="margin: 0 0 0 0px" name="btnBancosFechaTipo"  value="Buscar"/>
                            <input class="submit" type="submit" style="margin: 0 0 0 0px" name="btnBancoIngreso"  value="Agregar Ingreso"/>
                            <input class="submit" type="submit" style="margin: 0 0 0 0px" name="btnBancoEgreso"  value="Agregar Egreso"/>

                            <br/><br/>
                            <div id="main-wrap" style="width: 1000px">
                                <div id="sidebar">  


                                    <%
                                        double dolarizacion = 0;
                                        double dolarizacionExc = 0;
                                        double dolaresTotal = 0;
                                        double localTotal = 0;
                                        double localTotalExc = 0;
                                        double dolaresPayroll = 0;
                                        double localPayroll = 0;
                                        double localPayrollExc = 0;
                                        int flag = 0;
                                        String venta = "";
                                        String compra = "";
                                        double monto = 0;
                                        CallableStatement statement = null;
                                        DecimalFormat df = new DecimalFormat("#,###.##");
                                        df.setRoundingMode(RoundingMode.DOWN);
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/"
                                                + "databaseName?noAccessToProcedureBodies=true", "adminstt_rol_con", "zAqwsx12");

                                        Date date = new Date();
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                                        String fecha = sdf.format(date);
                                        if (request.getParameter("fechaNueva") != null && !request.getParameter("fechaNueva").equals("")) {
                                            fecha = request.getParameter("fechaNueva");

                                            statement = connection.prepareCall("{call bancos_mostrar_historial(?,?,?)}");
                                            statement.setString(1, fecha);
                                            statement.setString(2, usuario);
                                            statement.setString(3, razon);

                                        } else if (razon.equals("Todos")) {
                                            fecha = sdf.format(date);

                                            statement = connection.prepareCall("{call bancos_mostrar(?,?,?)}");

                                            statement.setString(1, fecha);
                                            statement.setString(2, usuario);
                                            statement.setString(3, razon);

                                        } else {
                                            //traer fecha
                                            statement = connection.prepareCall("{call traer_fecha(?)}");
                                            statement.setString(1, razon);
                                            statement.execute();
                                            resultset = statement.getResultSet();
                                            resultset.next();
                                            fecha = resultset.getString(1);

                                            statement = connection.prepareCall("{call bancos_mostrar(?,?,?)}");
                                            statement.setString(1, fecha);
                                            statement.setString(2, usuario);
                                            statement.setString(3, razon);

                                        }

                                        /*
                                         if (request.getParameter("entidad") != null) {
                                         if (!request.getParameter("entidad").equals("")) {
                                         sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO= (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD= '" + request.getParameter("entidad") + "'))";
                                         }
                                         } else if (request.getParameter("lugar") != null) {
                                         if (!request.getParameter("lugar").equals("")) {
                                         sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE ID_LUGAR= (SELECT ID_LUGAR FROM AA_LUGAR WHERE NOMBRE= '" + request.getParameter("lugar") + "'))";
                                         }
                                         } else if (request.getParameter("tipo") != null) {
                                         if (!request.getParameter("tipo").equals("")) {
                                         sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA_ESPECIAL= " + request.getParameter("tipo") + ")";
                                         }
                                         }
                                         */
                                        boolean hadResults = statement.execute();
                                        resultset = statement.getResultSet();

                                    %>



                                    <h2>Fecha de busqueda: 

                                        <%                                            if (request.getParameter("fechaNueva") != null && !request.getParameter("fechaNueva").equals("")) {
                                                String arreglo;
                                                arreglo = request.getParameter("fechaNueva").replace("00:00:00.0", "");
                                        %>
                                        <%= arreglo%>       
                                        <%
                                        } else {
                                            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                                            Calendar cal = Calendar.getInstance();
                                        %>
                                        <%//= dateFormat.format(cal.getTime())
                                            String arreglo;
                                            arreglo = fecha.replace("00:00:00.0", "");
                                        %>
                                        <%= arreglo%>
                                        <%
                                            }
                                        %>



                                    </h2>

                                    <h2>Saldo Inicial</h2>

                                    <table style="width:100%; border-spacing:0;">
                                        <tr><th>Banco</th><th>Cuenta</th><th>Local</th><th>Dolares</th></tr>


                                        <%
                                            while (resultset.next()) {
                                                venta = resultset.getString(9);
                                                compra = resultset.getString(10);

                                        %>
                                        <tr>
                                            <td>
                                                <%= resultset.getString(1)%>
                                            </td>
                                            <td>
                                                <%= resultset.getString(2)%> 
                                                <%
                                                    if (resultset.getString(8) != null) {
                                                        if (resultset.getString(8).equals("2")) {
                                                %>
                                                <hr/>
                                                Cuenta Seca
                                                <%
                                                } else if (resultset.getString(8).equals("5")) {
                                                %>
                                                <hr/>
                                                Credicheques
                                                <%
                                                } else if (resultset.getString(8).equals("6")) {
                                                    payroll = 1;

                                                %>
                                                <hr/>
                                                Payroll
                                                <%                                                } else if (resultset.getString(8).equals("4")) {
                                                %>
                                                <hr/>
                                                Operativa
                                                <%
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <%
                                                if (resultset.getString(6).equals("1") || resultset.getString(6).equals("3")) {
                                            %>
                                            <td>
                                                <%= df.format(Double.parseDouble(resultset.getString(3)))%>
                                            </td>
                                            <td>
                                            </td>
                                            <%
                                            } else {
                                            %>
                                            <td>
                                            </td>
                                            <td>
                                                <%= df.format(Double.parseDouble(resultset.getString(3)))%>
                                            </td>
                                            <%
                                                }

                                                monto = Double.parseDouble(resultset.getString(3));
                                                if (!razon.equals("Todos")) {
                                                    dolarizacion = Double.parseDouble(resultset.getString(9));
                                                }
                                                if (resultset.getString(6).equals("1") && !resultset.getString(7).equals("1") && resultset.getString(11).equals("0")) {

                                                    localTotal += monto;
                                                    localTotal = Math.round(localTotal * 100);
                                                    localTotal = localTotal / 100;

                                                }
                                                if (resultset.getString(6).equals("3") && !resultset.getString(7).equals("1") && resultset.getString(11).equals("1")) {

                                                    localTotalExc += monto;
                                                    localTotalExc = Math.round(localTotalExc * 100);
                                                    localTotalExc = localTotalExc / 100;
                                                    flag = 1;

                                                } else if (resultset.getString(6).equals("2") && !resultset.getString(7).equals("1") && !resultset.getString(7).equals("1")) {
                                                    dolaresTotal += monto;
                                                    dolaresTotal = Math.round(dolaresTotal * 100);
                                                    dolaresTotal = dolaresTotal / 100;
                                                }
                                                //payroll
                                                if (resultset.getString(6).equals("1") && resultset.getString(7).equals("1") && resultset.getString(11).equals("0")) {

                                                    if (resultset.getString(8).equals("6")) {
                                                        localPayroll += monto;
                                                        localPayroll = Math.round(localPayroll * 100);
                                                        localPayroll = localPayroll / 100;
                                                    }
                                                }
                                                if (resultset.getString(6).equals("1") && resultset.getString(7).equals("1") && resultset.getString(11).equals("1")) {

                                                    if (resultset.getString(8).equals("6")) {
                                                        localPayrollExc += monto;
                                                        localPayrollExc = Math.round(localPayrollExc * 100);
                                                        localPayrollExc = localPayrollExc / 100;
                                                    }
                                                } else if (resultset.getString(6).equals("2") && resultset.getString(7).equals("1")) {

                                                    if (resultset.getString(8).equals("6")) {
                                                        dolaresPayroll += monto;
                                                        dolaresPayroll = Math.round(dolaresPayroll * 100);
                                                        dolaresPayroll = dolaresPayroll / 100;
                                                    }
                                                }


                                            %>
                                        </tr>
                                        <%                                            }

                                        %>

                                        <!--<form name="submitForm" method="POST" action="/servlet/ServletName">
                                          
                                            <A HREF="javascript:document.submitForm.submit()">Click Me</A>
                                        </form>-->

                                        </tr>




                                    </table>
                                    <h1>Totales</h1>
                                    <h2>Dolares: $<%=df.format(dolaresTotal)%>  </h2>

                                    <%
                                        if (localTotalExc != 0) {
                                            dolarizacionExc = dolarizacion * localTotalExc;
                                        }
                                        if (flag == 1) {
                                            dolarizacion = localTotal * dolarizacion;
                                        } else {
                                            dolarizacion = localTotal / dolarizacion;
                                        }
                                        dolarizacion = dolarizacion + dolaresTotal + dolarizacionExc;
                                        localTotal = localTotal + localTotalExc;
                                        if (!razon.equals("Todos")) {%>
                                    <h2>Local: <%=df.format((localTotal))%>  </h2>
                                    <h2>Totalidad en dolares: $<%=df.format(dolarizacion)%> </h2>

                                    <% }
                                        if (payroll == 1) {

                                    %>
                                    <br>
                                    <h1>Total de Payroll</h1>
                                    <h2>Dolares: $<%=df.format(dolaresPayroll)%>  </h2>
                                    <h2>Local: <%=df.format(localPayroll)%>  </h2>

                                    <%
                                        }

                                        if (!razon.equals("Todos")) {
                                    %>
                                    ----------------------------------------------------------------------------------------------------
                                    <h2>Fondos de Inversión Activos</h2>

                                    <%
                                        CallableStatement statementFondos = null;
                                        statementFondos = connection.prepareCall("{call fondosBancos(?)}");
                                        statementFondos.setString(1, razon);
                                        statementFondos.execute();
                                        ResultSet resultsetFondos = null;
                                        resultsetFondos = statementFondos.getResultSet();
                                        resultsetFondos.next();
                                        double fondosLocal = Double.parseDouble(resultsetFondos.getString(1));
                                        double fondosDolares = Double.parseDouble(resultsetFondos.getString(2));
                                        double sumatoriaFondos = fondosLocal / Double.parseDouble(venta);
                                        sumatoriaFondos += fondosDolares;

                                    %>
                                    <h2>Dolares: $<%= df.format(fondosDolares)%>  </h2>
                                    <h2>Local: <%= df.format(fondosLocal)%>  </h2>
                                    <h2>Sumatoria en Dolares: $<%= df.format(sumatoriaFondos)%>     </h2>
                                    ----------------------------------------------------------------------------------------------------
                                    <h2>Tipo de Cambio:</h2>
                                    <h3>Precio de compra: <%= compra%></h3>
                                    <h3>Precio de venta: <%= venta%></h3>
                                    <%
                                        }

                                    %>



                                </div>
                                <br/><br/><br/><br/>
                                <div id="content-wrap">
                                    <div style="double:left; width:80%; margin-left:10px;">

                                        <h2>Saldo Final</h2>
                                        <table style="width:100%; border-spacing:0;">
                                            <tr><th>Cuenta</th><th>Local</th><th>Dolares</th><th>Estado</th></tr>


                                            <%                                                dolarizacion = 0;
                                                dolaresTotal = 0;
                                                localTotal = 0;
                                                String estado;
                                                dolaresPayroll = 0;
                                                localPayroll = 0;
                                                localTotalExc = 0;
                                                flag = 0;

                                                if (request.getParameter(
                                                        "fechaNueva") != null) {
                                                    if (!request.getParameter("fechaNueva").equals("")) {
                                                        fecha = request.getParameter("fechaNueva");
                                                    }
                                                }
                                                /*
                                                 String sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "'";
                                                 if (request.getParameter("entidad") != null) {
                                                 if (!request.getParameter("entidad").equals("")) {
                                                 sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE ID_BENEFICIARIO= (SELECT ID_BENEFICIARIO FROM AA_BENEFICIARIO WHERE NOMBRE_ENTIDAD= '" + request.getParameter("entidad") + "'))";
                                                 }
                                                 } else if (request.getParameter("lugar") != null) {
                                                 if (!request.getParameter("lugar").equals("")) {
                                                 sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE ID_LUGAR= (SELECT ID_LUGAR FROM AA_LUGAR WHERE NOMBRE= '" + request.getParameter("lugar") + "'))";
                                                 }
                                                 } else if (request.getParameter("tipo") != null) {
                                                 if (!request.getParameter("tipo").equals("")) {
                                                 sentencia = "select * from AA_BANCO_ESTADO where date(FECHA)='" + fecha + "' AND ID_CUENTA= (SELECT ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA_ESPECIAL= " + request.getParameter("tipo") + ")";
                                                 }
                                                 }*/

                                                hadResults = statement.execute();
                                                resultset = statement.getResultSet();

                                                while (resultset.next()) {

                                            %>
                                            <tr>

                                                <td>
                                                    <%= resultset.getString(2)%>
                                                    <%
                                                        if (resultset.getString(8) != null) {
                                                            if (resultset.getString(8).equals("2")) {
                                                    %>
                                                    <hr/>
                                                    Cuenta Seca
                                                    <%
                                                    } else if (resultset.getString(8).equals("5")) {
                                                    %>
                                                    <hr/>
                                                    Credicheques
                                                    <%
                                                    } else if (resultset.getString(8).equals("6")) {

                                                    %>
                                                    <hr/>
                                                    Payroll
                                                    <%                                                    } else if (resultset.getString(8).equals("4")) {
                                                    %>
                                                    <hr/>
                                                    Operativa
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </td>
                                                <%
                                                    if (resultset.getString(6).equals("1") || resultset.getString(6).equals("3")) {
                                                %>
                                                <td>
                                                    <%= df.format(Double.parseDouble(resultset.getString(4)))%>
                                                </td>
                                                <td>
                                                </td>
                                                <%
                                                } else {
                                                %>
                                                <td>
                                                </td>
                                                <td>
                                                    <%= df.format(Double.parseDouble(resultset.getString(4)))%>
                                                </td>
                                                <%
                                                    }

                                                    if (resultset.getString(5).equals("1")) {
                                                %>
                                                <td>
                                                    Cerrado
                                                </td>
                                                <%
                                                } else {
                                                %>
                                                <td>
                                                    Abierto
                                                </td>
                                                <%
                                                    }
                                                    monto = Double.parseDouble(resultset.getString(4));
                                                    if (!razon.equals("Todos")) {
                                                        dolarizacion = Double.parseDouble(resultset.getString(9));
                                                    }
                                                    if (resultset.getString(6).equals("1") && !resultset.getString(7).equals("1") && resultset.getString(11).equals("0")) {

                                                        localTotal += monto;
                                                        localTotal = Math.round(localTotal * 100);
                                                        localTotal = localTotal / 100;

                                                    }
                                                    if (resultset.getString(6).equals("3") && !resultset.getString(7).equals("1") && resultset.getString(11).equals("1")) {

                                                        localTotalExc += monto;
                                                        localTotalExc = Math.round(localTotalExc * 100);
                                                        localTotalExc = localTotalExc / 100;
                                                        flag = 1;

                                                    } else if (resultset.getString(6).equals("2") && !resultset.getString(7).equals("1") && !resultset.getString(7).equals("1")) {
                                                        dolaresTotal += monto;
                                                        dolaresTotal = Math.round(dolaresTotal * 100);
                                                        dolaresTotal = dolaresTotal / 100;
                                                    }
                                                    //payroll
                                                    if (resultset.getString(6).equals("1") && resultset.getString(7).equals("1") && resultset.getString(11).equals("0")) {

                                                        if (resultset.getString(8).equals("6")) {
                                                            localPayroll += monto;
                                                            localPayroll = Math.round(localPayroll * 100);
                                                            localPayroll = localPayroll / 100;
                                                        }
                                                    }
                                                    if (resultset.getString(6).equals("1") && resultset.getString(7).equals("1") && resultset.getString(11).equals("1")) {

                                                        if (resultset.getString(8).equals("6")) {
                                                            localPayrollExc += monto;
                                                            localPayrollExc = Math.round(localPayrollExc * 100);
                                                            localPayrollExc = localPayrollExc / 100;
                                                        }
                                                    } else if (resultset.getString(6).equals("2") && resultset.getString(7).equals("1")) {

                                                        if (resultset.getString(8).equals("6")) {
                                                            dolaresPayroll += monto;
                                                            dolaresPayroll = Math.round(dolaresPayroll * 100);
                                                            dolaresPayroll = dolaresPayroll / 100;
                                                        }
                                                    }
                                                %>
                                            </tr>

                                            <!--<form name="submitForm" method="POST" action="/servlet/ServletName">
                                              
                                                <A HREF="javascript:document.submitForm.submit()">Click Me</A>
                                            </form>-->

                                            <%                                                }

                                                resultset.close();

                                                statement.close();

                                                connection.close();
                                            %>

                                        </table>
                                        <h1>Totales</h1>
                                        <h2>Dolares: $<%=df.format(dolaresTotal)%>  </h2>

                                        <%
                                            if (localTotalExc != 0) {
                                                dolarizacionExc = dolarizacion * localTotalExc;
                                            }
                                            if (flag == 1) {
                                                dolarizacion = localTotal * dolarizacion;
                                            } else {
                                                dolarizacion = localTotal / dolarizacion;
                                            }
                                            dolarizacion = dolarizacion + dolaresTotal + dolarizacionExc;
                                            localTotal = localTotal + localTotalExc;
                                            if (!razon.equals("Todos")) {%>
                                        <h2>Local: <%=df.format(localTotal)%>  </h2>
                                        <h2>Totalidad en dolares: $<%=df.format(dolarizacion)%> </h2>
                                        <br><br>

                                        <% }
                                            if (payroll == 1) {

                                        %>

                                        <h1>Total de Payroll</h1>
                                        <h2>Dolares: $<%=df.format(dolaresPayroll)%>  </h2>
                                        <h2>Local: <%=df.format(localPayroll)%>  </h2>

                                        <%
                                            }
                                        %>


                                    </div>
                                </div>
                            </div>
                            <div>
                                <div>
                                    <br/><br/><br/><br/><br/>

                                </div>
                            </div>

                        </form>
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
