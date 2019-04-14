<%-- 
    Document   : UpdateStudent
    Created on : Jul 25, 2018, 2:17:12 PM
    Author     : rohity123
--%>
<%@page import="DAO.Student.StudentOperation"%>
<%@page import="bean.Student"%>
<%@page import="Student.controller.StudentUpdate" %>
<%@include file="../../helpingFiles/cssinclude.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="../../css/commonCss.css">
        <link rel="stylesheet" href="../css/queries.css">
        <style>
            #below{
                overflow: scroll;
                padding: 5px;
            }
            div#below::-webkit-scrollbar { 
            display: none; 
            }
        </style>
    </head>
    <body>
        <%! 
          Student st=new Student();
          StudentOperation sp=new StudentOperation(); 
        %>
        <%
        int id=Integer.parseInt(request.getParameter("id"));    
        st = sp.studentSelect(id);
        %>
      <div class="container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="../ViewStudent.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Update Student</span></span>   
           </div>
            <div class="col-sm-12" id="below">
         <form action="../../StudentUpdate" method="get" id="formc">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" name="name" value="<%= st.getName() %>">
            </div>
            <div class="form-group">
             <label for="year">Year:</label>
                <select class="form-control" name="year" value="<%= st.getBatch() %>">
                  <option>FE</option>
                  <option>SE</option>
                  <option>TE</option>
                  <option>BE</option>
                  </select>
             </div>
            <div class="form-group">
                <label for="Rollno">Roll No:</label>
                <input type="text" class="form-control" name="rollno" value="<%= st.getRno() %>">
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select class="form-control" name="department" value=="<%= st.getD_name() %>">
                  <option>Information Technology</option>
                  <option>Computer Science</option>
                  <option>ETRX</option>
                  <option>EXTC</option>
                  <option>Mechanical</option>
                  <option>Civil</option>
                 </select>
            </div>
            <div class="form-group">
             <label for="year">SEM:</label>
                <select class="form-control" name="sem">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  </select>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" name="address" value="<%= st.getAddress() %>">
            </div>
            
            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="text" class="form-control" name="contact" value="<%= st.getContact() %>">
            </div>
            <div class="form-group">
                <label for="username1">Username:</label>
                <input type="text" disabled class="form-control" value="<%= st.getS_username() %>">
            </div>
            <div class="form-group" style="display: none">
                <label for="username">Username:</label>
                <input type="text" class="form-control" name="username" value="<%= st.getS_username() %>">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" name="password" value="<%= st.getS_pass() %>">
            </div>
             <div class="form-group">
               <label for="sel1">User Type:</label>
                <select class="form-control" id="sel1" name="usertype" value="<%= st.getS_utype() %>">
                  <option>Student</option>
                  </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form> 
            </div>
        </div>
    </body>
</html>