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
import static ums.AddCourseServlet.DB_URL;
import static ums.AddCourseServlet.JDBC_DRIVER;

/**
 *
 * @author Saloni
 */
@WebServlet(name = "GenerateTimetable", urlPatterns = {"/GenerateTimetable"})
public class GenerateTimetable extends HttpServlet {

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
            out.println("<title>Servlet GenerateTimetable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerateTimetable at " + request.getContextPath() + "</h1>");
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
            int room = 1;
            double time = 9.15;
            int dayCount = 0;
            String days[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
            String deletequeryString = "delete from courseschedule";
            ResultSet rset1 = stmt.executeQuery(deletequeryString);
            queryString = "select * from courses order by section asc";
            ResultSet rset = stmt.executeQuery(queryString);
            //rset.getMetaData().get
            int count = 0;
            PreparedStatement pst = connection.prepareStatement("insert into courseschedule(coursenum,section,day,time,location) values(?,?,?,?,?)");
            while (rset.next()) {
                int credit = rset.getInt("credit");
                String courseNum = rset.getString("coursenum");
                String section = rset.getString("section");
                if (room < 3) {
                    if (time + credit > 21.15) {
                        room++;
                        if(room==3){
                            room = 1;
                            dayCount++;
                            if(dayCount==7){
                                dayCount = 0;
                            }
                        }
                        time = 9.15;
                    }/*else{
                     time = time+credit;
                     }*/

                } /*else {
                    room = 1; 
                    if(dayCount<7){
                        dayCount++;
                    }else{
                        dayCount = 0;
                    }
                    
                }*/
                String location = "Room" + room;
                
                String Time;
                if(time<12.15){
                   Time = time + " AM";
                }else{
                   Time = time + " PM";
                }
                
                //stmt.executeUpdate("insert into courseschedule(coursenum,section,day,time,location) values('"+courseNum+"','"+section+"','"+days[dayCount]+"','"+time+"','"+location+"')");

                pst.setString(1, courseNum);
                pst.setString(2, section);
                pst.setString(3, days[dayCount]);
                pst.setString(4, Time);
                pst.setString(5, location);
                pst.executeUpdate();
                time = time + credit;
                count++;
            }
            out.println("Inserted Successfully");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/viewCourse.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GenerateTimetable.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GenerateTimetable.class.getName()).log(Level.SEVERE, null, ex);
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
        //processRequest(request, response);

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
