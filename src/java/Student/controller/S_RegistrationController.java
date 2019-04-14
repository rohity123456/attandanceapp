
package Student.controller;

import DAO.Student.StudentOperation;
import bean.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author rohity123
 */
public class S_RegistrationController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
     int username,rollno,sem;
     String name,year,password,address,dept,contact,utype;
     name=request.getParameter("name");
     year=request.getParameter("year");
     rollno=Integer.parseInt(request.getParameter("rollno"));
     sem=Integer.parseInt(request.getParameter("sem"));
     dept=request.getParameter("department");
     address=request.getParameter("address");
     contact=request.getParameter("contact");
     username=Integer.parseInt(request.getParameter("username"));
     password=request.getParameter("password");
     utype=request.getParameter("usertype");
     Student st=new Student(name,sem,year, rollno, dept, address, contact, username , password , utype);
     StudentOperation so=new StudentOperation();
     int i = so.studentInsert(st);
     if(i>0)
     {
     out.println("success");
     response.sendRedirect("adminpanel/admin_student.jsp");
     }
     else
         out.println("something wrong");
    }
}


