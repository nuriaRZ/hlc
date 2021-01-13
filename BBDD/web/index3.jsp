<%-- 
    Document   : index
    Created on : 20-nov-2020, 10:47:45
    Author     : alex
--%>

<%@page import="modelo.Persona"%>
<%@page import="modelo.Lista"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.ConexionSin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC</title>
    </head>
    <body>
        <h1>JDBC!</h1>
        <%  Connection miconexion = ConexionSin.getConector();
           // Statement instruccion = miconexion.createStatement(
            // ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
           //String sentencia = "select * from persona";
            //String sentencia="update persona set nombre=\"jose\" where nombre=\"pepe\"";
             String sentencia="insert into persona values(?,?,?)";
             PreparedStatement instruccion=miconexion.prepareStatement(sentencia);
             
            instruccion.setInt(1, 8);
            instruccion.setString(2, "Carlitos");
             instruccion.setString(3, "Sánchez");
            instruccion.executeUpdate();
            instruccion.close();
           
            Statement instruccion2 = miconexion.createStatement(
             ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = instruccion2.executeQuery("select * from persona");

            while (rs.next()) {
                out.println(rs.getInt("id"));
                out.println(rs.getString("nombre"));
                out.print(rs.getString(3));
                out.println();

            }
            rs.beforeFirst();
            Lista milista=null;
            
            while(rs.next()){
                milista.add(new Persona(rs.getInt("id"),rs.getString("nombre"),
               rs.getString(3) ));
                
            }
            
            //Actualización mediante updateString       
            /*  rs.absolute(2);
        rs.updateString("apellido", "Pérez");
        rs.updateRow();*/
            //Inserción mediante insertRow()
         /*   rs.moveToInsertRow();
            rs.updateString("nombre", "jesús");
            rs.updateString("apellido", "maestre");
            rs.updateInt(1,4);
            rs.insertRow();*/
            
          //Borrado mediante deleteRow
          /*  rs.last();
            rs.deleteRow();
                       
            rs.beforeFirst();*/
         
          String sentencia2 = "delete from persona where nombre='TTTTTT'";
          instruccion2.executeUpdate(sentencia2);
                  

          /*  while (rs.next()) {
                out.println(rs.getInt("id"));
                out.println(rs.getString("nombre"));
                out.print(rs.getString(3));

            }*/
            rs.close();
            instruccion2.close();


        %>
    </body>
</html>
