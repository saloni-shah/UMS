<%-- 
    Document   : request_receive.jsp
    Created on : Apr 16, 2016, 8:40:43 AM
    Author     : ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: gray">
    <head>
        <title>JSP Page</title>
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
             background: gainsboro;
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
    </head>
    <body>
       <center>
            <form action="/UMS/JSP/request_receive.jsp" method="post">
                <br/><br/><br/>
                <h2>Request Accepted</h2><br/><br/>
                <h4><a href="/UMS/JSP/student_home_view.jsp"> Student Home</a></h4>
            </form>
        </center>
    </body>
</html>
