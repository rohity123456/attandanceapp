<%-- 
    Document   : ViewStudent
    Created on : Apr 3, 2019, 4:38:30 PM
    Author     : rohity123
--%>

<%@page import="bean.Subject"%>
<%@page import="DAO.Subject.SubjectOperation"%>
<%@page import="bean.Student"%>
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
        </style>
    </head>
    
        <body>
      <div class="row container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/adminpanel/admin_subject.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> View Subject</span></span>   
           </div>
     <div class="col-sm-12" id="below">
     <div class="topnav">
       <div class="search-container">
       <form action="" name="search">
       <input type="text" placeholder="Search.." name="search">
       <button type="submit"><i class="fa fa-search"></i></button>
       </form>
      </div>
      </div>
   <% 
   if(request.getParameter("search")!=null)
   {
   %>
    <div class="co table-responsive">
        <table class="table table-striped">
   <thead>
    <tr>
      <th scope="col">SUB ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DEPARTMENT</th>
      <th scope="col">SEM</th>
      <th scope="col">DELETE</th>
  </thead>
  <%
        SubjectOperation sp=new SubjectOperation();
        String Name=request.getParameter("search");
        List li=sp.searhByName(Name);
        ListIterator lit=li.listIterator();
        if(li.isEmpty())
         {
    %><tr>
      <td> No Record Found </td>
      </tr>
   <%} 
      else
        while(lit.hasNext())
            {
                Subject st=(Subject)lit.next();
            %>
            <tbody>
    <tr>
        <td><%= st.getSub_id()  %></td>
        <td><%= st.getSub_name() %></td>
        <td><%= st.getSu_dept() %></td>
        <td><%= st.getSem() %></td>
        <td><a href="../adminpanel/updateanddelete/deleteSubject.jsp?id=<%= st.getSub_id()%>"><i class="fas fa-trash"></i></a> </td>
     </tr>
     </tbody>
     <%}%>
</table>
        </div>
     
   
     <%} %>
   
        <div class="co table-responsive">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">SUB ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DEPARTMENT</th>
      <th scope="col">SEM</th>
      <th scope="col">DELETE</th>
  </thead>
        <%
        SubjectOperation sp=new SubjectOperation();
        List li=sp.subjectSelectAll();
        ListIterator lit=li.listIterator();
         while(lit.hasNext())
            {
                Subject st=(Subject)lit.next();
            %>
            <tbody>
    <tr>
        <td><%= st.getSub_id() %></td>
        <td><%= st.getSub_name() %></td>
        <td><%= st.getSu_dept() %></td>
        <td><%= st.getSem() %></td>
        <td><a href="updateanddelete/deleteSubject.jsp.jsp?id=<%= st.getSub_id() %>"><i class="fas fa-trash"></i></a> </td>
     </tr>
     </tbody>
     <%}%>
</table>
        </div>
            </div>
        </div>
    </body>
</html>
