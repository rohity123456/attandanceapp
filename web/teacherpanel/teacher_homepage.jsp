<%@page import="bean.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Teacher Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/aa.css">
        <link rel="stylesheet" href="../css/queries.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" crossorigin="anonymous">
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
         <div  id="container">
             <div class="col-sm-12" id="top">
                 <span id="bar" style="width: 20px;"><i class="fa fa-bars" style="color: white" onclick="openNav()"></i></span>   
                 <span style="float: right; margin-top: 20px;"><i class="fas fa-bell" style="color: white; font-size: 20px;"></i></span>
                 <div id="mySidenav" class="sidenav">
                 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                 <a href="../user_profile_1.jsp"><i class="fas fa-user-circle" id="pro"></i> <%=st.getT_name() %></a>
                 <a href="#"><i class="fas fa-home"></i>  HOME</a>
                 <a href="#"><i class="fas fa-search"></i>  SEARCH</a>
                 <a href="#"><i class="fas fa-cog"></i>  SETTINGS</a>
                 <a href="../logout_controller"><i class="fas fa-sign-out-alt"></i>  LOGOUT</a>
                 </div>
                 
  <div id="scrollmenu">
  <a href="#home" style="padding-left: 0;">Attendance Management</a>
  <a href="#news">My Report</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  <a href="#support">Support</a>
  <a href="#blog">Blog</a>
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
                <div  style="padding-top: 20px" class="hove">
                     <span><a href="takeAttendance.jsp"><i id="user" class="fas fa-user-check hove"> <span style="font-size: 18px;">Take Attendance</span></i></a></span>
                     
                 </div>
                <div style="margin-top: 30px;" class="hove">
                    <span ><a href="ViewAttendance.jsp"><i id="view" class="fas fa-address-book hove"> <span style="font-size: 18px; margin-left: 15px;">View Attendance</span></i></a></span>
                     
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
