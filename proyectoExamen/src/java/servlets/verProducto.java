/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import model.ConexionConf;

/**
 *
 * @author nurie
 */
public class verProducto extends HttpServlet {

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
        PrintWriter out = response.getWriter();   
        
        
        int id = Integer.parseInt(request.getParameter("idProducto"));
        
        Statement s = ConexionConf.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM productos where id='"+id+"'");
             
            while(rs.next()){
            out.println("<html>");    
            out.println("<head>");    
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");    
            out.println("<title>Insertar</title>");
            out.println("<meta charset=\"utf-8\">");    
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");    
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>");
            out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>");
            out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h1>Editar</h1>");
            out.println("<form action='editar' method='post'>");
            out.println("<div class='form-group'>");
            out.println("<label>Id</label>");
            out.println("<input type='text' name='id' value='"+ rs.getInt(1)+"' readonly>");
            out.println("</div>");
            out.println("<div class='form-group'>");
            out.println("<label>Nombre</label>");
            out.println("<input type='text' name='nombre' value='"+rs.getString(2)+"'>");
            out.println("</div>");
            out.println("<div class='form-group'>");
            out.println("<label>Cantidad</label>");
            out.println("<input type='text' name='cantidad' value='"+rs.getInt(3)+"'>");
            out.println("</div>");
            out.println("<div class='form-group'>");
            out.println("<label>Precio</label>");
            out.println("<input type='text' name='precio' value='"+rs.getDouble(4)+"'>");
            out.println("</div>");
            out.println("<input type='submit' class=\"btn btn-primary\" name='guardar' value='Guardar'>");
            out.println("</form>");
            out.println("<form action='vistaAdministrador.jsp' method='post'>");
            out.println("<input type='submit' class=\"btn btn-danger\" name='cancelarProd' value='Cancelar'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
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
            Logger.getLogger(verProducto.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(verProducto.class.getName()).log(Level.SEVERE, null, ex);
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
