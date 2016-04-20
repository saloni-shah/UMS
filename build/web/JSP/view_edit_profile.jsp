<%-- 
    Document   : view_edit_profile
    Created on : Apr 10, 2016, 12:02:10 PM
    Author     : ankit
--%>
<%-- 
    Document   : view_edit_profile
    Created on : Apr 5, 2016, 11:29:35 AM
    Author     : ankit
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: gray">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style>
        
	body {
		display:inline;
                width: 100%;
                align-content: stretch; height: 100%;
                background-attachment: fixed;
                align-content: center;
                margin-left: 2cm;
	}
        form{
			
			height: 100%;
			width: 100%;
                        display: 100%;
			div#full {
                        height: 100vh;
                        form { display: inline; }
                        font-size: 25em;
                        margin-left: 2cm;
}
                        align-content: stretch;
                        
            background-color:gray;
            font-family: Georgia;            
            color: white;       
            			
        }
        label {
            width: 20em;
            height: 20em;
            color: white;
            background-color:blue;
              color: blue;
        }
		input{
		width: 10em;
            font-family: Georgia;
         
            alignment-adjust: central;
            color: blue;
        }
        div{
            background-color: blue;
            content: editable;
        }
        a{
             font-family: Georgia;
             background: gray;
               color: blue;
        }
        table{
             width: 30em;
            height: 30em;
            padding-left: 15em;
              margin-left: 2cm;
        }
        textarea{
            font-family: Georgia;
            background-color: WHITE;
            text-decoration: #3333ff;
              color: blue;
        }
        select{
            font-family: Georgia;
            background: WHITE;
              color: blue;
        }
        h2{
            margin-left: 2cm;
        }
        p{
           margin-left: 2cm; 
        }
        
    </style>
        <title>View/Edit Profile</title>
    </head>
    <body>
        <center>
            <h2>View/Edit Profile</h2>
            <hr>
            <form action="/UMS/HTML/edit_profile.html" method="post">
                
            <%
     
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String servername="localhost";  
            String serverport="1521";
            String sid="sysdba";
            String url="jdbc:oracle:thin:@"+servername+":"+serverport+":"+sid;
            String username="project";
            String password="myproject";
            
            // Establish a connection
            Connection connection = DriverManager.getConnection(url,username,password);
    
            String userName=session.getAttribute("userName").toString().toLowerCase();
            out.println("Student Name: " +userName);
            String pwd =session.getAttribute("pwd").toString().toLowerCase();                  
      
            String query="select * from  student_detail s where s.userName=\'"+userName+"\' and s.pwd=\'"+pwd+"\'";
           
            PreparedStatement preparedStatement;
           
             if(query!=null) {
                preparedStatement = connection.prepareStatement(query);                         
                ResultSet rs =preparedStatement.executeQuery();                
                
                if(rs!=null){
                    while(rs.next()){%>
                        <table border="">
                            <tr>
                                <td>Student ID:</td>  
                                <td> <%out.println(rs.getString("student_id"));%></td>
                            </tr>
                            <tr>
                                <td>First Name:</td>  
                                <td> <%out.println(rs.getString("firstName"));%></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>  
                                <td> <%out.println(rs.getString("lastName"));%></td>
                            </tr>
                            <tr>
                                <td>DOB:</td>  
                                <td> <%out.println(rs.getString("dob"));%></td>
                            </tr>
                            <tr>
                                <td>Contact Number:</td>  
                                <td> <%out.println(rs.getString("phone"));%></td>
                            </tr>
                            <tr>
                                <td>Email:</td>  
                                <td> <%out.println(rs.getString("email"));%></td>
                            </tr>
                            <tr>
                                <td>User Name:</td>  
                                <td> <%out.println(rs.getString("userName"));%></td>
                            </tr>
                            <tr>
                                <td>Password:</td>  
                                <td> <%out.println(rs.getString("pwd"));%></td>
                            </tr>
                            <tr>
                                <td>Address:</td>  
                                <td> <%out.println(rs.getString("address"));%></td>
                            </tr>
                            <tr>
                                <td>Category:</td>  
                                <td> <%out.println(rs.getString("type"));%></td>
                            </tr>
                            <tr>
                                <td>Course:</td>  
                                <td> <%out.println(rs.getString("course"));%></td>
                            </tr>             
                        </table>
                    <br/>
                    <p>
                        <input type=submit value="Edit" onclick="/UMS/JSP/edit_profile.jsp" > 
                        <a href="/UMS/JSP/student_home_view.jsp"> Student Home</a>
                    </p>
                <% }           
                } 
                rs.close();
                preparedStatement.close();
                connection.close();
            }%>
 
        </form>
      </center>
    </body>
</html>


