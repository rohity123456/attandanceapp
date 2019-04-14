<%@page import="bean.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../helpingFiles/cssinclude.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="../css/commonCss.css">
        <link type="text/css" rel="stylesheet" href="../css/queries.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <style>
            #below{
                overflow: scroll;
                padding: 5px;
            }
            div#below::-webkit-scrollbar { 
            display: none; 
            }
            .ss{
                background-color: #00BCD4;
                border-radius: 13px;
                color: white;
                font-weight: 600;
                border: 3px white solid;
            }
        </style>
           
    </head>
    <body>
         <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0);
            if(session.getAttribute("user2")==null)
            response.sendRedirect("/AttendanceApp/login.jsp");
            %>
          <%
             Teacher st=(Teacher)session.getAttribute("user2");
          %>
      <div class=" container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/teacherpanel/teacher_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Take Attendance</span></span>   
           </div>
            <div class="col-sm-12" id="below">
            <form action="selectSub.jsp" method="get" id="formc">
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" name="department" disabled value="<%=st.getT_dept() %>"> 
            </div>
             <div class="form-group" style="display: none ">
                <input type="text" name="department" value="<%=st.getT_dept() %>"> 
            </div>       
             <div class="form-group">
               <label for="sel1">Select Semester:</label>
                <select class="form-control" id="sel1" name="sem">
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
      <label for="department">Date:</label>
      <input type="date" name="date">
  </div>
            <button type="submit" id="submit" class="btn btn-default ss" style=" margin-left: 35%;">Submit</button>
        </form> 
            </div>
        </div>  
    </body>
</html>
