
package Attendance.controller;
import DAO.Attendance.AttendanceOperation;
import bean.Attendance;
import bean.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
/**
 *
 * @author rohity123
 */
public class A_RegistrationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
     int s_username,t_username,sem,j=0,m=0;
     String dept,status,sdate,subname;
     String students[]=request.getParameterValues("present");
     dept=request.getParameter("dept");
     status="present";
     subname=request.getParameter("subname");
     sem=Integer.parseInt(request.getParameter("sem"));
     sdate=(request.getParameter("date"));
     Date date=new Date();
     date=StringToDate(sdate);
     t_username=Integer.parseInt(request.getParameter("tusername"));
     int a[]=new int[students.length];   
     for (int i = 0; i < students.length; i++) {
               a[i]=Integer.parseInt(students[i]);
        }
    for (int i = 0; i < a.length; i++)
     {
     s_username=a[i];
     Attendance st=new Attendance(s_username, t_username, sem, date, dept,status,subname);
     AttendanceOperation so=new AttendanceOperation();
     j = so.attendanceInsert(st);
     }
        AttendanceOperation sa=new AttendanceOperation();
        List li=sa.absentStudentList(dept,sem,sdate);
        ListIterator lit=li.listIterator();
        status="absent";
        while(lit.hasNext())
        {
            int sta=(int)lit.next();
            Attendance stac=new Attendance(sta,t_username,sem,date, dept,status,subname);
            m=sa.attendanceInsert(stac);
        }
        
      if( j >0)
       {
        out.println("success");
        response.sendRedirect("teacherpanel/teacher_homepage.jsp");
       }
     else
         out.println("something wrong");
    
    
    }
    public Date StringToDate(String s){

    Date result = null;
    try{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        result  = dateFormat.parse(s);
    }

    catch(ParseException e){
        e.printStackTrace();

    }
    return result ;
}
    public static void main(String[] args) {
     A_RegistrationController ap=new A_RegistrationController();
     Date d=new Date();
     d=ap.StringToDate("2019-04-07");
        System.out.println("DATE IS"+d);
    }
   
}


