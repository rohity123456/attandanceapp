<%@page import="DAO.Student.StudentOperation"%>
<%@page import="bean.Student"%>
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
                margin-bottom: 10px;
                border: 3px white solid;
            }
            
        </style>
    </head>
    <body>
        <%
         Student s=new Student();
         StudentOperation sp=new StudentOperation();
         String dept=request.getParameter("dept");
         int sem=Integer.parseInt(request.getParameter("sem"));
         List li=sp.studentSelectbydept(dept,sem);
         ListIterator lit=li.listIterator();
         int c=0;
         %>
               <div class=" container">
            <div class="col-sm-12" id="top">
                <span id="bar" style=" float: left; margin-top: 25px;"><a href="/AttendanceApp/teacherpanel/teacher_homepage.jsp"><i class="fas fa-long-arrow-alt-left" style="color: white; font-size: 25px"></i></a><span style="clear:left ; font-size: 20px; color: white; "> Take Attendance</span></span>   
           </div>
            <div class="col-sm-12" id="below">
                <input type="button" class="ss" onclick='selectAll()' value="Select All" style="margin-left: 40px"/>
                <input type="button" class="ss" onclick='UnSelectAll()' value="Unselect All"/>
                <form action="../A_RegistrationController" method="get" id="formc">
         <%
         while(lit.hasNext())
            {   
                c++;
                Student st=(Student)lit.next();
        %>  
        <div class="form-group" style="display: none">
        <input type="text" class="form-control" name="dept" value="<%=request.getParameter("dept")%>">
        </div>
        <div class="form-group" style="display: none">
                    <input type="text" class="form-control" name="sem" value="<%=request.getParameter("sem")%>">
            </div>
        <div class="form-group" style="display: none">
            <input type="text" class="form-control" name="date" value="<%=request.getParameter("date")%>">
            </div>
            
            <div class="form-group" style="display: none">
            <input type="text" class="form-control" name="subname" value="<%=request.getParameter("subject")%>">
            </div>
            <div class="form-group" style="display: none">
            <input type="text" class="form-control" name="tusername" value="<%=request.getParameter("tusername")%>">
            </div>
             <div class="form-group">
            <span style="font-size: 20px;"> <%=st.getRno() %>.<%=st.getName()%></span>
            <input type="checkbox"  name="present" value="<%=st.getS_username() %>" style="float: right;  width: 28px; height: 28px; ">
            </div>
                
        <% }%>
        <button type="submit" class="btn btn-default ss" style="border-radius: 15px;margin-left: 35%;">Submit</button>
        </form>
         
            </div>
        </div>
         <script>
     function selectAll() {
        var items = document.getElementsByName('present');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type === 'checkbox')
                items[i].checked = true;
        }
    }
     function UnSelectAll() {
        var items = document.getElementsByName('present');
        for (var i = 0; i < items.length; i++)
         {
            if (items[i].type === 'checkbox')
                items[i].checked = false;
        }
    }	
         </script>
    </body>
</html>
