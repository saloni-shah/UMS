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

/**
 *
 * @author Saloni
 */
//@WebServlet(urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
        static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
        static final String USER = "hr";
        static final String PASS = "hr";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        Connection conn = null;
        Statement stmt = null;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String status;
            //Class.forName("com.mysql.jdbc.Driver");
            Class.forName(JDBC_DRIVER);
            conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Database..");
            stmt = conn.createStatement();
            //String sql = "SELECT id, userId, password FROM login";
            //ResultSet rs = stmt.executeQuery(sql);
            String queryString = "select * "
                    + "from users "
                    + "where username = \'" + user + "\' and password = \'" + pass +"\'";

            ResultSet rset = stmt.executeQuery(queryString);
           
            if (rset.next()) {
                String userType = rset.getString("type");
                if(userType!=null){
                    request.setAttribute("Message", "Your Login was Successful..");
                    if(userType.equals("admin")){
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/viewCourse.jsp");
                        dispatcher.forward(request, response);
                    }if(userType.equals("faculty")){
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/viewCourse.jsp");
                        dispatcher.forward(request, response);
                    }if(userType.equals("student")){
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/viewCourse.jsp");
                        dispatcher.forward(request, response);
                    }
                    //status = "Login was successful"; 
                    //out.println("<b>"+status+"</b><br>"); 
                  
                    //out.println("<b>"+status+"</b><br>"); 
                }
            }else{
                status = "Invalid Username and password...Please try again.."; 
                out.println("<h3>"+status+"</h3><br>");
                //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HTML/login.html");
                 //   dispatcher.forward(request, response);
                String referer = request.getHeader("Referer");
                response.sendRedirect(referer);
            }
            
            
        }   catch (ClassNotFoundException ex) {
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
