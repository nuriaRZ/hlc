/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alex
 */
public class ConexionSin {
    
   private static  Connection conector=null;
   
   private  ConexionSin()
   {
      if  (conector==null) {
          try {
              Class.forName("com.mysql.jdbc.Driver");
             conector = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/uno?autoReconnect=true&useSSL=false"
          , "alex", "1234"); 
              
          } catch (ClassNotFoundException |SQLException ex) {
              Logger.getLogger(ConexionSin.class.getName()).log(Level.SEVERE, null, ex);
          }
          
      }
   }

    public static Connection getConector() {
        if(conector==null) new ConexionSin();
        return conector;
    }
    public static void cerrar(){
       try {
           conector.close();
       } catch (SQLException ex) {
           Logger.getLogger(ConexionSin.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    
}
