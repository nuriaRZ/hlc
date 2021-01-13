package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nurie
 */
public class contador extends HttpServlet {

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
            
            Cookie[] cookies = request.getCookies();
            Cookie contador = buscaCookie("contador", cookies);
            
            if(contador == null){
                Cookie c = new Cookie ("contador", "1");
                c.setMaxAge(180);
                response.addCookie(c);
                 out.println ("<HTML>");            
                out.println ("<BODY>");            
                out.println ("Primera visita"); 
                out.println ("<BR>");
                out.println ("</BODY>");
                out.println ("</HTML>");
            }else{
                int cont = Integer.parseInt(contador.getValue());
                cont++;
                Cookie c = new Cookie ("contador", "" + cont);
                c.setMaxAge(180);
                response.addCookie(c); 
                out.println ("<HTML>");
                out.println ("<BODY>");
                out.println ("Visita numero " + cont);
                out.println ("<BR>");
                out.println ("</BODY>");
                out.println ("</HTML>");
            }
        }
        
    }
    private Cookie buscaCookie(String nombre, Cookie[] cookies){
         if(cookies == null) return null;
         for (int i = 0; i < cookies.length; i++) {
             if(cookies[i].getName().equals(nombre)) return cookies[i];
            
         }
        return null;
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
