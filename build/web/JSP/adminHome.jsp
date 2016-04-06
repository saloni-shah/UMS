<%-- 
    Document   : adminHome
    Created on : Apr 5, 2016, 8:33:35 PM
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
                display: inline-block;
                text-align: center;
                background-color: gray;
                align: center;
            }
            h1,h2,label{
                color:white;
            }
            .div2 {
                margin-left: 200px;
                width: 900px;
                height: 220px;    
                padding: 50px;
                border: 1px solid red;
                align :center;
            }
            .container  {
                    margin-left: 100px;
                    //margin-top: 40px;
                    
                    align: center;
                }.form-inline  {
                    //margin-left: 484px;
                   //margin-top: 94px;
                    
                    //align: center;
                }
                .container a p{
                    background-color: red;
                    font-style: oblique;
                    color: white;
                }
                h2,h3{
                    color:white;
                }
                
                .image-container{
                    width:200px;
                    height:120px;
                }
                .container img{
                    width : 240px;
                    height : 180px;
                }
        </style>
        <title>AdminHome Page</title>
    </head>
    <body>
       <div align="left" style="color: white;">${Message}</div>
        <div style="color: white;" align="left">Welcome Admin.</div>
        <div align="right">
        <a href="" class="btn btn-primary" role="button">LogOut</a>
        </div>
        <h2 align="center">UMS</h2>
        <div class="container" style="align:center;margin-top: 20px;">
           <a href="/UMS/JSP/addCourse.jsp" id="admin" class="img-responsive" style="display:inline-block;border:1px solid #b91d47;">
                 <img src="/UMS/images/addCourse.jpg" alt="administration" class="img-responsive" width="250" height="190">
                 <p class="text" style="font-size: large; text-align: center;">
                       Add Course
                 </p>
            </a>  
        
           <a href="" id="faculty" class="img-responsive" style="display:inline-block;border:1px solid #b91d47;">
                 <img src="/UMS/images/delete.jpg" alt="faculty" class="img-responsive" width="250" height="190">
                 <p class="text" style="font-size: large; text-align: center;">
                       Edit/Remove Course
                 </p>
            </a>  
        </div>
        <div class="container" style="align:center;">
           <a href="" class="img-responsive" style="display:inline-block;border:1px solid #b91d47;">
                 <img src="/UMS/images/tuition.png" alt="student" class="img-responsive" width="250" height="190">
                 <p class="text" style="font-size: large; text-align: center;">
                       Tuition & Costs
                 </p>
            </a>  
            <a href="${pageContext.request.contextPath}/generateTimetable" class="img-responsive" style="display:inline-block;border:1px solid #b91d47;">
                 <img src="/UMS/images/timetable.jpg" alt="student" class="img-responsive" width="250" height="190">
                 <p class="text" style="font-size: large; text-align: center;">
                       Generate TimeTable
                 </p>
            </a>  
        </div>
        <!--<h3 align="center">
            <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a><br /><br />
            <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Edit/Remove Course</a><br /><br />
            <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Tuition & Costs</a><br /><br />
            <a href="${pageContext.request.contextPath}/generateTimetable" class="btn btn-primary" role="button">Generate TimeTable</a>
        </h3>-->
    </body>
</html>
