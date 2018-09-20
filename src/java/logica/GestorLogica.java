/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.BaseDatos;
import java.io.IOException;
import static java.lang.System.out;
import java.math.RoundingMode;
import java.sql.SQLException;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GestorLogica")
public class GestorLogica extends HttpServlet {

    BaseDatos baseDatos = new BaseDatos();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String referer = request.getHeader("Referer");
        if (request.getParameter("btnBeneficiarioGuardar") != null) {
            try {
                beneficiarioGuardar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnMovimientoGuardar") != null) {
            try {
                movimientoGuardar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnIngresoGuardar") != null) {
            try {
                ingresosAgregar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnEgresoGuardar") != null) {
            try {
                egresosAgregar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnBancoGuardar") != null) {
            try {
                bancosAgregar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnCuentaGuardar") != null) {
            try {
                cuentaAgregar(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnCierre") != null) {
            try {
                hacerCierre(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnFondoAPGuardar") != null) {
            try {
                guardarFondo(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnFondoLIGuardar") != null) {
            try {
                liquidarFondo(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnDivisaGuardar") != null) {
            try {
                guardarDivisa(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnTrans") != null) {
            try {
                hacerTransferencia(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("invisibleIngreso") != null) {
            try {
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnModBanco") != null) {
            try {
                hacerModBanco(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnModCuenta") != null) {
            try {
                hacerModCuenta(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnModInicial") != null) {
            try {
                hacerModCInicial(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnModFinal") != null) {
            try {
                hacerModFinal(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnModFlujo") != null) {
            try {
                hacerModFlujo(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("signupb") != null) {
            try {
                entrarSesion(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnUsuarioGuardar") != null) {
            try {
                crearUsuario(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnUsuarioBeneficiarioGuardar") != null) {
            try {
                seleccionBeneficiario(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnUsuarioBeneficiarioGuardarDos") != null) {
            try {
                seleccionBeneficiarioDos(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnEgresoFechaB") != null) {
            try {
                egresosFiltro(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnIngresoFechaB") != null) {
            try {
                ingresosFiltro(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnPaisGuardar") != null) {
            try {
                ingresoPais(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnModFondoGuardar") != null) {
            try {
                modFondo(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnPrivilegioAgregar") != null) {
            try {
                agregarPrivilegio(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnPrivilegioQuitar") != null) {
            try {
                quitarPrivilegio(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnModCuentaGuardar") != null) {
            try {
                hacerModCuentaCompleta(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        } else if (request.getParameter("btnCambioTipo") != null) {
            try {
                modTipoCambio(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }

        if (request.getParameter("btnBancosFecha") != null && !request.getParameter("txtFechaBancos").equals("")) {
            if (!request.getParameter("txtBancosListaBen").equals("Todos")) {
                referer = "http://www.sttcsc.com/index.jsp?fechaNueva=" + request.getParameter("txtFechaBancos") + "&entidad=" + request.getParameter("txtBancosListaBen");
            } else {
                referer = "http://www.sttcsc.com/index.jsp?fechaNueva=" + request.getParameter("txtFechaBancos");
            }
        } else if (request.getParameter("btnBancosFecha") != null && request.getParameter("txtFechaBancos").equals("") && !request.getParameter("txtBancosListaBen").equals("Todos")) {
            System.out.println("Base: " + request.getParameter("txtFechaBancos"));

        } else if (request.getParameter("btnBancosFecha") != null && request.getParameter("txtFechaBancos").equals("") && request.getParameter("txtBancosListaBen").equals("Todos")) {
            referer = "http://www.sttcsc.com/index.jsp";

        }

        if (request.getParameter("btnBancosFechaLugar") != null && !request.getParameter("txtFechaBancos").equals("")) {
            if (!request.getParameter("txtBancosListaLugar").equals("Todos")) {
                referer = "http://www.sttcsc.com/index.jsp?fechaNueva=" + request.getParameter("txtFechaBancos") + "&lugar=" + request.getParameter("txtBancosListaLugar");
            } else {
                referer = "http://www.sttcsc.com/index.jsp?fechaNueva=" + request.getParameter("txtFechaBancos");
            }
        } else if (request.getParameter("btnBancosFechaLugar") != null && request.getParameter("txtFechaBancos").equals("") && !request.getParameter("txtBancosListaLugar").equals("Todos")) {
            System.out.println("Base: " + request.getParameter("txtFechaBancos"));

        } else if (request.getParameter("btnBancosFechaLugar") != null && request.getParameter("txtFechaBancos").equals("") && request.getParameter("txtBancosListaLugar").equals("Todos")) {
            referer = "http://www.sttcsc.com/index.jsp";

        } else if (request.getParameter("btnBancoIngreso") != null) {
            try {
                Cookie cookie = new Cookie("desdeBanco", "si");
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/ingresoAgregar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnIngresoPanel") != null) {
            try {
                Cookie cookie = new Cookie("desdeBanco", "no");
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/ingresoAgregar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnBancoEgreso") != null) {
            try {
                Cookie cookie = new Cookie("desdeBanco", "si");
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/egresoAgregar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        } else if (request.getParameter("btnEgresoPanel") != null) {
            try {
                Cookie cookie = new Cookie("desdeBanco", "no");
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/egresoAgregar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }

        if (request.getParameter("btnBancosFechaTipo") != null && request.getParameter("txtFechaBancos").equals("")) {
            referer = "http://www.sttcsc.com/index.jsp";
        } else if (request.getParameter("btnBancosFechaTipo") != null && !request.getParameter("txtFechaBancos").equals("")) {
            referer = "http://www.sttcsc.com/index.jsp?fechaNueva=" + request.getParameter("txtFechaBancos");
        }

        //Reportes
        if (request.getParameter("btnReportePais") != null) {
            try {
                Cookie cookie = new Cookie("pais", request.getParameter("cmbReportePais"));
                cookie.setPath("/");
                response.addCookie(cookie);
                cookie = new Cookie("fecha", request.getParameter("txtFechaReportePais"));
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/reporteDolarizacion.jsp";
                //referer = "http://localhost:8081/TransaccionesInterTest/reportePais.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }
        //Privilegios
        if (request.getParameter("btnPrivilegio") != null) {
            try {
                Cookie cookie = new Cookie("usuarioTemp", request.getParameter("cmbUsuarioPrivilegio"));
                cookie.setPath("/");
                response.addCookie(cookie);
                referer = "http://www.sttcsc.com/privilegiosUsuario.jsp";
                //referer = "http://localhost:8081/TransaccionesInterTest/privilegiosUsuario.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }
        if (request.getParameter("btnModEntrada") != null) {
            try {
                referer = "http://www.sttcsc.com/flujoModificar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }

        if (request.getParameter("btnModEntrada") != null) {
            try {
                referer = "http://www.sttcsc.com/flujoModificar.jsp";
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }

        }

        if (request.getParameter("btnIngresoVolver") != null) {
            try {
                Cookie[] cookies = request.getCookies();
                String raiz = null;
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("desdeBanco")) {
                            raiz = cookie.getValue();
                            if (raiz.equals("si")) {
                                referer = "http://www.sttcsc.com/index.jsp";
                            } else {
                                referer = "http://www.sttcsc.com/ingresos.jsp";

                            }
                        }
                    }
                }
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        }

        if (request.getParameter("btnEgresoVolver") != null) {
            try {
                Cookie[] cookies = request.getCookies();
                String raiz = null;
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("desdeBanco")) {
                            raiz = cookie.getValue();
                            if (raiz.equals("si")) {
                                referer = "http://www.sttcsc.com/index.jsp";
                            } else {
                                referer = "http://www.sttcsc.com/egresos.jsp";

                            }
                        }
                    }
                }
            } catch (Exception ex) {
                System.out.println("Error: " + ex.toString());
            }
        }

        try {

            response.sendRedirect(referer);
        } catch (IOException ex) {
            System.out.println("Error: " + ex);
        }
    }

    /*Tablas*/
    //Inicio
    //Creacion de beneficiarios
    public void beneficiarioGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {

            baseDatos.agregarBeneficiario(request.getParameter("txtNombreEntidad"),
                    request.getParameter("txtNotas"));

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error: " + ex.toString());
        }
    }

    //Creacion de movimientos
    public void movimientoGuardar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {

            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtMovimientoFecha"));

            baseDatos.agregarMovimiento(
                    request.getParameter("txtMovimientoDescripcion"),
                    date,
                    request.getParameter("txtMovimientoMonto"),
                    request.getParameter("txtMovimientoOrigen"),
                    request.getParameter("txtMovimientoDestino")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    //Ingresos
    public void ingresosAgregar(HttpServletRequest request, HttpServletResponse response) {

        try {
            int temp = 1;
            if (request.getParameter("cbxIngresoEstado").equals("Ingreso Estimado")) {
                temp = 2;
            }

            if (request.getParameter("txtIngresoComi").equals("0")) {
                DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                Date date;
                date = formatter.parse(request.getParameter("txtIngresoFecha"));
                int result = baseDatos.agregarFlujo(
                        date,
                        request.getParameter("cmbIngresoCuenta"),
                        request.getParameter("txtIngresoConcepto"),
                        request.getParameter("txtIngresoMonto"),
                        1,
                        temp
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            } else {
                DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                Date date;
                date = formatter.parse(request.getParameter("txtIngresoFecha"));
                int result = baseDatos.agregarFlujo(
                        date,
                        request.getParameter("cmbIngresoCuenta"),
                        request.getParameter("txtIngresoConcepto"),
                        request.getParameter("txtIngresoMonto"),
                        1,
                        temp,
                        request.getParameter("txtIngresoComi")
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModBanco(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModBanco(
                    request.getParameter("txtModCuenta"),
                    request.getParameter("txtModNuevoBanco")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void crearUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.agregarUsuario(
                    request.getParameter("txtUsuarioNombre"),
                    request.getParameter("txtUsuarioUsuario"),
                    request.getParameter("txtUsuarioContraseña"),
                    request.getParameter("selUsuarioRol")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModCuenta(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModCuenta(
                    request.getParameter("txtModCuenta"),
                    request.getParameter("txtModNuevaCuenta")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModCInicial(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModCInicial(
                    request.getParameter("txtModCuenta"),
                    request.getParameter("txtModNuevoMontoI")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModFinal(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModFinal(
                    request.getParameter("txtModCuenta"),
                    request.getParameter("txtModNuevoMontoF")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModConceptoIng(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModConceptoIng(
                    request.getParameter("txtModIngreso"),
                    request.getParameter("txtModConceptoIng")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void ingresoPais(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.ingresoPais(
                    request.getParameter("txtPaisNombre")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void modTipoCambio(HttpServletRequest request, HttpServletResponse response) {
        try {
            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtFechaCambioTipo"));

            baseDatos.modTipoCambio(
                    request.getParameter("txtCuentaCambioTipo"),
                    date,
                    request.getParameter("txtCompraCambioTipo"),
                    request.getParameter("txtVentaCambioTipo")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModCuentaIng(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModCuentaIng(
                    request.getParameter("txtModIngreso"),
                    request.getParameter("txtModCuentaIng")
            );


        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }
    public void modFondo(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerModFondo(
                    request.getParameter("txtModFondoNombre"),
                    request.getParameter("txtModFondoMonto")
            );


        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void hacerModCuentaCompleta(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String banco;
        String razonS;
        String cuenta;
        String cuentaN;
        String pais;
        String moneda;

        banco = request.getParameter("cmbCuentaModBancos");
        razonS = request.getParameter("cmbCuentaModBeneficiario");
        cuenta = request.getParameter("txtModCuentaCuenta");
        cuentaN = request.getParameter("txtModCuentaCuentaN");
        pais = request.getParameter("selCuentaModLugar");
        moneda = request.getParameter("txtCuentasModListaMoneda");

        if (banco != null && !banco.equals("")) {
            try {
                baseDatos.cuentaModBanco(
                        cuenta,
                        banco
                );

                out.println("Mod banco");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (razonS != null && !razonS.equals("")) {
            try {
                baseDatos.cuentaModRazon(
                        cuenta,
                        razonS
                );

                out.println("Mod razon");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (pais != null && !pais.equals("")) {
            try {
                baseDatos.cuentaModPais(
                        cuenta,
                        pais
                );

                out.println("Mod pais");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (moneda != null && !moneda.equals("")) {
            try {
                baseDatos.cuentaModMoneda(
                        cuenta,
                        moneda
                );

                out.println("Mod moneda");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }
        /*
         if (cuentaEspecial != null) {
         try {
         baseDatos.cuentaModTipo(
         cuenta,
         tipoCuenta
         );

         out.println("Mod tipo");

         } catch (Exception ex) {
         System.out.println("Error:" + ex.toString());
         }
         }
         */
        if (cuentaN != null && !cuentaN.equals("")) {
            try {
                baseDatos.cuentaModCuenta(
                        cuenta,
                        cuentaN
                );

                out.println("Mod banco");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

    }

    public void hacerModFlujo(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String flujo;
        String concepto;
        String monto;
        String cuenta;
        String fecha;

        flujo = request.getParameter("txtModIngreso");
        concepto = request.getParameter("txtModConceptoIng");
        monto = request.getParameter("txtModMontoIng");
        cuenta = request.getParameter("txtModCuentaIng");
        fecha = request.getParameter("txtModFechaIng");
        if (cuenta == null) {
            cuenta = "";
        }

        DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
        Date date;

        if (concepto != null && !concepto.equals("")) {
            try {
                baseDatos.hacerModConcepto(
                        flujo,
                        concepto
                );

                out.println("Mod Concepto");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (monto != null && !monto.equals("") && request.getParameter("chbPasarReal") != null) {

            try {
                baseDatos.hacerModMontoEst(
                        flujo,
                        monto
                );

                out.println("Mod Monto");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }

        } else {
            try {
                baseDatos.hacerModMontoIng(
                        flujo,
                        monto
                );

                out.println("Mod Monto");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (!cuenta.equals("") && !cuenta.equals("0") && cuenta != null) {
            try {
                baseDatos.hacerModCuentaFlujo(
                        flujo,
                        cuenta
                );

                out.println("Mod Cuenta");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }
        if (fecha != null && !fecha.equals("")) {

            try {
                date = formatter.parse(fecha);
                baseDatos.hacerModFechaFlujo(
                        flujo,
                        date
                );

                out.println("Mod fecha");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }

        if (request.getParameter("chbPasarReal") != null) {

            try {
                baseDatos.pasarReal(
                        flujo
                );

                out.println("Mod pasar");

            } catch (Exception ex) {
                System.out.println("Error:" + ex.toString());
            }
        }
        if (request.getParameter("chbEliminarFlujo") != null) {
            try {
                baseDatos.hacerModMontoIng(
                        flujo,
                        "0"
                );

            } catch (Exception e) {
                System.out.println("Error:" + e.toString());
            }
            try {
                baseDatos.eliminarFlujo(
                        flujo
                );

            } catch (Exception e) {
                System.out.println("Error:" + e.toString());
            }
        }

    }

    //Egresos
    public void egresosAgregar(HttpServletRequest request, HttpServletResponse response) {

        try {
            int temp = 1;
            if (request.getParameter("cbxEgresoEstado").equals("Egreso Estimado")) {
                temp = 2;
            }

            if (request.getParameter("txtEgresoComi").equals("0")) {

                DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                Date date;
                date = formatter.parse(request.getParameter("txtEgresoFecha"));
                int result = baseDatos.agregarFlujo(
                        date,
                        request.getParameter("cmbEgresoCuenta"),
                        request.getParameter("txtEgresoConcepto"),
                        request.getParameter("txtEgresoMonto"),
                        2,
                        temp
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }

            } else {

                DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
                Date date;
                date = formatter.parse(request.getParameter("txtEgresoFecha"));
                int result = baseDatos.agregarFlujo(
                        date,
                        request.getParameter("cmbEgresoCuenta"),
                        request.getParameter("txtEgresoConcepto"),
                        request.getParameter("txtEgresoMonto"),
                        2,
                        temp,
                        request.getParameter("txtEgresoComi")
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }

                out.println("Agregado");

            }

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void egresosFiltro(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie("desde", request.getParameter("txtEgresoDesde"));
        cookie.setMaxAge(5);
        cookie.setPath("/");
        response.addCookie(cookie);
        cookie = new Cookie("hasta", request.getParameter("txtEgresoHasta"));
        cookie.setPath("/");
        cookie.setMaxAge(5);
        response.addCookie(cookie);
        cookie = new Cookie("cuenta", request.getParameter("cmbFiltroCuentaEgreso"));
        cookie.setPath("/");
        cookie.setMaxAge(5);
        response.addCookie(cookie);
    }

    public void ingresosFiltro(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie("desde", request.getParameter("txtIngresoDesde"));
        cookie.setMaxAge(5);
        cookie.setPath("/");
        response.addCookie(cookie);
        cookie = new Cookie("hasta", request.getParameter("txtIngresoHasta"));
        cookie.setPath("/");
        cookie.setMaxAge(5);
        response.addCookie(cookie);
        cookie = new Cookie("cuenta", request.getParameter("cmbFiltroCuentaIngreso"));
        cookie.setPath("/");
        cookie.setMaxAge(5);
        response.addCookie(cookie);
    }

    public void bancosAgregar(HttpServletRequest request, HttpServletResponse response) {

        try {

            baseDatos.agregarBanco(
                    request.getParameter("txtBancoNombre")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void agregarPrivilegio(HttpServletRequest request, HttpServletResponse response) {
        try {
            Cookie[] cookies = request.getCookies();
            String usuarioTemp = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("usuarioTemp")) {
                        usuarioTemp = cookie.getValue();

                    }
                }
            }
            baseDatos.agregarPrivilegio(
                    usuarioTemp,
                    request.getParameter("cmbUsuarioPrivilegioAgregar")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void quitarPrivilegio(HttpServletRequest request, HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();
        String usuarioTemp = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("usuarioTemp")) {
                    usuarioTemp = cookie.getValue();
                }
            }
        }

        try {
            baseDatos.quitarPrivilegio(
                    usuarioTemp,
                    request.getParameter("cmbUsuarioPrivilegioQuitar")
            );

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public void cuentaAgregar(HttpServletRequest request, HttpServletResponse response) {

        try {

            Date d = new Date();
            if (request.getParameter("chbCuentaEspecial") == null) {

                baseDatos.agregarCuenta(
                        request.getParameter("cmbCuentaBancos"),
                        request.getParameter("cmbCuentaBeneficiario"),
                        request.getParameter("txtCuenta"),
                        request.getParameter("txtMontoCuenta"),
                        request.getParameter("txtCuentasListaMoneda"),
                        d,
                        request.getParameter("selCuentaLugar"),
                        request.getParameter("txtCambioCompra"),
                        request.getParameter("txtCambioVenta")
                );
            } else {
                baseDatos.agregarCuenta(
                        request.getParameter("cmbCuentaBancos"),
                        request.getParameter("cmbCuentaBeneficiario"),
                        request.getParameter("txtCuenta"),
                        request.getParameter("txtMontoCuenta"),
                        request.getParameter("txtCuentasListaMoneda"),
                        d,
                        request.getParameter("selCuentasEspecial"),
                        request.getParameter("selCuentaLugar"),
                        request.getParameter("txtCambioCompra"),
                        request.getParameter("txtCambioVenta")
                );
            }

            out.println("Agregado");

        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    private void hacerCierre(HttpServletRequest request, HttpServletResponse response) {
        try {
            baseDatos.hacerCierre(
                    request.getParameter("selCierreBen"),
                    request.getParameter("txtCambioCompra"),
                    request.getParameter("txtCambioVenta")
            );
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.toString());
        }
    }

    private void hacerTransferencia(HttpServletRequest request, HttpServletResponse response) {
        try {

            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtTransFecha"));
            int result;
            if (request.getParameter("txtTransComi").equals("0")) {
                if (request.getParameter("txtMontoTransEntrada").isEmpty()) {
                    result = baseDatos.hacerTransferencia(
                            request.getParameter("cmbTransOrigen"),
                            request.getParameter("cmbTransDestino"),
                            request.getParameter("txtMontoTransSalida"),
                            request.getParameter("txtConceptoTrans"),
                            date
                    );
                } else {
                    result = baseDatos.hacerTransferenciaExtra(
                            request.getParameter("cmbTransOrigen"),
                            request.getParameter("cmbTransDestino"),
                            request.getParameter("txtMontoTransSalida"),
                            request.getParameter("txtMontoTransEntrada"),
                            request.getParameter("txtConceptoTrans"),
                            date
                    );
                }
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            } else {
                if (request.getParameter("txtMontoTransEntrada").isEmpty()) {
                    result = baseDatos.hacerTransferencia(
                            request.getParameter("cmbTransOrigen"),
                            request.getParameter("cmbTransDestino"),
                            request.getParameter("txtMontoTransSalida"),
                            request.getParameter("txtConceptoTrans"),
                            date,
                            request.getParameter("txtTransComi")
                    );
                } else {
                    result = baseDatos.hacerTransferenciaExtra(
                            request.getParameter("cmbTransOrigen"),
                            request.getParameter("cmbTransDestino"),
                            request.getParameter("txtMontoTransSalida"),
                            request.getParameter("txtMontoTransEntrada"),
                            request.getParameter("txtConceptoTrans"),
                            date,
                            request.getParameter("txtTransComi")
                    );
                }
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.toString());
        } catch (ParseException ex) {
            Logger.getLogger(GestorLogica.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void seleccionBeneficiario(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Cookie cookie = new Cookie("razon", request.getParameter("cmbUsuarioBeneficiario"));
        cookie.setPath("/");
        cookie.setMaxAge(60 * 30);
        response.addCookie(cookie);
    }

    private void seleccionBeneficiarioDos(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Cookie cookie = new Cookie("razon", request.getParameter("cmbUsuarioBeneficiarioDos"));
        cookie.setMaxAge(60 * 30);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    private void guardarFondo(HttpServletRequest request, HttpServletResponse response) {
        try {

            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtFechaFondoA"));
            if (!request.getParameter("txtFechaFondoCadu").equals("")) {
                Date date2;
                date2 = formatter.parse(request.getParameter("txtFechaFondoA"));

                int result = baseDatos.agregarFondo2(
                        request.getParameter("txtNombreFondo"),
                        request.getParameter("txtMontoFondoAP"),
                        request.getParameter("txtFondoMonedaAP"),
                        request.getParameter("cmbFondoCuentaO"),
                        request.getParameter("txtFondoCuentaD"),
                        date,
                        date2
                );

                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }

            } else {
                int result = baseDatos.agregarFondo(
                        request.getParameter("txtNombreFondo"),
                        request.getParameter("txtMontoFondoAP"),
                        request.getParameter("txtFondoMonedaAP"),
                        request.getParameter("cmbFondoCuentaO"),
                        request.getParameter("txtFondoCuentaD"),
                        date
                );

                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }

        } catch (Exception ex) {
            ex.toString();
        }
    }

    private void liquidarFondo(HttpServletRequest request, HttpServletResponse response) {
        try {

            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtFechaFondoL"));

            baseDatos.liquidarFondo(
                    request.getParameter("txtMontoFondoLI"),
                    request.getParameter("txtIntFondoLI"),
                    request.getParameter("txtFondoLI"),
                    request.getParameter("cmbFondoCuentaDLI"),
                    date
            );
        } catch (Exception ex) {
            ex.toString();
        }
    }

    private void entrarSesion(HttpServletRequest request, HttpServletResponse response) {
        try {
            int val = baseDatos.entrarSesion(
                    request.getParameter("usuario"),
                    request.getParameter("pass")
            );

            if (val == 1) {
                Cookie cookie = new Cookie("validado", val + "");
                cookie.setMaxAge(60 * 30);
                cookie.setPath("/");
                String id = baseDatos.getIDUsuario(request.getParameter("usuario"));
                Cookie cookie2 = new Cookie("usuario", id + "");
                cookie2.setMaxAge(60 * 30);
                cookie2.setPath("/");
                String id2 = baseDatos.getRolUsuario(request.getParameter("usuario"));
                Cookie cookie3 = new Cookie("rol", id2 + "");
                cookie3.setPath("/");
                cookie3.setMaxAge(60 * 30);
                Cookie cookie4 = new Cookie("razon", "error");
                cookie4.setMaxAge(60 * 30);
                cookie4.setPath("/");
                response.addCookie(cookie);
                response.addCookie(cookie2);
                response.addCookie(cookie3);
                response.addCookie(cookie4);
            }
        } catch (Exception ex) {
            ex.toString();
        }
    }

    private void guardarDivisa(HttpServletRequest request, HttpServletResponse response) {

        DecimalFormat df = new DecimalFormat("####.##");
        df.setRoundingMode(RoundingMode.DOWN);

        String montoDestino = "";
        String monedaOrigen;

        String monedaDestino/* 1- local a dolares, 2- dolares a local*/;

        if (request.getParameter("cmbTipoDivisa").equals("Local a Dolares")) {
            monedaOrigen = "LOCAL";
            monedaDestino = "DOLARES";
        } else {
            monedaOrigen = "DOLARES";
            monedaDestino = "LOCAL";
        }
        if (request.getParameter("cmbDivisaBancoElegido").equals("1")) {
            montoDestino = df.format(Double.parseDouble(request.getParameter("tempUno")));
        } else if (request.getParameter("cmbDivisaBancoElegido").equals("2")) {
            montoDestino = df.format(Double.parseDouble(request.getParameter("tempDos")));
        } else if (request.getParameter("cmbDivisaBancoElegido").equals("3")) {
            montoDestino = df.format(Double.parseDouble(request.getParameter("tempTres")));
        }

        try {

            DateFormat formatter = new SimpleDateFormat("MM/dd/yy");
            Date date;
            date = formatter.parse(request.getParameter("txtFechaDivisa"));

            if (!request.getParameter("cmbBDos").equals("")) {

                int result = baseDatos.agregarDivisa(
                        date,
                        request.getParameter("cmbDivisaBancoElegido"),
                        request.getParameter("txtMontoDivisa"),
                        montoDestino,
                        monedaOrigen,
                        monedaDestino,
                        request.getParameter("txtDivisaTipoUno"),
                        request.getParameter("txtDivisaTipoDos"),
                        request.getParameter("txtDivisaTipoTres"),
                        request.getParameter("cmbBUno"),
                        request.getParameter("cmbBDos"),
                        request.getParameter("cmbBTres"),
                        request.getParameter("cmbDivisaCuentaOrigen"),
                        request.getParameter("cmbDivisaCuentaDestino")
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            } else {
                int result = baseDatos.agregarDivisaDos(
                        date,
                        request.getParameter("cmbDivisaBancoElegido"),
                        request.getParameter("txtMontoDivisa"),
                        montoDestino,
                        monedaOrigen,
                        monedaDestino,
                        request.getParameter("txtDivisaTipoUno"),
                        request.getParameter("cmbBUno"),
                        request.getParameter("cmbDivisaCuentaOrigen"),
                        request.getParameter("cmbDivisaCuentaDestino")
                );
                if (result == 1) {
                    Cookie cookie = new Cookie("error", "1");
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }

        } catch (Exception ex) {

            System.out.println(ex.toString());
        }
    }

//Lugares
    public String[][] obtenerLugares() {
        return baseDatos.obtenerLugares();
    }

    public String[] obtenerLugaresNombre() {
        return baseDatos.obtenerLugaresNombre();
    }

}
