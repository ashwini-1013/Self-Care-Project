/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.self.care.servlets;

import com.self.care.entities.Database;
import com.self.care.entities.Helper;
import com.self.care.entities.Message;
import com.self.care.entities.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kavit
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch all data
            String userName = request.getParameter("user_name");

            Part part = request.getPart("user_profile");
            String imgName = part.getSubmittedFileName();
            
            String userAbout = request.getParameter("user_about");

            //get the user from the session:-
            HttpSession s = request.getSession();
            
            User user = (User) s.getAttribute("currentUser");
            String oldFile = user.getProfile();
            user.setName(userName); 
            user.setProfile(imgName);
            user.setAbout(userAbout);

            //update database:-
            Database db = new Database(Database.getConnection());
            boolean ans = db.updateUser(user);

            //delete file code:-
            String oldPath = request.getRealPath("/") + "pics" + File.separator + oldFile;
                if (!oldFile.equals("profile.jpg")) {
                    Helper.deleteFile(oldPath);
                }
            
            if (ans) {
                
                String newPath = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

                


                if (Helper.saveFile(part.getInputStream(),newPath)) {
                    out.println("Profile updated");
                    Message msg = new Message("Profile updated...", "success", "alert-success");

                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Something went wrong...", "error", "alert-danger");

                    s.setAttribute("msg", msg);
                }

            } else {
                Message msg = new Message("Something went wrong...", "error", "alert-danger");

                s.setAttribute("msg", msg);
            }

            response.sendRedirect("profile.jsp");
            
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
