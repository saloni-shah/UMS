package ums;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
import ums.loginServlet;

/**
 *
 * @author Saloni
 */
@WebServlet(urlPatterns = {"/AddCourseServlet"})
public class AddCourseServlet extends HttpServlet {

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
        Connection connection = null;
        PreparedStatement pst;
        try {
            String courseNum = request.getParameter("coursenumber");
            int section = Integer.parseInt(request.getParameter("section"));
            String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

            String title = request.getParameter("title");
            int credit = Integer.parseInt(request.getParameter("credit"));
            String department = request.getParameter("department");
            String term = request.getParameter("term");
            String lab = request.getParameter("lab");
            String status;
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            //
            int chNumber = 0;
            Statement stmt = connection.createStatement();
            String queryString = "select max(section) as section from courses where courseNum =\'" + courseNum + "\'";
            ResultSet rset = stmt.executeQuery(queryString);
            if(rset.next()){
                 String maxSection = rset.getString("section");
                 chNumber = maxSection==null ? 0 : alphabets.indexOf(maxSection)+1;
            }
            //
            connection.setAutoCommit(false);
            pst = connection.prepareStatement("insert into courses(coursenum,title,credit,department,term,section) values(?,?,?,?,?,?)");
            for (int i = chNumber; i < section+chNumber; i++) {
                String alphaSections = String.valueOf(alphabets.charAt(i));
                pst.setString(1, courseNum);
                // pst.setString(2, section);
                pst.setString(2, title);
                pst.setInt(3, credit);
                pst.setString(4, department);
                pst.setString(5, term);
                pst.setString(6, alphaSections);
                pst.executeUpdate();
            }
            if ("Yes".equals(lab)) {
                int labCredit = Integer.parseInt(request.getParameter("labcredit"));
                for (int i = chNumber; i < section+chNumber; i++) {
                    String alphaSections = String.valueOf(alphabets.charAt(i));
                    pst.setString(1, courseNum + "L");
                    pst.setString(2, title + " Lab");
                    pst.setInt(3, labCredit);
                    pst.setString(4, department);
                    pst.setString(5, term);
                    pst.setString(6, alphaSections);
                    pst.executeUpdate();
                }
            }
            connection.commit();
            status = "Course added successfully...";
            out.println("<b>" + status + "</b><br>");
            request.setAttribute("Message", "Course added successfully...");
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
