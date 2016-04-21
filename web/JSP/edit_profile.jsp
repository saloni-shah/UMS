<%-- 
    Document   : edit_profile
    Created on : Apr 5, 2016, 11:31:22 AM
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
                 background-color:gray;
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
             background: gainsboro;
               color: blue;
               font-size: 1em;
            width: 5em;
        }
        table{
             width: 30em;
            height: 30em;
            padding-left: 15em;
              margin-left: 2cm;
              color:blue;
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
        <title>Edit Profile</title>
    </head>
    
    <body>
        <center>
            <form action="/UMS/JSP/edit_profile.jsp" method="post" >
            <%
     
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String servername="localhost";  
            String serverport="1521";
            String sid="xe";
            String url="jdbc:oracle:thin:@"+servername+":"+serverport+":"+sid;
            String username="hr";
            String password="hr";
            
            // Establish a connection
            Connection connection = DriverManager.getConnection(url,username,password);
            
            String userName=(String)session.getAttribute("userName");
            String pwd =(String)session.getAttribute("pwd");                      
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");           
            String address = request.getParameter("address");
        
            String query="update  student_detail s set s.phone=?,s.email=?,s.address=? where s.userName=\'"+userName+"\' and s.pwd=\'"+pwd+"\'";
            PreparedStatement preparedStatement;
           
             if(query!=null) {
               preparedStatement = connection.prepareStatement(query);
               preparedStatement.setString(1, phone);
               preparedStatement.setString(2, email);
               preparedStatement.setString(3, address);
  
                int rs =preparedStatement.executeUpdate();
                
                if(rs==1){%>
                    <br/> <br/> <br/>      
                        <h2>   your details successfully edited.</h2>
                    <br/> <br/> 
               <% } 
           
            preparedStatement.close();
            connection.close();
            }%>
            <h4><a href="/UMS/JSP/student_home_view.jsp"> Student Home</a></h4>
        </form>
      </center>
    </body>
</html>



