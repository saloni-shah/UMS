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
        <form action="addCourse"  class="form-inline" role="form" method="POST">
            <div class="row" style="padding:.5em;">
                    <div class="form-group">
                        <label>Department:</label> 
                        <input type="text"  required name="department"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Term:</label> 
                        <input type="text"  required name="term"><br /><br />
                    </div>
             </div>
            <div class="row" style="padding:.5em;">
                
                    <div class="form-group">
                        <label>Course Number:</label> 
                        <input type="text"  required name="coursenumber"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Course Title:</label> 
                        <input type="text"  required name="title"><br /><br />
                    </div> 
                    
            </div>
             <div class="row" style="padding:.5em;">
                    <div class="form-group">
                        <label>Number of Sections:</label> 
                        <input type="number"  required name="section"><br /><br />
                    </div>   
                    <div class="form-group">
                        <label>Credits:</label> 
                        <input type="number"  required name="credit" min="1" max="4"><br /><br />
                    </div>
            </div>
             <div class="row" style="padding:.5em;">
                     <div class="form-group">
                        <div class="checkbox">
                         <label>Lab</label>
                         <input type="checkbox" name="lab" value="Yes">Yes
                             <br /><br />
                        </div>
                     </div>
                    <div class="form-group">
                        <label>Lab Credits:</label> 
                        <input type="number" name="labcredit" min="1" max="2"><br /><br />
                    </div>
            </div>
             <!--<div class="row" style="padding:.5em;">
                    <div class="form-group">
                        <label>Day:</label> 
                        <select name="day">
                            <option selected="selected" value="">Select Day</option>
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Time:</label> 
                        <select name="time">
                            <option selected="selected" value="">Select Time</option>
                            <option value="9:15 AM">9:15 AM</option>
                            <option value="12:15 PM">12:15 PM</option>
                            <option value="3:15 PM">3:15 PM</option>
                            <option value="6:15 PM">6:15 PM</option>
                        </select><br /><br />
                    </div>
                 </div>-->
             <div class="row" style="padding:.5em;">
                    <button type="submit" class="btn btn-primary" name="submit" id="submit" value="Save">Save</button>
                
               
            </div>
        </form>
        </div>
    </body>
</html>
