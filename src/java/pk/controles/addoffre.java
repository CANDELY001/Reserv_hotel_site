/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pk.controles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
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


@MultipartConfig
@WebServlet(name = "addoffre", urlPatterns = {"/addoffre"})
public class addoffre extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

            int promo = Integer.parseInt(request.getParameter("promo"));
            String title = request.getParameter("title");
            String detail = request.getParameter("detail");
            int idservice = Integer.parseInt(request.getParameter("idservice"));
            String img = null;
            if (request.getPart("img") != null) {
                Part p = request.getPart("img");
                img = p.getName().substring(0, p.getName().indexOf(".")) + new SimpleDateFormat("ddMMyyyy").format(new Date()) + ".jpg";
                p.write(request.getRealPath("/pics/") + "/" + img);
            }
            Connection con = MyUtile.seConnecter();
            String req = "insert into offre values(seq_idoffre.nextval,?,?,?,sysdate,sysdate+30,?,?)";
            PreparedStatement ps = con.prepareStatement(req);
            ps.setString(1, detail);
            ps.setInt(3, idservice);
            ps.setString(4, img);
            ps.setString(5, title);
            ps.setInt(2, promo);
            ps.executeUpdate();

            request.getRequestDispatcher("//jsp/Offres.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(addoffre.class.getName()).log(Level.SEVERE, null, ex);
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
