/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author nurie
 */
public class ConexionConf {
    private static Connection con=null;
   public static Connection getConnection(){
    

   try{
         if( con == null ){
            String driver="com.mysql.jdbc.Driver"; //el driver varia segun la DB que usemos
            String url="jdbc:mysql://localhost:3306/proyectohlc?serverTimezone=UTC";
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
