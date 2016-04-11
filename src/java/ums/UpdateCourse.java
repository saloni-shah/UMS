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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static ums.AddCourseServlet.JDBC_DRIVER;

/**
 *
 * @author Saloni
 */
@WebServlet(name = "UpdateCourse", urlPatterns = {"/UpdateCourse"})
public class UpdateCourse extends HttpServlet {

    static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
    static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    static final String USER = "hr";
    static final String PASS = "hr";
    private Object connection;

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
            out.println("<title>Servlet UpdateCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCourse at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection connection = null;
        PreparedStatement pst;
        try {
            String courseNum = request.getParameter("coursenumber");
            String section = request.getParameter("section");

            String title = request.getParameter("title");
            int credit = Integer.parseInt(request.getParameter("credit"));
            String department = request.getParameter("department");
            String term = request.getParameter("term");
            String status;
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            String updateTableSQL = "UPDATE COURSES SET TITLE = ?, CREDIT = ?, TERM = ?"
                    + " WHERE courseNum = ? AND section = ? AND department = ?";
            pst = connection.prepareStatement(updateTableSQL);

            // pst.setString(2, section);
            pst.setString(1, title);
            pst.setInt(2, credit);

            pst.setString(3, term);
            pst.setString(4, courseNum);
            pst.setString(5, section);
            pst.setString(6, department);
            pst.executeUpdate();
            status = "Course updated successfully...";
            out.println("<b>" + status + "</b><br>");
            request.setAttribute("Message", "Course updated successfully.Please generate Timetable...");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/editRemove.jsp");
            dispatcher.forward(request, response);
            } catch (ClassNotFoundException | SQLException | NullPointerException ex) {
            Logger.getLogger(AddCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AddCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
