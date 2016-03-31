<%-- 
    Document   : viewCourse
    Created on : Mar 22, 2016, 2:28:20 PM
    Author     : Saloni
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
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
        <title>Course List</title>
    </head>
    <body>
        <h1 align="center">Course List</h1>
        <h3 align="left">
            <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
        </h3>
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
                    </tr>
                </thead>

                <tbody>

                    <%

                        try {
                            String DB_URL = "jdbc:mysql://localhost/ums";
                            String username = "root";
                            String password = "root";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(DB_URL, username, password);
                            //System.out.println("Database connected..");
                            java.sql.Statement stmt = conn.createStatement();
                            String queryString = "select course.*, courseschedule.* "
                                    + "from course, courseschedule "
                                    + "where course.courseNum = courseschedule.courseNum "
                                    + " order by course.courseNum desc";
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