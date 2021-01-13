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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;

/**
 *
 * @author nurie
 */
@WebServlet(name = "GuardarEstudiante", urlPatterns = {"/GuardarEstudiante"})
public class GuardarEstudiante extends HttpServlet {

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
            out.println("<title>Servlet GuardarEstudiante</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarEstudiante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            Persona estudiante = new Persona(request.getParameter("id"), request.getParameter("nombre"), request.getParameter("apellidos"), 
              request.getParameter("fecha_nac"), request.getParameter("carrera"), request.getParameter("semestre"), request.getParameter("email"), request.getParameter("password"));
            String fichero = "D:\\estudiantes.dat";
            ArrayList<Persona> estudiantes = EstudianteControlador.leerFichero(fichero);
            if(estudiantes == null) estudiantes = new ArrayList<Persona>();
            estudiantes.add(estudiante);
            EstudianteControlador.guardarArrayList(estudiantes, fichero);
            request.getSession().setAttribute("USR", request.getParameter("nombre"));
            request.getRequestDispatcher("lista.jsp").forward(request, response);
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
