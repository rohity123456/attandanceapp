package controller;

import bean.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
public class test extends HttpServlet {

    
    SessionFactory sf;
    Session ss;

    public test() {
        sf=helpingClasses.SessionFact.getSessionFact();
       ss=sf.openSession();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionFactory sf=helpingClasses.SessionFact.getSessionFact();
        PrintWriter p=resp.getWriter();
        p.println("dvdfvnkdjfbk");
    }
      public Teacher teacherSelect(int username) {
        Teacher t=(Teacher)ss.get(Teacher.class, username);
        if(t!=null)
        {
        return t;
        }
        return null;
    }
    public static void main(String[] args) {
        test l=new test();
         Teacher user1= l.teacherSelect(1234);
         System.out.println("Name is: "+user1.getT_name()); 
    }
}
