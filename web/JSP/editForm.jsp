<%-- 
    Document   : editForm
    Created on : Apr 10, 2016, 10:37:15 PM
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
        <title>Edit Course</title>
    </head>
    <body>
       
        <h1>Edit Course</h1>
        <div class="container">
            <%

                        try {
                            String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
                            String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
                            String username = "hr";
                            String password = "hr";
                            Class.forName(JDBC_DRIVER);
                            Connection conn = DriverManager.getConnection(DB_URL, username, password);
                            //System.out.println("Database connected..");
                            String id = request.getParameter("id");
                            String section = request.getParameter("section");
                            Statement stmt = conn.createStatement();
                            String queryString = "select courses.* "
                                    + "from courses "
                                    + " where courseNum = \'" + id + "\' and section = \'" + section +"\'";
                            ResultSet rset = stmt.executeQuery(queryString);
                            while (rset.next()) {

                    %>
        <form action="updateCourse"  class="form-inline" role="form" method="POST">
            <div class="row" style="padding:.5em;">
                    <div class="form-group">
                        <label>Department:</label> 
                        <input type="text"  style="background-color: yellowgreen" readonly required name="department" value="<%=rset.getString("department")%>"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Term:</label> 
                        <input type="text"  required name="term" value="<%=rset.getString("term")%>"><br /><br />
                    </div>
             </div>
            <div class="row" style="padding:.5em;">
                
                    <div class="form-group">
                        <label>Course Number:</label> 
                        <input type="text"  style="background-color: yellowgreen" readonly required name="coursenumber" value="<%=rset.getString("courseNum")%>"><br /><br />
                    </div>
                    <div class="form-group">
                        <label>Course Title:</label> 
                        <input type="text"   required name="title" value="<%=rset.getString("title")%>"><br /><br />
                    </div> 
                    
            </div>
             <div class="row" style="padding:.5em;">
                    <div class="form-group">
                        <label>Section:</label> 
                        <input type="text"  style="background-color: yellowgreen" readonly required name="section" value="<%=rset.getString("section")%>"><br /><br />
                    </div>   
                    <div class="form-group">
                        <label>Credits:</label> 
                        <input type="text"  required name="credit" value="<%=rset.getString("credit")%>"><br /><br />
                    </div>
            </div>
             <div class="row" style="padding:.5em;">
                    <button type="submit" class="btn btn-primary" name="submit" id="submit" value="Save">Save</button>
                
               
            </div>
             <%

                        }
                    %>
                    <%
                    rset.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
        </div>
    </body>
</html>
