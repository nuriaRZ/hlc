/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nurie
 */
public class Conexion {
      private static Connection con=null;
   public static Connection getConnection(){
   try{
         if( con == null ){
            String driver="com.mysql.cj.jdbc.Driver"; //el driver varia segun la DB que usemos
            String url="jdbc:mysql://localhost:3306/forojdbc?serverTimezone=UTC";
            String pwd="1234";
            String usr="java";
            Class.forName(driver);
            con = DriverManager.getConnection(url,usr,pwd);
            System.out.println("Conection Succesfull");
         }
     }
     catch(ClassNotFoundException | SQLException ex){
        ex.printStackTrace();
     }
     return con;
   }
}
