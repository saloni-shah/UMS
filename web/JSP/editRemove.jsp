<%-- 
    Document   : editRemove
    Created on : Apr 10, 2016, 10:05:36 PM
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
        <title>Edit/Remove Course</title>
    </head>
    <body>
         <div align="left" style="color: white;">${Message}
         </div>
         <div align="left">
              <br />
         <a href="${pageContext.request.contextPath}/generateTimetable" class="btn btn-primary" role="button">Generate TimeTable</a>
         <a href="/UMS/JSP/tuition.jsp" class="btn btn-primary" role="button">Tuition & Costs</a>
         <a href="/UMS/JSP/addCourse.jsp" class="btn btn-primary" role="button">Add Course</a>
         </div>
           <div align="right">
        <a href="/UMS/HTML/login.html" class="btn btn-primary" role="button">LogOut</a>
        </div>
         <h1 align="center">Edit/Remove Course</h1>
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
                            <label for="section">Section</label>
                        </th>

                        <th>
                            <label for="coursetitle">Course Title</label>
                        </th>

                        <th>
                            <label for="department">Department</label>
                        </th>
                        
                        

                        <th>
                            <label for="term">Term</label>
                        </th>
                        
                        <th>
                            <label for="credit">Credits</label>
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
                            String queryString = "select courses.* "
                                    + "from courses "
                                    + " order by courses.title desc";
                            ResultSet rset = stmt.executeQuery(queryString);
                            while (rset.next()) {

                    %>
                    <tr>
                        <th><%=rset.getString("courseNum")%></th>
                        <th><%=rset.getString("section") %></th>
                        <th><%=rset.getString("title") %></th>
                        <th><%=rset.getString("department") %></th>
                        <th><%=rset.getString("term") %></th>
                        <th>(<%=rset.getInt("credit") %> Credits)</th>
                        <th><a href="/UMS/JSP/editForm.jsp?id=<%=rset.getString("courseNum")%>&section=<%=rset.getString("section")%>" class="btn btn-primary" role="button">Edit</a></th>
                        <th><a href="${pageContext.request.contextPath}/deleteCourse?id=<%=rset.getString("courseNum")%>&section=<%=rset.getString("section")%>" class="btn btn-primary" role="button">Remove</a></th>
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
