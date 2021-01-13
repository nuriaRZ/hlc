<%-- 
    Document   : vistaAdministrador
    Created on : 09-nov-2020, 17:24:02
    Author     : nurie
--%>

<%@page import="controller.EstudianteControlador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("USR")==null){
                response.sendRedirect("index.jsp");
            }else{
                ArrayList<Persona> estudiantes = EstudianteControlador.leerFichero("D:\\estudiantes.dat");
                if(estudiantes != null){
                    %>
                    
                    <table border="1">
				<thead>
					<tr>
                                                <th>Id</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Fecha de nac</th>
						<th>Carrera</th>
                                                <th>Semestre</th>
						<th>Email</th>                                                
					</tr>
				</thead>
				<tbody>
				<%
					for (Persona estudiante : estudiantes) {
						out.println("<tr>");
                                                out.println("<td>" + estudiante.getId() + "</td>");
						out.println("<td>" + estudiante.getNombre() + "</td>");
						out.println("<td>" + estudiante.getApellidos() + "</td>");
						out.println("<td>" + estudiante.getFecha_nac() + "</td>");
						out.println("<td>" + estudiante.getCarrera() + "</td>");
                                                out.println("<td>" + estudiante.getSemestre() + "</td>");
						out.println("<td>" + estudiante.getEmail() + "</td>");
						out.println("</tr>");
					}
				%>
				</tbody>
                    </table><br>
                    <form action="GuardarEstudiante" method="post">
                        <input type="submit" name="nuevo" value="Nuevo Estudiante">
                    </form>
                                        
			<%
                    
                }
            }
            %>
    </body>
</html>
