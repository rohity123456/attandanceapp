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
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/adminpanel/admin_subject.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Add Subject</span></span>   
           </div>
            <div class="col-sm-12" id="below">
         <form action="../Sub_RegistrationController" method="get" id="formc">
            <div class="form-group">
                <label for="name">Subject Name:</label>
                <input required type="text" class="form-control" name="name">
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
            <button type="submit" class="btn btn-default">Submit</button>
        </form> 
            </div>
        </div>
    </body>
</html>
