<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String valor = "0";
    String rol = "0";
    String error = "0";
    
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
        <title>Divisas - SIT STT</title>
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
                                    <li><a style="background-color:lightgrey" href="divisas.jsp">Divisas</a></li>
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
                                <input class="myDate" type="text" name="txtFechaDivisa"/>

                                <br/><br/>
                            </label>
                            <label>
                                <span>Monto Origen&nbsp;&nbsp;</span>
                                <input type="text"  onchange="fnc()" id="txtMontoDivisa" name="txtMontoDivisa" /><br/><br/>
                            </label>  
                            <label> <span>Tipo de cambio</span>
                                <select onchange="fnc()"  id="cmbTipoDivisa" name="cmbTipoDivisa">
                                    <option value="1">Local a Dolares</option>
                                    <option value="2">Dolares a Local</option>
                                </select>
                            </label><br/><br/>
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
                                <select id="id" name="cmbDivisaCuentaOrigen">
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
                                <br/><br/>
                            </label>
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
                                <select id="id" name="cmbDivisaCuentaDestino">
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
                                <br/><br/>
                            </label>

                            <div class="accordion">
                                <div class="accordion-section">
                                    <a class="accordion-section-title" href="#accordion-1"><label name="txtCambioUno" id="txtCambioUno">Banco Uno</label></a>

                                    <div id="accordion-1" class="accordion-section-content">


                                        <label>
                                            <span>Nombre&nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultset = statement.executeQuery("select * from AA_BANCO");

                                            %>
                                            <select id="cmbBUno" name="cmbBUno" onchange="fnc()">
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
                                            <br/><br/>
                                        </label>
                                        <label>
                                            <span>Tipo de cambio&nbsp;&nbsp;</span>
                                            <input type="text" id="txtDivisaTipoUno" name="txtDivisaTipoUno" onchange="fnc()" /><br/><br/>
                                        </label>  
                                        <br/><br/>
                                    </div><!--end .accordion-section-content-->
                                </div><!--end .accordion-section-->
                            </div><!--end .accordion-->




                            <div class="accordion">
                                <div class="accordion-section">
                                    <a class="accordion-section-title" href="#accordion-2"><label id="txtCambioDos" name="txtCambioDos">Banco Dos</label></a>

                                    <div id="accordion-2" class="accordion-section-content">

                                        <label>
                                            <span>Nombre&nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultset = statement.executeQuery("select * from AA_BANCO");

                                            %>
                                            <select id="cmbBDos" name="cmbBDos" onchange="fnc()">
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
                                            <br/><br/>
                                        </label>
                                        <label>
                                            <span>Tipo de cambio&nbsp;&nbsp;</span>
                                            <input type="text" id="txtDivisaTipoDos" name="txtDivisaTipoDos" onchange="fnc()" /><br/><br/>
                                        </label>  
                                        <br/><br/>
                                    </div><!--end .accordion-section-content-->
                                </div><!--end .accordion-section-->
                            </div><!--end .accordion-->





                            <div class="accordion">
                                <div class="accordion-section">
                                    <a class="accordion-section-title" href="#accordion-3"><label id="txtCambioTres" name="txtCambioTres">Banco Tres</label></a>

                                    <div id="accordion-3" class="accordion-section-content">

                                        <label>
                                            <span>Nombre&nbsp;&nbsp;</span>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultset = statement.executeQuery("select * from AA_BANCO");

                                            %>
                                            <select id="cmbBTres" name="cmbBTres" onchange="fnc()">
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
                                            <br/><br/>
                                        </label>
                                        <label>
                                            <span>Tipo de cambio&nbsp;&nbsp;</span>
                                            <input type="text" id="txtDivisaTipoTres" name="txtDivisaTipoTres" onchange="fnc()" /><br/><br/>
                                        </label>  

                                    </div><!--end .accordion-section-content-->
                                </div><!--end .accordion-section-->
                            </div><!--end .accordion-->


                            <br/><br/>
                            <label>
                                <span>Banco Elegido&nbsp;&nbsp;</span>
                                <select onchange="fnc()" id="cmbDivisaBancoElegido" name="cmbDivisaBancoElegido">

                                    <option disabled selected> </option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>

                                </select>
                                <label id="bancoElegido"></label>
                                <br/><br/>
                                <br/><br/>
                                <br/><br/>
                                <br/><br/>
                            </label>

                            <input type="hidden" name="tempUno" id="tempUno" />
                            <input type="hidden" name="tempDos" id="tempDos" />
                            <input type="hidden" name="tempTres" id="tempTres" />
                            <script type="text/javascript">
                                function fnc()
                                {
                                                var dop = document.getElementById("cmbTipoDivisa").value;
                                        var dop2 = document.getElementById("cmbDivisaBancoElegido").value;
                                    var bancoUno = document.getElementById("cmbBUno").value;
                                        var bancoDos = document.getElementById("cmbBDos").value;
                                    var bancoTres = document.getElementById("cmbBTres").value;

                                                if (dop == 1) {

                                        document.getElementById("txtCambioUno").innerHTML = bancoUno + " Monto Recibido: " +
                                                ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoUno").value));
                                                document.getElementById("tempUno").setAttribute('value', ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoUno").value)));
                                        document.getElementById("txtCambioDos").innerHTML = bancoDos + " Monto Recibido: " +
                                                ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoDos").value));
                                                document.getElementById("tempDos").value = ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoDos").value));
                                        document.getElementById("txtCambioTres").innerHTML = bancoTres + " Monto Recibido: " +
                                        ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoTres").value));
                                                document.getElementById("tempTres").value = ((document.getElementById("txtMontoDivisa").value) / (document.getElementById("txtDivisaTipoTres").value));
                                    } else {
                                        document.getElementById("txtCambioUno").innerHTML = bancoUno + " Monto Recibido: " +
                                                ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoUno").value));
                                                document.getElementById("tempUno").value = ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoUno").value));
                                        document.getElementById("txtCambioDos").innerHTML = bancoDos + " Monto Recibido: " +
                                                ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoDos").value));
                                        document.getElementById("tempDos").value = ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoDos").value));
                                        document.getElementById("txtCambioTres").innerHTML = bancoTres + " Monto Recibido: " +
                                        ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoTres").value));
                                document.getElementById("tempTres").value = ((document.getElementById("txtMontoDivisa").value) * (document.getElementById("txtDivisaTipoTres").value));
                                    }
                                    if (dop2 == 1) {
                                        document.getElementById("bancoElegido").innerHTML = bancoUno.toString();
                                    } else if (dop2 == 2) {
                                        document.getElementById("bancoElegido").innerHTML = bancoDos;
                                    } else if (dop2 == 3) {
                                        document.getElementById("bancoElegido").innerHTML = bancoTres;
                                    }
                                }


                            </script>


                            <p >
                                <a href = "ingresos.jsp" >
                                    <p style = "padding-top: 10px" >
                                        <input class = "submit" type = "submit" name = "btnDivisaGuardar"  value = "Guardar" />
                                    </p>
                                </a>

                        </div>
                    </form>
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
