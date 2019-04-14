<%@page import="DAO.Teacher.TeacherOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    TeacherOperation sp=new TeacherOperation();
    boolean b=sp.TeacherDelete(id);
    if(b)
    {
      response.sendRedirect("../ViewTeacher.jsp");
    }
    else
     out.println("There is some problem please try again later");
    %>

</html>
