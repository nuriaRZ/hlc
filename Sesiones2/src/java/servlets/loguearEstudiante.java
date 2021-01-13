/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.EstudianteControlador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Administrador;
import modelo.Persona;

/**
 *
 * @author nurie
 */
public class loguearEstudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loguearEstudiante</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loguearEstudiante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            Boolean logueado = false;
            Boolean logAdmin = false;
            Boolean logPersona = false;
            String fichero = "D:\\estudiantes.dat";
            String ficheroAdmin = "D:\\estudiantesAdmin.dat";
            Persona p = null;
            Administrador adm = null;
            ArrayList<Persona> estudiantes = EstudianteControlador.leerFichero(fichero);
            for (Persona est : estudiantes){
                if(est.getNombre().equals(request.getParameter("nombre")) && est.getPassword().equals(request.getParameter("password"))){
                    logueado = true;
                    logPersona = true;
                    p = est;
                    
                }
            }
            ArrayList<Administrador> administradores = EstudianteControlador.leerFicheroAdmin(ficheroAdmin);
            for (Administrador a : administradores){
                if(a.getUsuario().equals(request.getParameter("nombre")) && a.getPass().equals(request.getParameter("password"))){
                    logueado = true;
                    logAdmin = true;
                    adm = a;
                    
                }
            }
                if (!logueado){ 
                    response.sendRedirect("index.jsp");
            }else if (logAdmin==true){                    
                    request.getSession().setAttribute("USR", adm);
                    request.getRequestDispatcher("vistaAdministrador.jsp").forward(request, response);
                }else if (logPersona==true){
                    request.getSession().setAttribute("USR", p);
                    request.getRequestDispatcher("lista.jsp").forward(request, response);
                }
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
