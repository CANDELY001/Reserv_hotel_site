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
import pk.dao.MyUtile;

/**
 *
 * @author HP
 */
@WebServlet(name = "SigninServlet", urlPatterns = {"/SigninServlet"})
public class SigninServlet extends HttpServlet {

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

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login=request.getParameter("mail");
                String mdp1=request.getParameter("pss1");
                String mdp2=request.getParameter("pss2");
                String user=request.getParameter("user");
                if(mdp1.equals(mdp2)){
            try {
                  Connection con=MyUtile.seConnecter();
                 Statement s=con.createStatement();
               ResultSet rs=s.executeQuery("select count(*) from visiteur where email like '"+login+"'");
              if(rs.next() && rs.getInt(1)>=1){
            
                 request.setAttribute("up", " This Email already exist.");
                                request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
            
              }else{
                      PreparedStatement st=con.prepareStatement("insert into visiteur values(?,?,?,null)");
                st.setString(1, user);
                st.setString(2, login);
                st.setString(3, mdp1);
                st.executeUpdate();
                System.out.println("jhgjgf");
                request.setAttribute("msg", "Please, re-enter your informations.");
                                request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
              }
            } catch (Exception ex) {
                Logger.getLogger(SigninServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                    
                }else{
                
                    request.setAttribute("up", "Your passwords don't match.");
                     request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
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
