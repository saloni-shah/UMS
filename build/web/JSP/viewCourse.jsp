<%-- 
    Document   : viewCourse
    Created on : Mar 22, 2016, 2:28:20 PM
    Author     : Saloni
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <title>Timetable(Course List)</title>
    </head>
    <body>
        <!--<div align="left" style="color: white;">${Message}</div>-->
        <div align="left">
            <br />
         <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
         <a href="/UMS/JSP/tuition.jsp" class="btn btn-primary" role="button">Tuition & Costs</a>
         <a href="/UMS/JSP/editRemove.jsp" class="btn btn-primary" role="button">Edit/Remove Course</a>
         <br /><br />
         <a href="/UMS/JSP/adminHome.jsp" class="btn btn-primary" role="button">Admin Home</a>
         </div>
         <div align="right">
        <a href="/UMS/" class="btn btn-primary" role="button">LogOut</a>
        </div>
        <h1 align="center">Timetable(Course List)</h1>
        <!--<h3 align="left">
            <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
            <a href="${pageContext.request.contextPath}/generateTimetable" class="btn btn-primary" role="button">Generate TimeTable</a>
        </h3>-->
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            <label for="coursenumber">Course  Number</label>
                        </th>

                        <th>
                            <label for="coursetitle">Course Title</label>
                        </th>

                        <th>
                            <label for="department">Department</label>
                        </th>
                        
                        <th>
                            <label for="day">Day</label>
                        </th>
                        
                        <th>
                            <label for="time">Time</label>
                        </th>

                        <th>
                            <label for="term">Term</label>
                        </th>
                        
                        <th>
                            <label for="term">Location</label>
                        </th>
                    </tr>
                </thead>

                <tbody>

                    <%

                        try {
                            String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
                            String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
                            String username = "hr";
                            String password = "hr";
                            Class.forName(JDBC_DRIVER);
                            Connection conn = DriverManager.getConnection(DB_URL, username, password);
                            //System.out.println("Database connected..");
                            Statement stmt = conn.createStatement();
                            String queryString = "select courses.*, courseschedule.* "
                                    + "from courses, courseschedule "
                                    + "where courses.courseNum = courseschedule.courseNum "
                                    + " and courses.section = courseschedule.section "
                                    + " order by courseschedule.day, courseschedule.time, courseschedule.location";
                            ResultSet rset = stmt.executeQuery(queryString);
                            while (rset.next()) {

                    %>
                    <tr>
                        <th><%=rset.getString("courseNum")%><%=rset.getString("section") %></th>
                        <th><%=rset.getString("title") %>(<%=rset.getInt("credit") %> Credits)</th>
                        <th><%=rset.getString("department") %></th>
                        <th><%=rset.getString("day") %></th>
                        <th><%=rset.getString("time") %></th>
                        <th><%=rset.getString("term") %></th>
                        <th><%=rset.getString("location") %></th>
                    </tr>
                    <%

                        }
                    %>
                </tbody>        
            </table>
            <%
                    rset.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </body>
</html>
