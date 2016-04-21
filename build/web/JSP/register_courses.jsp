<%-- 
    Document   : register_courses
    Created on : Apr 3, 2016, 4:33:23 PM
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
             background: white;
               color: blue;
        }
        table{
             width: content-box;
            height: 5em;
            padding-left: 5em;
              margin-left: 2cm;
        }
        tr{
            width: 10em;
            height: content-box; 
        }
        td{
            width:10em;
            height: content-box;
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
            font-family: Georgia;
            color:white;
        }
        p{
            margin-left: 2cm; 
        }
        a{
            background-color: gray;
        }
    </style>
        <title>Register Courses</title>
    </head>
    <body>
        <center>        
            <h2> Register Courses</h2>
            <hr>
        
            <form action="/UMS/JSP/add_courses.jsp" method="post">
               
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
            String userName=session.getAttribute("userName").toString().toLowerCase();
             
            String pwd =session.getAttribute("pwd").toString().toLowerCase();
            String term = request.getParameter("term"); 
            
             String query1="select s.student_id from  student_detail s where s.userName=\'"+userName+"\' and s.pwd=\'"+pwd+"\'"; 
             PreparedStatement preparedStatement;
                preparedStatement = connection.prepareStatement(query1);
  
                int student_id;
                
                ResultSet result1=preparedStatement.executeQuery();%>
                <% if(result1!=null){     
                        while(result1.next()){
                            student_id=result1.getInt("Student_id");
       
                            String query="select c.courseNum, c.title, c.section, cs.day, cs.time,cs.id,cs.location from  courses c, courseschedule cs where c.term=? and  c.courseNum = cs.courseNum and c.section = cs.section";
            
                            preparedStatement = connection.prepareStatement(query);  
                            preparedStatement.setString(1, term);
                
                            ResultSet result=preparedStatement.executeQuery();%>
                            <table border="">
                                <tr>
                                    <td align="center">
                                        Course #
                                    </td>
                                    <td align="center">
                                        Course Title
                                    </td>
                                    <td align="center">
                                        Course Section
                                    </td>
                                    <td align="center">
                                        Schedule
                                    </td>
                                    <td align="center">
                                        Add 
                                    </td>
                                </tr>
                            </table>
                        <% if(result!=null){     
                            while(result.next()){%>
            
                                <table border="">  
                                    <tr>
                                        <td align="center">
                                            <%=result.getString("courseNum")%>
                                        </td>
                                        <td align="center">
                                            <%=result.getString("title")%>
                                        </td>
                                        <td align="center">
                                            <%=result.getString("section")%>
                                        </td>
                                        <td align="center">
                                            <%=result.getString("day")%>/<%=result.getString("time")%>
                                        </td>
                                        <td align="center">    
                                            <h4><a href="add_courses.jsp?courseNum=<%=result.getString("courseNum")%>&section=<%=result.getString("section")%>&day=<%=result.getString("day")%>&time=<%=result.getString("time")%>&id=<%=result.getString("id")%>&location=<%=result.getString("location")%>">Add</a></h4>
                                        </td>
                                    </tr>
                                </table>
                            <%}
                         }
                      }
                    }%> 
                <h4><a href="/UMS/JSP/student_home_view.jsp"> Student Home</a></h4>  
            </form>
        </center>
    </body>
</html>

