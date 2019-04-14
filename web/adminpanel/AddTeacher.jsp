<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../helpingFiles/cssinclude.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="../css/commonCss.css">
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
      <div class=" container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/adminpanel/admin_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Add Teacher</span></span>   
           </div>
            <div class="col-sm-12" id="below">
         <form action="../T_RegistrationController" method="get" id="formc">
            <div class="form-group">
                <label for="name">Name:</label>
                <input required type="text" class="form-control" name="name">
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select class="form-control" name="department">
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
                <input required type="text" class="form-control" name="address">
            </div>
            <div class="form-group">
                <label for="contact">Designation:</label>
                <input required type="text" class="form-control" name="designation">
            </div>
             <div class="form-group">
                <label for="us">Photo Link:</label>
                <input type="url" class="form-control" name="photolink">
            </div>
            <div class="form-group">
                <label for="us">Profile Link:</label>
                <input type="url" class="form-control" name="profilelink">
            </div>
             
             <div class="form-group">
                <label for="username">Username:</label>
                <input required type="text" class="form-control" name="username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input required type="password" class="form-control" name="password">
            </div>
             <div class="form-group">
               <label for="sel1">User Type:</label>
                <select class="form-control" id="sel1" name="usertype">
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
