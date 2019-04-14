<%-- 
    Document   : UpdateStudent
    Created on : Jul 25, 2018, 2:17:12 PM
    Author     : rohity123
--%>
<%@page import="DAO.Teacher.TeacherOperation"%>
<%@page import="bean.Teacher"%>
<%@page import="Teacher.controller.TeacherUpdate" %>
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
          Teacher st=new Teacher();
          TeacherOperation sp=new TeacherOperation(); 
        %>
        <%
        int id=Integer.parseInt(request.getParameter("id"));    
        st = sp.TeacherSelect(id);
        %>
      <div class="container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="../ViewTeacher.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Update Teacher</span></span>   
           </div>
            <div class="col-sm-12" id="below">
         <form action="../../TeacherUpdate" method="get" id="formc">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" name="name" value="<%= st.getT_name() %>">
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select class="form-control" name="department" value="<%= st.getT_dept() %>">
                  <option>Information Technology</option>
                  <option>Computer Science</option>
                  <option>ETRX</option>
                  <option>EXTC</option>
                  <option>Mechanical</option>
                  <option>Civil</option>
                 </select>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" name="address" value="<%= st.getT_address() %>">
            </div>
            <div class="form-group">
                <label for="contact">Designation:</label>
                <input type="text" class="form-control" name="designation" value="<%= st.getT_designation() %>">
            </div>
            <div class="form-group">
                <label for="us">Photo Link:</label>
                <input type="url" class="form-control" name="photolink" value="<%= st.getT_photoLink() %> ">
            </div>
            <div class="form-group">
                <label for="us">Profile Link:</label>
                <input type="url" class="form-control" name="profilelink" value="<%= st.getT_userLink()%> ">
            </div>
                    
            <div class="form-group">
                <label for="username1">Username:</label>
                <input type="text" disabled class="form-control" value="<%= st.getT_username() %>">
            </div>
            <div class="form-group" style="display: none">
                <label for="username">Username:</label>
                <input type="text" class="form-control" name="username" value="<%= st.getT_username() %>">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" name="password" value="<%= st.getT_pass() %>">
            </div>
             <div class="form-group">
               <label for="sel1">User Type:</label>
                <select class="form-control" id="sel1" name="usertype" value="<%= st.getT_utype() %>">
                  <option>Teacher</option>
                  <option>Admin</option>
                  </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form> 
            </div>
        </div>
    </body>
</html>