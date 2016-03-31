package ums;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ums.loginServlet;

/**
 *
 * @author Saloni
 */
@WebServlet(urlPatterns = {"/AddCourseServlet"})
public class AddCourseServlet extends HttpServlet {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/ums";
    static final String USER = "root";
    static final String PASS = "root";
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
            out.println("<title>Servlet AddCourseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCourseServlet at " + request.getContextPath() + "</h1>");
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
        Connection connection;
        PreparedStatement pst;
        //Statement stmt = null;
        //response.setContentType("text/html;charset=UTF-8");
        try {
            String courseNum = request.getParameter("coursenumber");
            String section = request.getParameter("section");
            String title = request.getParameter("title");
            String credit = request.getParameter("credit");
            String department = request.getParameter("department");
            String term = request.getParameter("term");
            String day = request.getParameter("day");
            String time = request.getParameter("time");
            String status;
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Database connected");

            String queryString = "select * "
                    + "from course "
                    + "where course.courseNum = ? ";
            pst = connection.prepareStatement(queryString);
            pst.setString(1, courseNum);
            ResultSet rset = pst.executeQuery();
            if (rset.next()) {
                pst = connection.prepareStatement("insert into courseschedule(courseNum,section,day,time,term) values(?,?,?,?,?)");
                pst.setString(1, courseNum);
                pst.setString(2, section);
                pst.setString(3, day);
                pst.setString(4, time);
                pst.setString(5, term);
                int i = pst.executeUpdate();
                if (i != 0) {
                    out.println("<br>Record has been inserted");
                } else {
                    out.println("failed to insert the data");
                }
            } else {
                pst = connection.prepareStatement("insert into course(courseNum,title,credit,department) values(?,?,?,?)");
                pst.setString(1, courseNum);
               // pst.setString(2, section);
                pst.setString(2, title);
                pst.setString(3, credit);
                pst.setString(4, department);
                pst.executeUpdate();

                pst = connection.prepareStatement("insert into courseschedule(courseNum,section,day,time,term) values(?,?,?,?,?)");
                pst.setString(1, courseNum);
                pst.setString(2, section);
                pst.setString(3, day);
                pst.setString(4, time);
                pst.setString(5, term);
                int i = pst.executeUpdate();

                if (i != 0) {
                    out.println("<br>Record has been inserted");
                } else {
                    out.println("failed to insert the data");
                }

            }
            status = "Course added successfully...";
            out.println("<b>" + status + "</b><br>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/viewCourse.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
