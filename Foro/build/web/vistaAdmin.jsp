<%-- 
    Document   : vistaAdmin
    Created on : 18-nov-2020, 20:22:32
    Author     : nurie
--%>

<%@page import="model.Comentario"%>
<%@page import="controller.AdminController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("USR") == null){
                response.sendRedirect("index.jsp");
            }else{
                ArrayList<Comentario>comentarios = AdminController.leerFicheroComentarios("D:\\comentarios.dat");
                if(comentarios != null){
           
            %>
            <div class="container">
                <h1>Lista</h1>
                <table border="1px">
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Comentario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for(Comentario c : comentarios){
                                out.println("<tr>");
					out.println("<td>" + c.getUsuario().getUsuario() + "</td>");
					out.println("<td>" + c.getComentario() + "</td>");
					out.println("<td>" + "<form action='Borrar' method='post'><button type='submit' name='eliminar' value='"+c.getId()+"'>Borrar</button></form>"+ "</td>");
					out.println("</tr>");
                            }
                            %>
                    </tbody>
                </table>
           

        <form action="index.jsp" method="post">
            <input type="submit" name="cerrar" value="Cerrar Sesión">
        </form>
       
                            <%
                                    }
                                }
                            %>
    </body>
</html>
