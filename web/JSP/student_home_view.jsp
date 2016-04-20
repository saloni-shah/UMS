<%-- 
    Document   : student_home_view
    Created on : Apr 10, 2016, 12:02:33 AM
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
        <title>JSP Page</title>
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
                        align-content: center;
                        
            background-color:gray;
            font-family: Georgia;            
            color: white;       
            			
        }
         .container  {
                    margin-left: 284px;
                    margin-top: 94px;
                    
                    align-content:  center;
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
            margin-right: 1cm;
         
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
            padding-right: 15em;
              margin-left: 2cm;
              margin-right: 2cm
                  
        }
        tr{
            width: 10em;
            height: 10em; 
            border-image-width: 10cm;
        }
        td{
           width: 10em;
            height: 10em;
             border-image-width: 10cm;
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
            margin-left: 1cm;
            color: white
        }
        h4{
            margin-left: 1cm;
            color: white
        }
        p{
           margin-left: 1cm; 
           
        }
        
    </style>
    </head>
    <body>
        <center>        
            <h2> Student Home</h2>
            <hr>
            <h4>Welcome <%=(String)session.getAttribute("userName")%></h4>
        
            <form action="/UMS/HTML/student_login.html" method="post">
                <p Align="right" >
                <input type=submit value="Log Out" >
                
                <table>
                    <tr>             
                        <td>
                            <a href="/UMS/HTML/register_courses.html" class="" style="display:inline-block;border:.5px solid #b91d47;">
                                <img src="/UMS/images/register_classes.jpe" alt="Register Courses" class="" width="250" height="160">
                                <p class="" style="font-size: large; text-align: center;align-items: center">
                                    Register Courses
                                </p>
                            </a>
                        </td>                
                        <td>
                            <a href="/UMS/JSP/view_edit_profile.jsp" class="" style="display:inline-block;border:1px solid #b91d47;">
                                <img src="/UMS/images/profile.jpe" alt="Profile" class="" width="250" height="160">
                                <p class="" style="font-size: large; text-align: left;">
                                    View/Edit Profile
                                </p>
                             </a>
                        </td>
                    </tr>
                    <tr>                 
                        <td>
                            <a href="/UMS/JSP/current_sem_detail.jsp" class="" style="display:inline-block;border:1px solid #b91d47;">
                                <img src="/UMS/images/class.jpe" alt="Current_sem" class="" width="250" height="160">
                                <p class="" style="font-size: large; text-align: left;">
                                    Current Semester Detail
                                </p>
                            </a>
                        </td>
                        <td>
                            <a href="/UMS/HTML/request.html" class="" style="display:inline-block;border:1px solid #b91d47;">
                                <img src="/UMS/images/request.jpe" alt="Request" class="" width="250" height="160">
                                <p class="" style="font-size: large; text-align: center;">
                                    Request
                                </p>
                            </a>
                        </td>
                    </tr>      
                </table>
              
            </form>         
        </center> 
    </body>
</html>

