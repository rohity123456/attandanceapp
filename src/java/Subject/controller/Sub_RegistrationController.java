
package Subject.controller;

import DAO.Subject.SubjectOperation;
import bean.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author rohity123
 */
public class Sub_RegistrationController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
     int sem;
     String name,dept;
     name=request.getParameter("name");
     sem=Integer.parseInt(request.getParameter("sem"));
     dept=request.getParameter("department");
     Subject st=new Subject(name, dept, sem);
     SubjectOperation so=new SubjectOperation();
     int i = so.subjectInsert(st);
     if(i>0)
     {
     out.println("success");
     response.sendRedirect("adminpanel/admin_subject.jsp");
     }
     else
         out.println("something wrong");
    }
}


