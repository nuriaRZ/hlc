/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.AdminController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comentario;
import model.Usuario;

/**
 *
 * @author nurie
 */
@WebServlet(name = "NuevoComentario", urlPatterns = {"/NuevoComentario"})
public class NuevoComentario extends HttpServlet {

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
            out.println("<title>Servlet NuevoComentario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NuevoComentario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            String boton = request.getParameter("nuevoComent");
            String usuario = request.getParameter("usuario");
            String fichero = "D:\\usuarios.dat";
            ArrayList<Usuario> usuarios = AdminController.leerFichero(fichero);
            
            if(boton != null){
                String ficheroComen = "D:\\comentarios.dat";
                ArrayList<Comentario> comentarios = AdminController.leerFicheroComentarios(ficheroComen);
                String texto = request.getParameter("nuevoComent");
                Comentario c = new Comentario(Integer.parseInt(request.getParameter("id")), texto, (Usuario) request.getSession().getAttribute("USR"));
                comentarios.add(c);
                AdminController.guardarArrayListComentarios(comentarios, ficheroComen);
                System.out.println("Comentario guardado");
                response.sendRedirect("index.jsp");
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
