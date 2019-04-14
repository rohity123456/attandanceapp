package Teacher.controller;

import DAO.Teacher.TeacherOperation;
import bean.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class TeacherUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
      int username;
     String name,password,address,dept,desig,utype,plink,pholink;
     name=request.getParameter("name");
     dept=request.getParameter("department");
     address=request.getParameter("address");
     desig=request.getParameter("designation");
     plink=request.getParameter("profilelink");
     pholink=request.getParameter("photolink");
     username=Integer.parseInt(request.getParameter("username"));
     password=request.getParameter("password");
     utype=request.getParameter("usertype");
     Teacher st=new Teacher(username, name, dept, address, desig, password, utype, plink, pholink);
     TeacherOperation so=new TeacherOperation();
     long i = so.TeacherUpdate(st,username);
     if(i>0)
     {
     response.sendRedirect("../AttendanceApp/adminpanel/ViewTeacher.jsp");
     }
     else
        out.println("some problem occurred while updation data");
    }
}
