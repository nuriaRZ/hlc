<%-- 
    Document   : vistaNuevoMensaje
    Created on : 19-nov-2020, 20:33:45
    Author     : nurie
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Comentario"%>
<%@page import="controller.AdminController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
	
		<h1>Crea un nuevo mensaje</h1>
	

	<div>

		<form action="NuevoComentario" method="post">

			<div>
				 Comentario: <textarea name="nuevoComent" rows="10" cols="50">Escribe tu comentario</textarea>
				 <br> 
				 <br>
				 
				 <%
String ficheroComent = "D:\\comentarios.dat";
ArrayList<Comentario> comentarios = AdminController.leerFicheroComentarios(ficheroComent); 
for(Comentario c: comentarios){
	
	
	%>
	<input type="hidden" name="id" value="<%= comentarios.get(comentarios.size()-1).getId() + 1%>">
	<% 
	}
%>
				 
				<input type="submit" name="crear"  value="Crear">
			</div>
		</form>
	</div>
</div>
    </body>
</html>
