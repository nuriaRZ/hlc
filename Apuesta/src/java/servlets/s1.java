/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nurie
 */
@WebServlet(name = "s1", urlPatterns = {"/apuesta"})
public class s1 extends HttpServlet {
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
        if(request.getParameter("apostar") != null){
                String valor = request.getParameter("valor");
                float cantidad = Float.parseFloat(request.getParameter("cantidad"));
                String nombre = request.getParameter("nombre");
                
                if(valor.equals("1")) cantidad *= 1.85;
                if(valor.equals("x")) cantidad *= 2.00;
                if(valor.equals("2")) cantidad *= 1.9;
                 
                request.setAttribute("cantidad", cantidad);
                request.setAttribute("nombre", nombre);
                
            }
            else{
                String opcion = request.getParameter("opcion");
                String enviar = request.getParameter("enviar");                
                
                if(opcion.equals("ganar")) request.setAttribute("acertar", true);
                if(opcion.equals("perder")) request.setAttribute("acertar", false);                
                
                request.setAttribute("enviar", enviar);
                request.setAttribute("cantidad", Float.parseFloat(request.getParameter("cantidad")));
            }
            request.getRequestDispatcher("opciones.jsp").forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<body>");
		out.println("F");
		out.println("</body>");
		out.println("</html>");
	}
}
    

