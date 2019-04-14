package Student.controller;

import DAO.Student.StudentOperation;
import DAO.Teacher.TeacherOperation;
import bean.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class StudentUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
      int username,rollno,sem;
     String name,batch,password,address,dept,contact,utype;
     name=request.getParameter("name");
      sem=Integer.parseInt(request.getParameter("sem"));
     batch=request.getParameter("year");
     rollno=Integer.parseInt(request.getParameter("rollno"));
     dept=request.getParameter("department");
     address=request.getParameter("address");
     contact=request.getParameter("contact");
     username=Integer.parseInt(request.getParameter("username"));
     password=request.getParameter("password");
     utype=request.getParameter("usertype");
     Student st=new Student(name,sem, batch, rollno, dept, address, contact, username , password , utype);
     StudentOperation so=new StudentOperation();
     long i = so.studentUpdate(st,username);
     if(i>0)
     {
     response.sendRedirect("../AttendanceApp/adminpanel/ViewStudent.jsp");
     }
     else
        out.println("some problem occurred while updation data");
    }
    public static void main(String[] args) {
        boolean s;
        StudentOperation sp=new StudentOperation();
        s=sp.studentDelete(123456);
        System.out.println("Name is="+s);
    }
}
