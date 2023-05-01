/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pk.controles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import pk.dao.MyUtile;

/**
 *
 * @author HP
 */
@MultipartConfig
@WebServlet(name = "addroom", urlPatterns = {"/addroom"})
public class addroom extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * //
     * <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     * /**
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
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String type= request.getParameter("typech");
            int nbrlit = Integer.parseInt(request.getParameter("nbrlit"));
            int nolit = Integer.parseInt(request.getParameter("typelit"));
            int breakfast = Integer.parseInt(request.getParameter("breakfast"));
            int parking = Integer.parseInt(request.getParameter("parking"));
            int prix = Integer.parseInt(request.getParameter("prix"));

            Part p = request.getPart("img");

            Connection con = MyUtile.seConnecter();
            String req = "insert into chambre values(seq_ch.nextval,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(req);
            ps.setString(1, type);
            ps.setInt(2, nbrlit);
            String img = p.getName().substring(0, p.getName().indexOf(".")) + new SimpleDateFormat("ddmmyyyy").format(new Date()) + ".jpg";
            ps.setString(6, img);
            ps.setInt(4, prix);
            ps.setString(3, description);
            if(breakfast==1){
                 ps.setInt(5, 1); 
            }else{
                   ps.setInt(5, 0);
            }
             if(parking==1){
                 ps.setInt(8, 1); 
            }else{
                   ps.setInt(8, 0);
            }
               ps.setInt(7, nolit);
                 ps.setString(9, title);
            ps.executeUpdate();
            p.write(request.getRealPath("/chambres/") + "/" + img);
            request.getRequestDispatcher("//jsp/Rooms.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(addroom.class.getName()).log(Level.SEVERE, null, ex);
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
