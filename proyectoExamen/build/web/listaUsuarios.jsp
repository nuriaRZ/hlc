<%-- 
    Document   : listaUsuarios
    Created on : 04-dic-2020, 11:25:57
    Author     : nurie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="model.ConexionConf"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Usuarios</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Lista Usuarios</h1>
               <%
                Statement s = ConexionConf.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM usuarios"); 
            %>
            <table class="table">
            <thead>
                <tr class="table-info">
                    <th>Usuario</th>
                    <th>Contraseña</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>  
                    <th>Localidad</th>
                    <th>Direccion</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>            
            <tbody>
                <%
                    
                   while(rs.next()) {    
                       String usuario = rs.getString("usuario");
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getString("usuario")+ "</td>");
                        out.println("<td>" + rs.getString("password") + "</td>");
                        out.println("<td>" + rs.getString("nombre") + "</td>");
                        out.println("<td>" + rs.getString("apellidos") + "</td>");
                        out.println("<td>" + rs.getString("localidad") + "</td>");
                        out.println("<td>" + rs.getString("direccion") + "</td>");                        
                     
            out.println("<form action='verUsuario' method='post'>");
            out.println("<input type='hidden' name='usuario' value='"+usuario+"'>");
            out.println("<td><button type='submit'  class='btn btn-outline-info' name='editar'>editar</button> </td>");            
           out.println("</form>");  
           out.println("<form action='borrarUsuario' method='post'>");
            out.println("<input type='hidden' name='usuario' value='"+usuario+"'>");
            out.println("<td><button type='submit'  class='btn btn-outline-warning' name='borrar'>borrar</button> </td>");            
           out.println("</form>"); 
                   
                        out.println("</tr>");
                     }
                %>
            </tbody>
        </table>
        
         <div class="btn-group">
            <form action="index.jsp">
                <button type="submit" name="volver" class="btn btn-outline-danger">Volver</button>
            </form>
         </div>
         <div class="btn-group">
            <form action="vistaAdministrador.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Productos</button>
            </form>
        </div>
         <div class="btn-group">
            <form action="crearUsuario.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Nuevo usuario</button>
            </form>
        </div>
         
    </body>
</html>
