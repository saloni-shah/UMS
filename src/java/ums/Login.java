/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ums;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


/**
 *
 * @author ankit
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     /** Initialize variables
     * @throws javax.servlet.ServletException */
     HttpSession session; 

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
        response.setContentType("text/html");        
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
        
            response.setContentType("text/html");
            
            String userName = request.getParameter("userName");
            String pwd = request.getParameter("pwd");
        
       try {
            PrintWriter out = response.getWriter();
           
            // Load the Oracle JDBC Thin driver            
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            
            // Establish a connection
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
            
            if(userName.equalsIgnoreCase("")||userName==null || pwd.equalsIgnoreCase("")|| pwd==null ){
                out.print("Data is mising. Please enter data into all fields.Please click <a href=/UMS/HTML/student_login.html>here</a> to continue..</h4>");
            }
            else{
                String query="select s.firstName from student_detail s where s.userName=? and s.pwd=?";
                PreparedStatement preparedStatement = null;
                
                if(query!=null) {               
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, userName);
                    preparedStatement.setString(2, pwd);
                    ResultSet rs = preparedStatement.executeQuery();
                    if (rs!= null) { 
                        boolean bol=rs.next();
                        if(!bol){
                             out.println("<h4>Data Incorrect. Please click <a href=/UMS/HTML/student_login.html>here</a> to continue..</h4>");
                        }
                        else{
                            do{
                                session=request.getSession(true);
                                session.setAttribute("userName", userName);
                                session.setAttribute("pwd", pwd);
                                
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/student_home_view.jsp");
                                dispatcher.forward(request, response);            
                            }while(rs.next());
                        }
                    }
                    rs.close();
                    preparedStatement.close();
                   connection.close();
                }           
            }     
    
         } catch (SQLException | ClassNotFoundException ex) {
             Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
