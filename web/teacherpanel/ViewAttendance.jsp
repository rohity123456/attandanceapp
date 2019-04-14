<%-- 
    Document   : ViewStudent
    Created on : Apr 3, 2019, 4:38:30 PM
    Author     : rohity123
--%>

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
  .topnav {
  overflow: hidden;
  background-color: #e9e9e9;
  margin-left:-10px;
  text-align: center;
}

.topnav .search-container {
  
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}
.topnav input[type=date] {
  width: 100px;
  font-size: 17px;
  border: none;
}
.topnav .search-container button {
  background: #ddd;
  font-size: 20px;
  border: none;
  cursor: pointer;
  background: none;
}

.topnav .search-container button:hover {
  background: #ccc;
}
table{
    margin-top: 20px;
 }
#below{
    overflow: scroll;
}
#below::-webkit-scrollbar{
    display: none;
}
.co::-webkit-scrollbar{
    display: none;
}
th{
    background-color: #000000;
    color: white;
}
tr td a{
    text-decoration: none;
    font-weight: 600;
    border-radius: 4px;
}      

.sname{
    text-decoration: none;
    color: #00BCD4;
}
.sname:hover{
    background-color: #999;
    text-decoration: none;
    color: #00BCD4;
}
        </style>
    </head>
    
      <body>
      <div class="row container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/teacherpanel/teacher_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> View Student</span></span>   
           </div>
     <div class="col-sm-12" id="below">
     <div class="topnav">
       <div class="search-container">
       <form action="" name="search">
                <select name="sem">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  </select>
                   <select name="sub">
                  <option>ERP</option>
                  <option>CSM</option>
                  <option>BDA</option>
                  <option>SNMR</option>
                 </select>
           <input type="date" name="date" placeholder="date">
       <button type="submit"><i class="fa fa-search"></i></button>
       </form>
      </div>
      </div>
   <% 
   if(request.getParameter("date")!=null)
   {
   %>
    <div class="co table-responsive">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col" style="border-radius: 15px; background-color:#00BCD4">Roll No</th>
      <th scope="col" style="border-radius: 15px; background-color:#00BCD4">NAME</th>
      <th scope="col" style="border-radius: 15px; background-color:#00BCD4 ">Status</th>
    </tr>
  </thead>
        <%
        AttendanceOperation sp=new AttendanceOperation();
        String date=request.getParameter("date");
        int sem=Integer.parseInt(request.getParameter("sem"));
        String sub=request.getParameter("sub");
        List<Object[]> li=sp.StudentListforAttendance(sub, sem, date.substring(0,10));
        if(li.isEmpty())
         {
    %><tr>
      <td> No Record Found </td>
      </tr>
   <%} 
      else
        for(Object[] arr : li) {
        
            %>
            <tbody>
    <tr>
        <td><%=  arr[1] %></td>
        <td><a class="sname" href="AttendanceOfStudent.jsp?rno=<%=arr[1]%>&sem=<%=sem%>&name=<%=arr[0]%>"><%= arr[0] %></a></td>
        <td><%= arr[2] %></td>
        </tr>
     </tbody>
     <%}%>
</table>
        </div>
<%} %>
  </div>
</div>
   </body>
</html>
