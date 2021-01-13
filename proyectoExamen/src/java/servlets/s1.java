/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ConexionConf;

/**
 *
 * @author nurie
 */
public class s1 extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        try (PrintWriter out = response.getWriter()){
            out.println(password);
            out.println(usuario);
            Statement s = ConexionConf.getConnection().createStatement();
            ResultSet rs = s.executeQuery("Select * from usuarios where usuario='"+usuario+"' and password='"+password+"'");
            if(rs != null && rs.next()){
                if(usuario.equals("admin")){                    
                    response.sendRedirect("vistaAdministrador.jsp");                
                }else{
                
                request.getSession().setAttribute("usuario", rs.getString(1));
                request.getSession().setAttribute("password", rs.getString(2));
                request.getSession().setAttribute("nombre", rs.getString(3));
                request.getSession().setAttribute("apellidos", rs.getString(4));
                request.getSession().setAttribute("localidad", rs.getString(5));
                request.getSession().setAttribute("direccion", rs.getString(6));
                response.sendRedirect("vistaUsuario.jsp");
                }
            }
            s.close();
            rs.close();
        }
    }
    public static void main (String[] args) throws SQLException{
        
        Statement s = (Statement) ConexionConf.getConnection().createStatement();
        ResultSet rs = s.executeQuery("select * from usuarios");
        while (rs.next()){
            System.out.println(rs.getString("nombre"));
            System.out.println(rs.getString("apellidos"));
            System.out.println(rs.getString("localidad"));
            System.out.println(rs.getString("direccion"));
            
        }
        rs.close();
        s.close();
        
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(s1.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(s1.class.getName()).log(Level.SEVERE, null, ex);
        }
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
