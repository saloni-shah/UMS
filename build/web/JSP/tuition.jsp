<%-- 
    Document   : tuition
    Created on : Apr 6, 2016, 9:51:46 PM
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
            h1,h2{
                color:white;
            }
        </style>
        <title>Tuition & Costs</title>
    </head>
    <body>
        <div align="left">
             <br />
         <a href="${pageContext.request.contextPath}/generateTimetable" class="btn btn-primary" role="button">Generate TimeTable</a>
         <a href="/UMS/JSP/editRemove.jsp" class="btn btn-primary" role="button">Edit/Remove Course</a>
         <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
          <br /><br />
         <a href="/UMS/JSP/adminHome.jsp" class="btn btn-primary" role="button">Admin Home</a>
         </div>
           <div align="right">
        <a href="/UMS/" class="btn btn-primary" role="button">LogOut</a>
        </div>
        <h1>Tuition</h1>
        <div class="row" style="padding:.5em;">
        <label>The following tuition is per semester. Textbooks, school supplies, housing, food, insurance, and other personal expenses are not included in these costs. 
            <br />Textbook costs are estimated at $80~$150 per course. 
            <br />Additionally, all international students are required to purchase a health insurance plan estimated at $950 per year.</label>
        </div>
        
        <div class="row" style="padding:.5em;">
             <div class="form-group col-sm-4 ">
                <label>Undergraduate Program Tuition
                     <br />Undergraduate: $4,950 
                     <br />BSEE
                     <br />BSCS
                     <br />BSCSE
                     <br />BBAIS
                </label>
             </div>
            <div class="form-group col-sm-4 ">
                <label>Graduate Program Tuition
                     <br />School of Business: $4,050
                     <br />    MBA
                     <br />
                         School of Engineering: $4,050
                     <br />    MSEE
                     <br />    MSCS
                     <br />    MSCSE
                </label>
             </div>
             <div class="form-group col-sm-4 ">
                <label>Doctorate Program Tuition
                 <br />   School of Business: $450/unit
                 <br />DBA

                 <br />School of Engineering: $450/unit
                 <br />DCE
                </label>
             </div>
        </div>
        
    </body>
</html>
