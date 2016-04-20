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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ankit
 */
public class StudentRegistration extends HttpServlet {

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
      
       try {
            PrintWriter out = response.getWriter();
            
           // Load the Oracle JDBC Thin driver       
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String servername="localhost";  
            String serverport="1521";
            String sid="sysdba";
            String url="jdbc:oracle:thin:@"+servername+":"+serverport+":"+sid;
            String username="project";
            String password="myproject";
            
            // Establish a connection
            Connection connection = DriverManager.getConnection(url,username,password);

            int studentId = Integer.parseInt(request.getParameter("student_id"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String userName = request.getParameter("userName");
            String pwd = request.getParameter("pwd");
            String address = request.getParameter("address");
             String type = request.getParameter("type");
            String course = request.getParameter("course");
            
            if(firstName.equalsIgnoreCase("")||firstName==null || lastName.equalsIgnoreCase("")|| lastName==null || dob.equalsIgnoreCase("")
              ||dob==null || phone.equalsIgnoreCase("") ||phone==null || email.equalsIgnoreCase("") || email==null 
              || address.equalsIgnoreCase("") || address==null || type.equalsIgnoreCase("") || type==null){
                out.print("Data is mising. Please enter data into all fields.Please click <a href=/UMS/HTML/register.html>here</a> to continue..</h4>");
            }           
            else{
                String query="update  student_detail s set s.lastName=?,s.dob=?,s.phone=?,s.email=?,s.userName=?,s.pwd=?,s.address=?,type=?,course=?"+
                   "where s.firstName=?and s.student_Id=?";
                PreparedStatement preparedStatement;
           
                if(query!=null) {
                    preparedStatement = connection.prepareStatement(query);
               
                    preparedStatement.setString(1, lastName);
                    preparedStatement.setString(2, dob);
                    preparedStatement.setString(3, phone);
                    preparedStatement.setString(4, email);
                    preparedStatement.setString(5, userName);
                    preparedStatement.setString(6, pwd);
                    preparedStatement.setString(7, address);
                    preparedStatement.setString(8, type);
                    preparedStatement.setString(9, course);
                    preparedStatement.setString(10, firstName);
                    preparedStatement.setInt(11, studentId);
             
                    int updt =preparedStatement.executeUpdate();                
                
                    if(updt==1){
                        out.println("<h4>User Registration Is Sucessful. Please click <a href=/UMS/HTML/student_login.html>here</a> to continue..</h4>");
                    } 
                    else{
                        out.println("<h4>Data Incorrect. Please click <a href=/UMS/HTML/register.html>here</a> to continue..</h4>");
                    }
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

