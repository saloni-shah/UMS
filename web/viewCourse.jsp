<%-- 
    Document   : viewCourse
    Created on : Mar 22, 2016, 2:28:20 PM
    Author     : Saloni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <style>
            body {
		//display: inline-block;
		text-align: center;
                background-color: gray;
		}
                h1,h2,label{
                    color:white;
                }
        </style>
        <title>Course List</title>
    </head>
    <body>
        <h1 align="center">Course List</h1>
        <h3 align="left">
            <a href="addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
        </h3>
        <div class="container">
        <table class="table">
        <thead>
            <tr>
                <th>
                    <label for="coursenumber">Course Number</label>
                </th>
               
                <th>
                    <label for="section">Section</label>
                </th>
            
                <th>
                    <label for="coursetitle">Course Title</label>
                </th>
                
                <th>
                    <label for="credits">Credits</label>
                </th>
           
                <th>
                    <label for="department">Department</label>
                </th>
            
                <th>
                    <label for="term">Term</label>
                </th>
            </tr>
        </thead>
                
        <tbody>
            <tr>
              <th>CS480</th>
              <th>A</th>
              <th>Java and Internet Applications</th>
              <th>3.0</th>
              <th>Computer Science</th>
              <th>2016 Summer</th>
            </tr>
            <tr>
              <th>EE323</th>
              <th>C</th>
              <th>Logic Design</th>
              <th>3.0</th>
              <th>Electrical Engineering</th>
              <th>2016 Summer</th>
            </tr>
            <tr>
              <th>CS480</th>
               <th>D</th>
              <th>Java and Internet Applications</th>
              <th>3.0</th>
              <th>Computer Science</th>
              <th>2016 Summer</th>
            </tr>
        </tbody>        
        </table>
        </div>
    </body>
</html>
