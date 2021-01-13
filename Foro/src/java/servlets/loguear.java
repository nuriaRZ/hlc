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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Administrador;
import model.Usuario;

/**
 *
 * @author nurie
 */
public class loguear extends HttpServlet {

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
            out.println("<title>Servlet loguear</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loguear at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            boolean logueado = false;
            boolean logAdmin = false;
            boolean logUsuario = false;
            String ficheroUsuarios = "D:\\usuarios.dat";
            String ficheroAdmin = "D:\\admin.dat";
            Usuario usu = null;
            Administrador adm = null;
            ArrayList<Administrador> admin = AdminController.leerFicheroAdmin(ficheroAdmin);
            
            for(Administrador a : admin){
                if(a.getUsuario().equals(request.getParameter("usuario"))&& a.getPass().equals(request.getParameter("pass"))){
                    logueado = true;
                    logAdmin = true;
                    adm = a;
                    
                }
            }
            ArrayList<Usuario> usuarios = AdminController.leerFichero(ficheroUsuarios);
            for(Usuario u : usuarios){
                if(u.getUsuario().equals(request.getParameter("usuario")) && u.getPassword().equals(request.getParameter("pass"))){
                logueado = true;
                logUsuario = true;
                usu = u;
                
            }
            }
            if(!logueado){
                response.sendRedirect("index.jsp");                
            }else if (logAdmin == true){
                request.getSession().setAttribute("USR", adm);
                response.sendRedirect("vistaAdmin.jsp");
            }else if (logUsuario == true){
                request.getSession().setAttribute("USR", usu);
                response.sendRedirect("vistaUsuario.jsp");
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
