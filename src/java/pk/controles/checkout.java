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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pk.Models.Visiteur;
import static pk.Models.sendMail.SendEmail;
import pk.dao.MyUtile;

/**
 *
 * @author HP
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkout</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkout at " + request.getContextPath() + "</h1>");
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
        try {
            int noclt;
          
            String fullname=request.getParameter("fullname");
            String email=request.getParameter("email");
            String adresse=request.getParameter("adresse");
            String ville=request.getParameter("ville");
            String state=request.getParameter("state");
            String zip=request.getParameter("zip");
            String tel=request.getParameter("Tel");
            Visiteur v=(Visiteur)request.getSession().getAttribute("v");
            Connection con=MyUtile.seConnecter();
            PreparedStatement st=con.prepareStatement("insert into client values(seq_noclt.nextval,?,?,?,?,?,?,?,?)",new int[]{1});
            st.setString(1, fullname);
            st.setString(2, email);
            st.setString(3, adresse);
            st.setString(4, ville);
            st.setString(5, state);
            st.setString(6, zip);
            st.setString(7, tel);
            st.setString(8, v.getPseudo());
            st.executeUpdate();
             ResultSet rs=st.getGeneratedKeys();
            if(rs.next()){
                noclt=rs.getInt(1);
               
                String dated=request.getParameter("dated");
                String  datef=request.getParameter("datef");
                int montant=Integer.parseInt(request.getParameter("montant"));
               int idch=Integer.parseInt(request.getParameter("idch"));
                 java.sql.Date date=java.sql.Date.valueOf(dated);
                 java.sql.Date date2=java.sql.Date.valueOf(datef);
                 PreparedStatement s=con.prepareStatement("insert into Reservation values(seq_idref.nextval,?,?,?,?,?)");
                 System.out.println("hnqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3");
              s.setDate(1,date);
               s.setDate(2,date2);
                s.setInt(3,montant);
        s.setInt(4,noclt);
           s.setInt(5,idch);
           s.executeUpdate();
            
             System.out.println("hnqqqqqqqqqqqqqqqqqqqqqqqqqqqqq2");
                request.getRequestDispatcher("//jsp/Message.jsp").forward(request, response);
      
            }
                    } catch (Exception ex) {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
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
