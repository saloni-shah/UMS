<%-- 
    Document   : tuition_fee
    Created on : Apr 19, 2016, 6:16:30 PM
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
    <style >
        
	body {
		display:inline;
                width: 100%;
                align-content: stretch; height: 100%;
                background-attachment: fixed;
                align-content: center;
                margin-left: 2cm;
                font-size: 2em;
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
            height: 5em;
            padding-left: 15em;
              margin-left: 2cm;
              font-size: 1em;
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
        }
        p{
           margin-left: 2cm; 
        }
        
    </style>
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <form action="/UMS/JSP/tuition_fee.jsp" method="post" >
                <br/>
                <h2>Tuition Fee Detail</h2>
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
      
            String query="select s.student_id,s.course from  student_detail s where s.userName=\'"+userName+"\' and s.pwd=\'"+pwd+"\'"; 
           
            PreparedStatement preparedStatement;           
            preparedStatement = connection.prepareStatement(query);  
            ResultSet result=preparedStatement.executeQuery();%>
            <% if(result!=null){     
                while(result.next()){
                    int student_id=result.getInt("Student_id");
                    String course=result.getString("course");%>            
                    <br/><br/><br/>
                        <table border="">
                            <tr>
                                <th style="text-align:center"> Course</th>
                                <th style="text-align:center"> Tuition Fees</th>    
                            </tr>
                            <% if(course=="BSCS"|| course=="BSEE"|| course=="BSCSE"){%>
                             <tr>
                                <td align="center"><%=course%></td>
                                <td align="center">$<%=4950%></td>
                             </tr>                    
                            <%}
                            else{%>
                                <tr>
                                    <td align="center"><%=course%></td>
                                    <td align="center">$<%=4050%></td>
                                </tr>
                            </table>
                        <%}      
                    }     
                }%>
  
            <br/>                       
            <a href="/UMS/JSP/student_home_view.jsp"> Student Home</a>
            <a href="/UMS/JSP/pay.jsp"> Pay</a>
         
            </form>
        </center>
    </body>
</html>
