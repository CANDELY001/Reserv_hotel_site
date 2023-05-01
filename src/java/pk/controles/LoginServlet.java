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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pk.Models.Cryptage;
import pk.Models.Visiteur;
import pk.dao.MyUtile;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        String mail = request.getParameter("email");
        String mdp = request.getParameter("mdp");
        try {
            Connection con = MyUtile.seConnecter();
            PreparedStatement st = con.prepareStatement("select * from visiteur where email=? and mdp=?");
            st.setString(1, mail);
            st.setString(2, mdp);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("etate").equals( null)) {
                    HttpSession s = request.getSession();
                    s.setAttribute("v", new Visiteur(rs.getString(1), rs.getString(2), rs.getString(3), "null"));
                    if (request.getParameter("rememberme") != null) {
                        Cookie ck = new Cookie("auth", mail + "/" + mdp);
                        ck.setMaxAge(60 * 60 * 24 * 31 * 6);
                        response.addCookie(ck);
                    }
                    request.getRequestDispatcher("//Accueil.jsp").forward(request, response);
                } else if(rs.getString("etate").equals("up")){
                    HttpSession s = request.getSession();
                    s.setAttribute("v", new Visiteur(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                    if (request.getParameter("rememberme") != null) {
                        Cookie ck = new Cookie("auth", mail + "/" + mdp);
                        ck.setMaxAge(60 * 60 * 24 * 31 * 6);
                        response.addCookie(ck);
                    }
                    request.getRequestDispatcher("//jsp/Accueil2.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Email or Password is incorrect!");
                request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
