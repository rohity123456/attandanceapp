<%@page import="bean.Student"%>
<%@page import="bean.Subject"%>
<%@page import="DAO.Subject.SubjectOperation"%>
<%@page import="bean.Teacher"%>
<%@page import="DAO.Attendance.AttendanceOperation"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Student.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../helpingFiles/cssinclude.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Teacher Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/aa.css">
        <link rel="stylesheet" href="../css/queries.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css" crossorigin="anonymous">
                <style>

#below{
    overflow: scroll;
}
#below::-webkit-scrollbar{
    display: none;
}
.sub1{
    font-weight: 700;
    font-size: 15px; 
    margin:10px 10px 10px 20px;
    background-color:#00BCD4;
    color: white;
    border-radius: 15px;
    padding: 5px;
}
#rec{
    margin-left: 30px;
}
.sax{
    font-weight: 600;
    font-size: 12px; 
    
}
        </style>

    </head>
    <body>
        <%
          response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
          response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
          response.setDateHeader("Expires", 0);
           if(session.getAttribute("user")==null)
           response.sendRedirect("/AttendanceApp/login.jsp");
            %>
          <%
             Student st=(Student)session.getAttribute("user");
          %>
          <%
         int noOfDaysPresent,noOfDaysAbsent;
         float percent,sumpercent=0;   
        AttendanceOperation sp=new AttendanceOperation();
        int rollno=st.getRno();
        String dept=st.getD_name();
        SubjectOperation spo=new SubjectOperation();
         int sem=st.getSem();
         List li=spo.subjectSelectbydept(dept,sem);
         ListIterator lit=li.listIterator();
         %>
         <div id="container">
             <div class="col-sm-12" id="top">
                 <span id="bar" style="width: 20px;"><i class="fa fa-bars" style="color: white" onclick="openNav()"></i></span>   
                 <span style="float: right; margin-top: 20px;"><i class="fas fa-bell" style="color: white; font-size: 20px;"></i></span>
                 <div id="mySidenav" class="sidenav">
                 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                 <a href="../user_profile_2.jsp"><i class="fas fa-user-circle" id="pro"></i> <%= st.getName() %></a>
                 <a href="#"><i class="fas fa-home"></i>  HOME</a>
                 <a href="#"><i class="fas fa-search"></i>  SEARCH</a>
                 <a href="#"><i class="fas fa-cog"></i>  SETTINGS</a>
                 <a href="../logout_controller"><i class="fas fa-sign-out-alt"></i>  LOGOUT</a>
                 </div>
                 
  <div id="scrollmenu">
  <a href="#news">My Report</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  <a href="#support">Support</a>
  <a href="#blog">Blog</a>
  <a href="#more">More</a>
  <a href="#logo">Logo</a>
  <a href="#friends">Friends</a>
  <a href="#partners">Partners</a>
  
</div>
             </div>
            <div class="col-sm-12" id="below">

        
      <div class="row container">
            
     <div class="col-sm-12" id="below">
         <span style="font-weight: 800;font-size: 20px; padding:10px 0 10px 20px;">ATTENDANCE STATUS</span>
         <span style="font-weight: 700;font-size: 15px; padding:10px 0 10px 70px;">Name: <%=st.getName() %></span><br>
         <%
         while(lit.hasNext())
            {   
                Subject sta=(Subject)lit.next();
                noOfDaysPresent=sp.DaysPresent(rollno,sta.getSub_name());
                noOfDaysAbsent=sp.DaysAbsent(rollno,sta.getSub_name());
                percent=(float)noOfDaysPresent/(float)(noOfDaysPresent+noOfDaysAbsent)*100;
                sumpercent+=percent;
        %>    
        <span class="sub1">Subject: <%=sta.getSub_name() %></span><br>
        <div id="rec">
            <span class="sax">NO of days present: <%=noOfDaysPresent %></span><br>
        <span class="sax">NO of days absent: <%=noOfDaysAbsent %></span><br>
        <span class="sax">Percentage attendance: <%=percent %></span><br>
        </div>
        <% }%>
        <span style="font-weight: 700;font-size: 25px;padding:10px 0 10px 20px; ">Average attendance</span>
        <span style="font-weight: 700;font-size: 25px; margin-left: 32%"><%=sumpercent/4 %>%</span> 
     </div>
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
