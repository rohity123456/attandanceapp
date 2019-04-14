<%-- 
    Document   : ViewStudent
    Created on : Apr 3, 2019, 4:38:30 PM
    Author     : rohity123
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="../css/commonCss.css">
        <link rel="stylesheet" href="../css/queries.css">
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
         int noOfDaysPresent,noOfDaysAbsent;
                 float percent,sumpercent=0,avgpercent;   
        AttendanceOperation sp=new AttendanceOperation();
        Teacher st=(Teacher)session.getAttribute("user2");
        int rollno=Integer.parseInt(request.getParameter("rno"));
        String dept=st.getT_dept();
        SubjectOperation spo=new SubjectOperation();
         int sem=Integer.parseInt(request.getParameter("sem"));
         List li=spo.subjectSelectbydept(dept, sem);
         ListIterator lit=li.listIterator();
        %>
      <div class="row container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/teacherpanel/teacher_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> View Student</span></span>   
           </div>
     <div class="col-sm-12" id="below">
         <span style="font-weight: 800;font-size: 20px; padding:10px 0 10px 20px;">ATTENDANCE STATUS</span>
         <span style="font-weight: 700;font-size: 15px; padding:10px 0 10px 70px;">Name: <%=request.getParameter("name") %></span><br>
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
   </body>
</html>
