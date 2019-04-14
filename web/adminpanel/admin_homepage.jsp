<%-- 
    Document   : admin_homepage
    Created on : Mar 25, 2019, 12:07:15 AM
    Author     : rohity123
--%>

<%@page import="bean.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../helpingFiles/cssinclude.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link rel="stylesheet" href="../css/aa.css">
        <link rel="stylesheet" href="../css/queries.css">
    </head>
    <body>
      
        <%
          response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
          response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
          response.setDateHeader("Expires", 0);
           if(session.getAttribute("user1")==null)
           response.sendRedirect("/AttendanceApp/login.jsp");
            %>
          <%
             Teacher st=(Teacher)session.getAttribute("user1");
          %>
        <div class="container">
            <div class="col-sm-12" id="top">
                 <span id="bar" style="width: 20px;"><i class="fa fa-bars" style="color: white" onclick="openNav()"></i></span>   
                 <span style="float: right; margin-top: 20px;"><i class="fas fa-bell hove1" ></i></span>
                 <div id="mySidenav" class="sidenav">
                 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                 <a href="../user_profile.jsp"><i class="fas fa-user-circle" id="pro"></i>  <%=st.getT_name() %></a>
                 <a href="#"><i class="fas fa-home"></i>  HOME</a>
                 <a href="#"><i class="fas fa-search"></i>  SEARCH</a>
                 <a href="#"><i class="fas fa-cog"></i>  SETTINGS</a>
                 <a href="../logout_controller"><i class="fas fa-sign-out-alt"></i>  LOGOUT</a>
                 </div>
                 
                 <div id="scrollmenu">
  <a href="#" style="padding-left: 7px; border-bottom: 5px white solid;">Teachers</a>
  <a href="admin_student.jsp?name=<%= st.getT_name() %>">Students</a>
  <a href="admin_subject.jsp?name=<%= st.getT_name() %>">Subject</a>
  <a href="#about">Feedback Form</a>
  <a href="#blog">Notification</a>
  <a href="#tools">Tools</a>  
  <a href="#base">Base</a>
  <a href="#custom">Custom</a>
  <a href="#more">More</a>
  <a href="#logo">Logo</a>
  <a href="#friends">Friends</a>
  <a href="#partners">Partners</a>
  <a href="#people">People</a>
  <a href="#work">Work</a>
</div>
             </div>
            <div class="col-sm-12" id="below">
                <div style="padding-top: 10px;" class="hove">
                    <span><a href="AddTeacher.jsp?name=<%= st.getT_name() %>"><i id="user" class="fas fa-user-plus hove"> <span style="font-size: 18px;">Add Teacher</span></i></a></span>
                     
                 </div>
                <div style="margin-top: 20px;" class="hove">
                    <span ><a href="ViewTeacher.jsp?name=<%= st.getT_name() %>"><i id="view" class="fas fa-user-edit hove"> <span style="font-size: 18px; margin-left: 1px;">View Teacher</span></i></a></span>
                     
                 </div>
            </div>
        </div>
         <script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>   
    </body>
</html>
