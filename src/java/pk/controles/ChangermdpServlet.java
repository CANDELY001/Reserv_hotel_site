/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pk.controles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pk.Models.Visiteur;
import pk.dao.MyUtile;

/**
 *
 * @author HP
 */
@WebServlet(name = "ChangermdpServlet", urlPatterns = {"/ChangermdpServlet"})
public class ChangermdpServlet extends HttpServlet {

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
        HttpSession s = request.getSession();
       if(s.getAttribute("v")!=null){
        Visiteur v = (Visiteur) s.getAttribute("v");
        String pseudo = request.getParameter("nom");
        String mdp1 = request.getParameter("pass11");
        String mdp2 = request.getParameter("pass12");
        Connection con;
        try {
            con = MyUtile.seConnecter();
            System.out.println("kkkkkk1k");
            if (mdp1.equals(mdp2)) {
                request.setAttribute("pass", "Please, entre new password!");
                request.getRequestDispatcher("//Accueil.jsp").forward(request, response);
  System.out.println("kkkkkk1k2");
            } else if (!mdp1.equals(v.getMdp())) {
                request.setAttribute("pass", "Current password invalide!");
                request.getRequestDispatcher("//Accueil.jsp").forward(request, response);
                  System.out.println("kkkkkk3k");
            } else {
                PreparedStatement ps = con.prepareStatement("update visiteur set mdp=? where pseudo=?");
                ps.setString(1, mdp2);
                ps.setString(2, pseudo);
                ps.executeUpdate();
                request.setAttribute("pass", "Password has been changed!");
                request.getRequestDispatcher("//Accueil.jsp").forward(request, response);
  System.out.println("kkkkkk4k");
            }
        
        } catch (Exception ex) {
            Logger.getLogger(ChangermdpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
