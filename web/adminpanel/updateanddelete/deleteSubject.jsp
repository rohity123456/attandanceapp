
<%@page import="DAO.Subject.SubjectOperation"%>
<%@page import="DAO.Student.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    boolean b=false;
    SubjectOperation sp=new SubjectOperation();
    b=sp.subjectDelete(id);
    if(b)
    {
      response.sendRedirect("../ViewSubject.jsp");
    }
    else
     out.println("There is some problem please try again later");
    %>

</html>
