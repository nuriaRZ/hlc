/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alex
 */
public class Ejecuta {

    Connection conexion;
    Statement instruccion;
    ResultSet result;

    public Ejecuta(String sentenciasql) throws ClassNotFoundException {

        //Cadena de conexion de MySql, el parametro useSSL es opcional
        String url = "jdbc:mysql://localhost:3306/uno";
        try {
            // Cargamos el driver de mysq
            Class.forName("com.mysql.jdbc.Driver");
            this.conexion = DriverManager.getConnection(url, "alex", "1234");
            this.instruccion = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            this.result = instruccion.executeQuery(sentenciasql);

        } catch (SQLException ex) {
            Logger.getLogger(Ejecuta.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ResultSet getResult() {
        return result;
    }

    public void cerrar() {
        try {
            this.result.close();
            this.instruccion.close();
            this.conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Ejecuta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
