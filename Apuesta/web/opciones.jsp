<%-- 
    Document   : opciones
    Created on : 24-oct-2020, 19:34:28
    Author     : nurie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Opciones</h1>
        <form name="form2" action="s1" method="post">
            <input type="radio" id="opcion" name="opcion" value="ganar">
            <label for="acertar">Ganar</label><br>
            <input type="radio" id="opcion" name="opcion" value="perder">
            <label for="perder">Perder</label><br>
             <input type="submit" value="Enviar" name="enviar"/> 
             <input type="hidden" name="nombre" value="<%= request.getAttribute("nombre")%>">
             <input type="hidden" name="cantidad" value="<%= request.getAttribute("cantidad")%>">             
        </form>
        
        <%
	
	if(request.getAttribute("enviar") != null){
		if ((Boolean) request.getAttribute("acertar") == true) {
			float cantidad = (float)request.getAttribute("cantidad");			
			out.println("Has ganado: " + cantidad);
		} else {
			out.println( "Has perdido la apuesta");
		}
	}	
	%>
    </body>
</html>