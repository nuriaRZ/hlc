<%-- 
    Document   : listaUsuarios
    Created on : 08-dic-2020, 23:15:23
    Author     : nurie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista Usuarios!</h1>
        <%     Statement s = (Statement) Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM usuarios");
        %>
    <table class="table">
            <thead>
                <tr class="table-info">
                    <th>imagen</th>
                    <th>Usuario</th>
                    <th>Contraseña</th>
                </tr>
            </thead>
            <tbody>
                <%
                   while(rs.next()) {
                        out.println("<tr class=''>");
                        %>
                        <td><img src="<%out.print("images\\"); out.print(rs.getString("avatar"));%>" width="50px" height="50px"></td>
                        <%
                        out.println("<td>" + rs.getString("usuario") + "</td>");
                        out.println("<td>" + rs.getString("password") + "</td>");                        
                        out.println("</tr>");
                     }
                %>
            </tbody>
        </table>
        
        <div class="btn-group">
            <form action="vistaAdministrador.jsp">
                <button type="submit" name="volver" class="btn btn-outline-info">Volver</button>
            </form>
        </div>
    </body>
</html>
