<%-- 
    Document   : addCourse
    Created on : Mar 22, 2016, 2:56:30 PM
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
        <title>Add Course</title>
    </head>
    <body>
        <h1>Add Course</h1>
        <div class="container">
        <form action=""  class="form-inline" role="form" method="POST">
            <div class="row" style="padding:.5em;">
                <b>
                    <div class="form-group">
                        <label>Course Number:</label> 
                        <input type="text"  required name="coursenumber" size="20"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Section:</label> 
                        <input type="text"  required name="section" size="20"><br /><br />
                    </div>
           
                    <div class="form-group">
                        <label>Course Title:</label> 
                        <input type="text"  required name="title" size="20"><br /><br />
                    </div>    
                    <div class="form-group">
                        <label>Credits:</label> 
                        <input type="number"  required name="credit" size="20"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Department:</label> 
                        <input type="text"  required name="department" size="20"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Term:</label> 
                        <input type="text"  required name="text" size="20"><br /><br />
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit" id="submit" value="Save">Save</button>
                
                </b>
            </div>
        </form>
        </div>
    </body>
</html>
