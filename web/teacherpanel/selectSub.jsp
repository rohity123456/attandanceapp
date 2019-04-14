<%@page import="bean.Teacher"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="bean.Subject"%>
<%@page import="DAO.Subject.SubjectOperation"%>
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
         Subject s=new Subject();
         SubjectOperation sp=new SubjectOperation();
         String dept=request.getParameter("department");
         int sem=Integer.parseInt(request.getParameter("sem"));
         List li=sp.subjectSelectbydept(dept, sem);
         ListIterator lit=li.listIterator();
         int c=0;
         %>
         <%
             Teacher st1=(Teacher)session.getAttribute("user2");
          %>
               <div class=" container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/teacherpanel/teacher_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Take Attendance</span></span>   
           </div>
            <div class="col-sm-12" id="below">

         <%
         while(lit.hasNext())
            {   
                c++;
                Subject st=(Subject)lit.next();
        %>    
        <a href="selectStudents.jsp?dept=<%=st.getSu_dept()%>&subject=<%=st.getSub_name()%>&sem=<%=st.getSem()%>&date=<%=request.getParameter("date")%>&tusername=<%=st1.getT_username() %>" style="text-decoration: none;font-size: 20px;display: block;color: black; border-bottom: 3px solid #999999; margin-bottom: 10px; background-color: #F4F5F5"> <%=c%>. <%=st.getSub_name()%></a>
    
        <% }%>
        
         
            </div>
        </div>
    </body>
</html>
