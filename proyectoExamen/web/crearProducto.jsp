<%-- 
    Document   : crear
    Created on : 30-nov-2020, 20:50:52
    Author     : nurie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="model.ConexionConf"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
       
        <h1>Nuevo producto</h1>
        <form action="insertarProducto" method="Post">
           <div class='form-group'>
              <label>Id Producto: </label>
              <%
                   
                Statement s = ConexionConf.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT id FROM productos ORDER BY id DESC LIMIT 1");
                while(rs.next()){
                    %>
                    <input type='text' name='idProducto' value=<% out.println( rs.getInt(1)+1); %> readonly>   
                    <%
                }   
              %>        
            </div>
            <div class='form-group'>
              <label>Nombre: </label>
              <input type='text' name='nombre' value='' >
            </div>
            <div class='form-group'>
              <label>Cantidad: </label>
              <select name="cantidad">
                  <%
                      for(int i=0; i<=10; i++){
                          out.println("<option value='"+i+"'>"+i+"</option>");
                      }
                      %>
              </select>
            </div>
            <div class='form-group'>
              <label>Precio: </label>
              <input type='text' name='precio' value='' >
            </div>     
              <input type='submit' class="btn btn-primary" name='guardarProducto' value='Guardar'>
        </form>    
        <form action="vistaAdministrador.jsp" method="post">
            <input type="submit" class="btn btn-danger" name="cancelarPr" value="Cancelar">
        </form>
    
</htm   
