package datos;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;

public class BaseDatos {

    //conexión con la base
    public ResultSet realizarQueryMultiple(String query) throws Exception {
        //assumes you already have your Connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
        Statement statement = connection.createStatement();

        ResultSet result = statement.executeQuery(query);
        connection.close();
        return result;
    }

    //'
    //METODOS DE AGREGAR
    public void agregarBeneficiario(String nombreEntidad, String notas) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call agregarBeneficiario(?,?)}");
        statement.setString(1, nombreEntidad);
        statement.setString(2, notas);
        statement.execute();
        connection.close();
    }

    public void agregarUsuario(String nombre, String usuario, String pass, String rol) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
        statement = connection.prepareCall("{call agregarUsuario(?,?,?,?)}");
        statement.setString(1, nombre);
        statement.setString(2, usuario);
        statement.setString(3, pass);
        statement.setString(4, rol);
        statement.execute();
        connection.close();
    }

    public void agregarMovimiento(String descripcion, java.util.Date fecha, String monto, String fondoOrigen, String destinoFondo) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call agregarMovimiento(?,?,?,?,?)}");
        statement.setString(1, descripcion);
        statement.setDate(2, new java.sql.Date(fecha.getTime()));
        statement.setDouble(3, Double.parseDouble(monto));
        statement.setInt(4, Integer.parseInt(fondoOrigen));
        statement.setInt(5, Integer.parseInt(destinoFondo));
        statement.execute();
        connection.close();
    }

    public int agregarDivisa(java.util.Date fecha, String entidad, String montoOrigen, String montoDestino, String monedaOrigen, String monedaDestino/* 1- local a dolares, 2- dolares a local*/,
            String tipoUno, String tipoDos, String tipoTres, String bancoUno, String bancoDos,
            String bancoTres, String cuentaOrigen, String cuentaDestino) throws Exception {
        try {

            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(fecha);

            if (result != -1) {
                statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
                statement = connection.prepareCall("{call agregarDivisa(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(fecha.getTime()));
                statement.setInt(2, Integer.parseInt(entidad));
                statement.setDouble(3, Double.parseDouble(montoOrigen));
                statement.setDouble(4, Double.parseDouble(montoDestino));
                statement.setString(5, monedaOrigen);
                statement.setString(6, monedaDestino);
                statement.setDouble(7, Double.parseDouble(tipoUno));
                statement.setDouble(8, Double.parseDouble(tipoDos));
                statement.setDouble(9, Double.parseDouble(tipoTres));
                statement.setString(10, bancoUno);
                statement.setString(11, bancoDos);
                statement.setString(12, bancoTres);
                statement.setString(13, cuentaOrigen);
                statement.setString(14, cuentaDestino);
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return 1;
    }

    public int agregarDivisaDos(java.util.Date fecha, String entidad, String montoOrigen, String montoDestino, String monedaOrigen, String monedaDestino/* 1- local a dolares, 2- dolares a local*/,
            String tipoUno, String bancoUno, String cuentaOrigen, String cuentaDestino) throws Exception {
        try {

            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(fecha);

            if (result != -1) {
                statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
                statement = connection.prepareCall("{call agregarDivisaDos(?,?,?,?,?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(fecha.getTime()));
                statement.setInt(2, Integer.parseInt(entidad));
                statement.setDouble(3, Double.parseDouble(montoOrigen));
                statement.setDouble(4, Double.parseDouble(montoDestino));
                statement.setString(5, monedaOrigen);
                statement.setString(6, monedaDestino);
                statement.setDouble(7, Double.parseDouble(tipoUno));
                statement.setString(8, bancoUno);
                statement.setString(9, cuentaOrigen);
                statement.setString(10, cuentaDestino);
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return 1;
    }

    public int agregarFondo(String nombre, String monto, String moneda, String cuentaO, String cuentaD, java.util.Date fecha) {
        try {

            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaO);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(fecha);

            if (result != -1) {
                statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
                statement = connection.prepareCall("{call agregarFondo(?,?,?,?,?,?)}");
                statement.setString(1, nombre);
                statement.setDouble(2, Double.parseDouble(monto));
                statement.setString(3, moneda);
                statement.setString(4, cuentaO);
                statement.setString(5, cuentaD);
                statement.setDate(6, new java.sql.Date(fecha.getTime()));
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception ex) {
            ex.toString();
        }
        return 1;
    }

    public int agregarFondo2(String nombre, String monto, String moneda, String cuentaO, String cuentaD, java.util.Date fecha, java.util.Date fechaCadu) {
        try {

            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaO);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(fecha);

            if (result != -1) {
                statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
                statement = connection.prepareCall("{call agregarFondoDos(?,?,?,?,?,?,?)}");
                statement.setString(1, nombre);
                statement.setDouble(2, Double.parseDouble(monto));
                statement.setString(3, moneda);
                statement.setString(4, cuentaO);
                statement.setString(5, cuentaD);
                statement.setDate(6, new java.sql.Date(fecha.getTime()));
                statement.setDate(7, new java.sql.Date(fechaCadu.getTime()));
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception ex) {
            ex.toString();
        }
        return 1;
    }

    public void liquidarFondo(String monto, String intereses, String fondo, String cuentaD, java.util.Date fecha) {
        try {
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
            statement = connection.prepareCall("{call liquidarFondo(?,?,?,?,?)}");
            statement.setDouble(1, Double.parseDouble(monto));
            statement.setDouble(2, Double.parseDouble(intereses));
            statement.setString(3, fondo);
            statement.setString(4, cuentaD);
            statement.setDate(5, new java.sql.Date(fecha.getTime()));
            statement.execute();
            connection.close();
        } catch (Exception ex) {
            System.out.println("Error:" + ex.toString());
        }
    }

    public int agregarFlujo(java.util.Date fecha, String cuenta, String concepto, String monto, int tipo, int estado) throws Exception {

        ResultSet resultset = null;
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

        statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
        statement.setString(1, cuenta);
        statement.execute();
        resultset = statement.getResultSet();
        resultset.next();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
        int result = fecha2.compareTo(fecha);

        if (result != -1 || estado == 2) {

            statement = connection.prepareCall("{call agregarFlujo(?,?,?,?,?,?)}");
            statement.setDate(1, new java.sql.Date(fecha.getTime()));
            statement.setString(2, cuenta);
            statement.setString(3, concepto);
            statement.setDouble(4, Double.parseDouble(monto));
            statement.setInt(5, tipo);
            statement.setInt(6, estado);
            statement.execute();
            connection.close();
            return 0;
        } else {
            return 1;
        }
    }

    public void pasarReal(String idFlujo) throws Exception {
        System.out.println("Pasando a real " + idFlujo);
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call pasarReal(?)}");
        statement.setInt(1, Integer.parseInt(idFlujo));
        statement.execute();
        connection.close();
    }

    public void eliminarFlujo(String idFlujo) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call eliminarFlujo(?)}");
        statement.setInt(1, Integer.parseInt(idFlujo));
        statement.execute();
        connection.close();
    }

    public int agregarFlujo(java.util.Date fecha, String cuenta, String concepto, String monto, int tipo, int estado, String comi) throws Exception {
        try {

            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuenta);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(fecha);

            if (result != -1 || estado == 2) {
                statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
                statement = connection.prepareCall("{call agregarFlujo(?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(fecha.getTime()));
                statement.setString(2, cuenta);
                statement.setString(3, concepto);
                statement.setDouble(4, Double.parseDouble(monto));
                statement.setInt(5, tipo);
                statement.setInt(6, estado);
                statement.execute();

                statement = connection.prepareCall("{call agregarFlujo(?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(fecha.getTime()));
                statement.setString(2, cuenta);
                statement.setString(3, "Comisión " + concepto);
                statement.setDouble(4, Double.parseDouble(comi));
                statement.setInt(5, tipo);
                statement.setInt(6, estado);
                statement.execute();

                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return 0;
    }

    public void agregarBanco(String nombre) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call agregarBanco(?)}");
        statement.setString(1, nombre);
        statement.execute();
        connection.close();
    }

    public void agregarPrivilegio(String usuario, String razon) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println(usuario);
        System.out.println(razon);
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call agregarPrivilegio(?,?)}");
        statement.setString(1, usuario);
        statement.setString(2, razon);
        statement.execute();
        connection.close();
    }

    public void quitarPrivilegio(String usuario, String razon) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        statement = connection.prepareCall("{call quitarPrivilegio(?,?)}");
        statement.setString(1, usuario);
        statement.setString(2, razon);
        statement.execute();
        connection.close();
    }

    public void agregarCuenta(String nombre, String beneficiario, String cuenta, String monto, String moneda, java.util.Date date, String lugar, String compra, String venta) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");
        if (moneda == "EURO") {
            statement = connection.prepareCall("{call agregarCuenta(?,?,?,?,?,?,?,?,?,?)}");
            statement.setString(1, nombre);
            statement.setString(2, beneficiario);
            statement.setString(3, cuenta);
            statement.setString(4, monto);
            statement.setString(5, "LOCAL");
            statement.setDate(6, new java.sql.Date(date.getTime()));
            statement.setString(7, lugar);
            statement.setString(8, compra);
            statement.setString(9, venta);
            statement.setInt(10, 1);
        } else {
            statement = connection.prepareCall("{call agregarCuenta(?,?,?,?,?,?,?,?,?,?)}");
            statement.setString(1, nombre);
            statement.setString(2, beneficiario);
            statement.setString(3, cuenta);
            statement.setString(4, monto);
            statement.setString(5, moneda);
            statement.setDate(6, new java.sql.Date(date.getTime()));
            statement.setString(7, lugar);
            statement.setString(8, compra);
            statement.setString(9, venta);
            statement.setInt(10, 0);
        }
        statement.execute();
        connection.close();
    }

    public void hacerModBanco(String cuenta, String banco) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true",
                    "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModBanco(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, banco);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }
    public void hacerModFondo(String fondo, String monto) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true",
                    "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModFondo(?,?)}");
            statement.setString(1, fondo);
            statement.setString(2, monto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModCuenta(String cuenta, String nuevaCuenta) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModCuenta(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, nuevaCuenta);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModCInicial(String cuenta, String monto) throws Exception {
        try {
            double nuevoMonto = Double.parseDouble(monto);

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModCInicial(?,?)}");
            statement.setString(1, cuenta);
            statement.setDouble(2, nuevoMonto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModFinal(String cuenta, String monto) throws Exception {
        try {
            double nuevoMonto = Double.parseDouble(monto);

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModFinal(?,?)}");
            statement.setString(1, cuenta);
            statement.setDouble(2, nuevoMonto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void modTipoCambio(String razon, java.util.Date fecha, String compra, String venta) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call modTiposDeCambio(?,?,?,?)}");
            
            statement.setDate(1, new java.sql.Date(fecha.getTime()));
            statement.setString(2, compra);
            statement.setString(3, venta);
            statement.setString(4, razon);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModConceptoIng(String ingreso, String concepto) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModConceptoIng(?,?)}");
            statement.setString(1, ingreso);
            statement.setString(2, concepto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void seleccionBeneficiario(String ben) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call seleccionBeneficiario(?)}");
            statement.setString(1, ben);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModCuentaIng(String ingreso, String cuenta) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModCuentaIng(?,?)}");
            statement.setString(1, ingreso);
            statement.setString(2, cuenta);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModMontoIng(String ingreso, String monto) throws Exception {
        try {
            double nuevoMonto = Double.parseDouble(monto);

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call modFlujoMonto(?,?)}");
            statement.setString(1, ingreso);
            statement.setDouble(2, nuevoMonto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModMontoEst(String ingreso, String monto) throws Exception {
        try {
            double nuevoMonto = Double.parseDouble(monto);

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerModMontoEstimado(?,?)}");
            statement.setInt(1, Integer.parseInt(ingreso));
            statement.setDouble(2, nuevoMonto);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModConcepto(String ingreso, String con) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call modFlujoConcepto(?,?)}");
            statement.setString(1, ingreso);
            statement.setString(2, con);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void hacerModCuentaFlujo(String ingreso, String cuenta) throws Exception {
        try {
            if (cuenta.equals("")) {

            } else {
                CallableStatement statement = null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call modFlujoCuenta(?,?)}");
                statement.setString(1, ingreso);
                statement.setString(2, cuenta);
                statement.execute();
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());

        }
    }

    public void hacerModFechaFlujo(String ingreso, java.util.Date fecha) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call modFlujoFecha(?,?)}");
            statement.setDate(1, new java.sql.Date(fecha.getTime()));
            statement.setString(2, ingreso);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public int entrarSesion(String usuario, String contrasennia) throws Exception {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            String sql = "SELECT COUNT(*) FROM AA_USUARIO WHERE USUARIO = ? AND PASS = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, usuario);
            pstmt.setString(2, contrasennia);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                if (!rs.getString(1).equals("0")) {
                    return 1;
                }
            }
            connection.close();
            return 0;
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
            return 0;
        }

    }

    public String getPais(String usuario) throws Exception {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            String sql = "SELECT PAIS_A FROM AA_USUARIO WHERE USUARIO = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, usuario);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
            return null;
        }
    }

    public String getIDUsuario(String usuario) throws Exception {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            String sql = "SELECT ID_USUARIO FROM AA_USUARIO WHERE USUARIO = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, usuario);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
            return null;
        }
    }

    public String getRolUsuario(String usuario) throws Exception {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            String sql = "SELECT ID_ROL FROM AA_USUARIO WHERE USUARIO = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, usuario);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
            return null;
        }
    }

    public void agregarCuenta(String nombre, String beneficiario, String cuenta, String monto, String moneda, java.util.Date date, String tipo,
            String lugar, String compra, String venta) throws Exception {
        CallableStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

        if (moneda == "EURO") {
            statement = connection.prepareCall("{call agregarCuentaDos(?,?,?,?,?,?,?,?,?,?,?)}");
            statement.setString(1, nombre);
            statement.setString(2, beneficiario);
            statement.setString(3, cuenta);
            statement.setString(4, monto);
            statement.setString(5, "LOCAL");
            statement.setDate(6, new java.sql.Date(date.getTime()));
            statement.setString(7, tipo);
            statement.setString(8, lugar);
            statement.setString(9, compra);
            statement.setString(10, venta);
            statement.setInt(11, 1);
            statement.execute();
            connection.close();
        } else {
            statement = connection.prepareCall("{call agregarCuentaDos(?,?,?,?,?,?,?,?,?,?,?)}");
            statement.setString(1, nombre);
            statement.setString(2, beneficiario);
            statement.setString(3, cuenta);
            statement.setString(4, monto);
            statement.setString(5, moneda);
            statement.setDate(6, new java.sql.Date(date.getTime()));
            statement.setString(7, tipo);
            statement.setString(8, lugar);
            statement.setString(9, compra);
            statement.setString(10, venta);
            statement.setInt(11, 0);
            statement.execute();
            connection.close();
        }
    }

    public void hacerCierre(String beneficiario, String compra, String venta) throws SQLException {
        try {
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call hacerCierre(?,?,?)}");
            statement.setString(1, beneficiario);
            statement.setDouble(2, Double.parseDouble(compra));
            statement.setDouble(3, Double.parseDouble(venta));
            statement.execute();
            connection.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex.toString());
        }
    }

    public int hacerTransferencia(String cuentaOrigen, String cuentaDestino, String monto, String concepto, java.util.Date Fecha) throws SQLException {
        System.out.println("Se hace transferencia de la cuenta " + cuentaOrigen + " a la cuenta " + cuentaDestino + ". Monto: " + monto);
        try {
            System.out.println("Haciendo transferencia de cuenta: " + cuentaDestino + "a la cuenta " + cuentaOrigen);
            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(Fecha);

            if (result != -1) {
                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call hacerTransferencia(?,?,?,?,?)}");
                statement.setString(1, cuentaOrigen);
                statement.setString(2, cuentaDestino);
                statement.setDouble(3, Double.parseDouble(monto));
                statement.setString(4, concepto);
                statement.setDate(5, new java.sql.Date(Fecha.getTime()));
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return 0;
    }

    public int hacerTransferencia(String cuentaOrigen, String cuentaDestino, String monto, String concepto, java.util.Date Fecha, String comi) throws SQLException {
        System.out.println("Se hace transferencia de la cuenta " + cuentaOrigen + " a la cuenta " + cuentaDestino + ". Monto: " + monto);
        try {
            System.out.println("Haciendo transferencia de cuenta: " + cuentaDestino + "a la cuenta " + cuentaOrigen);
            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(Fecha);

            if (result != -1) {
                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call hacerTransferencia(?,?,?,?,?)}");
                statement.setString(1, cuentaOrigen);
                statement.setString(2, cuentaDestino);
                statement.setDouble(3, Double.parseDouble(monto));
                statement.setString(4, concepto);
                statement.setDate(5, new java.sql.Date(Fecha.getTime()));
                statement.execute();
                connection.close();

                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call agregarFlujo(?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(Fecha.getTime()));
                statement.setString(2, cuentaOrigen);
                statement.setString(3, "Comisión " + concepto);
                statement.setDouble(4, Double.parseDouble(comi));
                statement.setInt(5, 2);
                statement.setInt(6, 1);
                statement.execute();

                return 0;
            } else {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return 0;
    }

    public int hacerTransferenciaExtra(String cuentaOrigen, String cuentaDestino, String montoS, String montoE, String concepto, java.util.Date Fecha) throws SQLException {

        try {
            System.out.println("Haciendo transferencia extra de cuenta: " + cuentaDestino + "a la cuenta " + cuentaOrigen);
            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(Fecha);

            if (result != -1) {
                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call hacerTransferenciaExtra(?,?,?,?,?,?)}");
                statement.setString(1, cuentaOrigen);
                statement.setString(2, cuentaDestino);
                statement.setDouble(3, Double.parseDouble(montoS));
                statement.setDouble(4, Double.parseDouble(montoE));
                statement.setString(5, concepto);
                statement.setDate(6, new java.sql.Date(Fecha.getTime()));
                statement.execute();
                connection.close();
                return 0;
            } else {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return 0;
    }
    public int hacerTransferenciaExtra(String cuentaOrigen, String cuentaDestino, String montoS, String montoE, String concepto, java.util.Date Fecha, String comi) throws SQLException {

        try {
            System.out.println("Haciendo transferencia extra de cuenta: " + cuentaDestino + "a la cuenta " + cuentaOrigen);
            ResultSet resultset = null;
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_rol_adm", "zAqwsx12");

            statement = connection.prepareCall("select date(Fecha) from AA_BANCO_ESTADO where CERRADO = 0 AND ID_CUENTA = (select ID_CUENTA FROM AA_BANCO_CUENTA WHERE CUENTA = ? )");
            statement.setString(1, cuentaDestino);
            statement.execute();
            resultset = statement.getResultSet();
            resultset.next();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date fecha2 = dateFormat.parse(resultset.getString(1));
            int result = fecha2.compareTo(Fecha);

            if (result != -1) {
                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call hacerTransferenciaExtra(?,?,?,?,?,?)}");
                statement.setString(1, cuentaOrigen);
                statement.setString(2, cuentaDestino);
                statement.setDouble(3, Double.parseDouble(montoS));
                statement.setDouble(4, Double.parseDouble(montoE));
                statement.setString(5, concepto);
                statement.setDate(6, new java.sql.Date(Fecha.getTime()));
                statement.execute();
                connection.close();
                
                
                statement = null;
                connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
                statement = connection.prepareCall("{call agregarFlujo(?,?,?,?,?,?)}");
                statement.setDate(1, new java.sql.Date(Fecha.getTime()));
                statement.setString(2, cuentaOrigen);
                statement.setString(3, "Comisión " + concepto);
                statement.setDouble(4, Double.parseDouble(comi));
                statement.setInt(5, 2);
                statement.setInt(6, 1);
                statement.execute();

                
                return 0;
            } else {
                return 1;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return 0;
    }

    public void ingresoPais(String pais) throws SQLException {
        try {
            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call agregarPais(?)}");
            statement.setString(1, pais);
            statement.execute();
            connection.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex.toString());
        }
    }

    public String[][] obtenerLugares() {
        String[][] resultado = new String[20][2];
        try {
            String sql = "select * from AA_LUGAR ";

            ResultSet resultSet = realizarQueryMultiple(sql);
            int i = 0;
            while (resultSet.next()) {
                resultado[i][0] = resultSet.getString("ID_LUGAR");
                resultado[i][1] = resultSet.getString("NOMBRE");

            }
        } catch (Exception ex) {
            Logger.getLogger(BaseDatos.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    public String[] obtenerLugaresNombre() {
        String[] resultado = new String[20];
        try {
            String sql = "select * from AA_LUGAR ";

            ResultSet resultSet = realizarQueryMultiple(sql);
            int i = 0;
            while (resultSet.next()) {
                resultado[i] = resultSet.getString("NOMBRE");

            }
        } catch (Exception ex) {
            Logger.getLogger(BaseDatos.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    public void cuentaModBanco(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModBanco(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void cuentaModCuenta(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModCuenta(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void cuentaModRazon(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModRazon(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void cuentaModPais(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModPais(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void cuentaModMoneda(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModMoneda(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }

    public void cuentaModTipo(String cuenta, String cambio) throws Exception {
        try {

            CallableStatement statement = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://198.38.91.192:3306/adminstt_Finanzas?noAccessToProcedureBodies=true", "adminstt_soporte", "zAqwsx12");
            statement = connection.prepareCall("{call cuentaModTipo(?,?)}");
            statement.setString(1, cuenta);
            statement.setString(2, cambio);
            statement.execute();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error:" + e.toString());
        }
    }


    /*
     //METODOS DE RELLENAR
     public static List<String> getBeneficiario(String consulta) throws Exception {
        
     List<String> results = new ArrayList<String>();
     //using the new runSelect method
     ResultSet rsData = realizarQueryMultiple(
     "select NOMBRE_ENTIDAD from my_table where con=?", consulta);
     while (rsData.next()) {
     results.add(rsData.getString("col1"));
     }
     return results;
     }*/
}
