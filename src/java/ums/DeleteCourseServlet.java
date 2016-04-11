/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ums;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static ums.GenerateTimetable.JDBC_DRIVER;

/**
 *
 * @author Saloni
 */
@WebServlet(name = "DeleteCourseServlet", urlPatterns = {"/DeleteCourseServlet"})
public class DeleteCourseServlet extends HttpServlet {
    
    static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
    static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    static final String USER = "hr";
    static final String PASS = "hr";
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
            out.println("<title>Servlet DeleteCourseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCourseServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection connection = null;
        Statement stmt = null;
        try {
            String queryString;
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Driver loaded");
            stmt = connection.createStatement();
            String status;
            String courseNum = request.getParameter("id");
            String section = request.getParameter("section");
            queryString = "delete from courseschedule where courseNum = \'" + courseNum + "\' and section = \'" + section +"\'";
            ResultSet rset = stmt.executeQuery(queryString);
            String deletequeryString = "delete from courses where courseNum = \'" + courseNum + "\' and section = \'" + section +"\'";
            ResultSet rset1 = stmt.executeQuery(deletequeryString);
            status = "Course deleted successfully...";
            out.println("<b>" + status + "</b><br>");
            request.setAttribute("Message", "Course deleted successfully.Please generate Timetable...");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/editRemove.jsp");
            dispatcher.forward(request, response);
            } catch (ClassNotFoundException | SQLException | NullPointerException ex) {
            Logger.getLogger(DeleteCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AddCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
