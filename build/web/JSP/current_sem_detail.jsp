<%-- 
    Document   : current_sem_detail
    Created on : Apr 3, 2016, 10:38:48 PM
    Author     : ankit
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: gray">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classes</title>
    
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
        fieldset{
            width: 20em;
            height: content-box;
            border-bottom-color: white;
            left: 0.5cm;
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
               alignment-adjust: central;
        }
        href{
             alignment-adjust: central;
        }
        table{
             width: 30cm;
            height: content-box;
            padding-left: 15em;
              margin-left: 2cm;
              size: 20em;
        }
        table{
             width: content-box;
            height: 5em;
            padding-left: 5em;
              margin-left: 2cm;
        }
        tr{
            width: 15em;
            height: content-box; 
        }
        th{
            text-align:center;
        }
        td{
           width:15em;
            height: content-box;
             text-align:center;
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
        legend{
            color:white;
        }
        h4{
            text-align: center;
        }
    </style>
    </head>
    <body>
        
    <br/><br/>
    <form action="/UMS/JSP/register_courses.jsp" method="post">
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

           String userName=(String)session.getAttribute("userName");
           String pwd =(String)session.getAttribute("pwd");                      
      
           String query="select * from  student_detail s where s.userName=\'"+userName+"\' and s.pwd=\'"+pwd+"\'";
           PreparedStatement preparedStatement;
           
            if(query!=null) {
                preparedStatement = connection.prepareStatement(query);              
                ResultSet rs =preparedStatement.executeQuery();                
                
                if(rs!=null){
                    while(rs.next()){
                        int student_id=rs.getInt("Student_id");%>
                        <fieldset>
                            <legend>Student Information</legend>
                            <table>
                                <tr> <td style="text-align:left">student id:    <%=rs.getString("student_id")%> </td></tr>
                                <tr> <td style="text-align:left">student name:    <%=rs.getString("firstName")%> <%=rs.getString("lastName")%> </td></tr>
                                <tr> <td style="text-align:left">Phone:    <%=rs.getString("phone")%> </td></tr>
                                <tr> <td style="text-align:left">Email:   <%=rs.getString("email")%> </td></tr>
                                <tr> <td style="text-align:left">Course:     <%=rs.getString("course")%> </td></tr>
                            </table>
                        </fieldset>
                        <br/>
                         <fieldset>
                            <legend>Classes Schedule</legend>
                                <table border="">
                                    <tr>
                                        <th>course # </th>                
                                        <th>Section </th>                 
                                        <th>Day/Time</th> 
                                        <th>Location</th>
                                        <th>Handouts </th>
                                        <th>Homework </th>                
                                        <th>Attendance </th>
                                        <th>Result </th>
                                    </tr>
                                    <tr>
                                         <%String query1="select * from  student_courses s where s.student_id=\'"+student_id+"\'";
                       
                                         if(query1!=null) {
                                            preparedStatement = connection.prepareStatement(query1);
                                            ResultSet rs1 =preparedStatement.executeQuery();                
                
                                            if(rs1!=null){
                                                while(rs1.next()){%>
                     
                                        <td><%=rs1.getString("courseNum")%></td>
                                        <td><%=rs1.getString("section")%> </td>                  
                                        <td><%=rs1.getString("day")%>/<%=rs1.getString("time")%></td>
                                        <td><%=rs1.getString("location")%> </td>
                                        <td> <a href="/UMS/HTML/handouts.html">Handouts</a></td>
                                        <td> <a href="/UMS/HTML/homework.html">Homework</a></td>
                                        <td><a href="/UMS/HTML/attendance.html">Attendance </a></td>
                                        <td> <a href="/UMS/HTML/result.html">Result</a></td>                
                                    </tr>
                                                    <% } 
           
                                                }           
                                            }
                                }
                            }
                        }%>
                    </table>
                </fieldset><br/><br/>
            <h4><a href="/UMS/JSP/student_home_view.jsp"> Student Home</a></h4>
        </form>
    </body>
</html>
