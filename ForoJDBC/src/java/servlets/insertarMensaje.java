/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Conexion;

/**
 *
 * @author nurie
 */
public class insertarMensaje extends HttpServlet {

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
        Statement s = Conexion.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT id FROM mensajes ORDER BY id DESC LIMIT 1");
        int id=0;
        while(rs.next()){
             id = rs.getInt(1)+1;
        }
        rs.close();
        
        String remitente = request.getParameter("remitente"); 
        String destinatario = request.getParameter("destinatario"); 
        String mensaje = request.getParameter("mensaje");
   
        
        try (PrintWriter out = response.getWriter()) {
            String sentencia = "insert into mensajes values (?,?,?,?)";
        PreparedStatement ps = Conexion.getConnection().prepareStatement(sentencia);
        ps.setInt(1, id);
        ps.setString(2, mensaje);
        ps.setString(3, remitente);
        ps.setString(4, destinatario);
        
        ps.executeUpdate();
        ps.close(); 
        if(remitente.equals("admin")){
           response.sendRedirect("vistaAdministrador.jsp"); 
        }else{
            response.sendRedirect("vistaUsuario.jsp"); 
        }
        
            
        }catch(SQLException ex){
            Logger.getLogger(insertarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            out.println("error no se pudo actualizar");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertarMensaje.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insertarMensaje.class.getName()).log(Level.SEVERE, null, ex);
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
