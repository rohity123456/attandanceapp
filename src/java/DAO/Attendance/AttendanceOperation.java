/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Attendance;
import Attendance.controller.A_RegistrationController;
import bean.Attendance;
import bean.Record;
import bean.Student;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author rohity123
 */
public class AttendanceOperation implements AttendanceInterface{

        SessionFactory sf;
        Session ss;

    public AttendanceOperation() {
      sf=helpingClasses.SessionFact.getSessionFact();
      ss=sf.openSession();
    }

    @Override
    public int attendanceInsert(Attendance st) {
     Transaction tx=ss.beginTransaction();
      ss.save(st);
      ss.flush();
      tx.commit();
      return st.getAid();
    }
@Override
    public Attendance attendanceSelect(int id) {
    Attendance st=null;
        String hql="from bean.Attendance where sub_id='"+id+"'";
     Query query=ss.createQuery(hql);
     List<Attendance> li=query.list();
     ListIterator lit=li.listIterator();
      while(lit.hasNext())
            {
                st=(Attendance)lit.next();
            }
        if(st!=null)
        {
        return st;
        }
        return null;
    }

    @Override
    public List attendanceSelectbydept(String dept, int sem) {
     String hql="from bean.Attendance where sem='"+sem+"' AND su_dept='"+dept+"'";
     Query query=ss.createQuery(hql);
     List<Attendance> li=query.list();
        if(li!=null)
        {
        return li;
        }
        return null;
    }

    @Override
    public int getstudentCount(String dept, int sem) {
       
        Transaction tx=ss.beginTransaction();
        try{
        String hql="select count(*) from bean.Student where d_name='"+dept+"' AND sem='"+sem+"' ";
        int count = ((Long)ss.createQuery(hql).uniqueResult()).intValue();
        tx.commit();
        if(count>0)
        return count;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;
        }
        
        return 0;
    }

    @Override
    public List absentStudentList(String dept, int sem,String date) {
        String date1 = date.substring(0, 10);
     String hql="select s_username from bean.Student where s_username NOT IN(select s_username from bean.Attendance where sem='"+sem+"' AND d_name='"+dept+"' AND a_status='present' AND date='"+date1+"')";
     Query query=ss.createQuery(hql);
     List<Integer> li=query.list();
        if(li!=null)
        {
        return li;
        }
        return null;
    }
    @Override
    public List StudentListforAttendance(String sub, int sem,String date) {
        String date1 = date.substring(0, 10);
     String hql="select s.name,s.rno,a.a_status from Student as s , Attendance as a where s.s_username=a.s_username AND s.sem='"+sem+"' AND a.subname='"+sub+"' AND a.date='"+date1+"' ORDER BY s.rno";
     Query query=ss.createQuery(hql);
     List<Object[]>li=(List<Object[]>)query.list();
        if(li!=null)
        {
        return li;
        }
        return null;
    }

    @Override
    public int DaysPresent(int rollno, String subname) {
      String hql="select count(*) from Attendance as a ,Student as s where s.s_username=a.s_username AND s.rno='"+rollno+"' AND a.subname='"+subname+"' AND a.a_status='present'";
     int count = ((Long)ss.createQuery(hql).uniqueResult()).intValue();
        if(count>0)
        {
        return count;
        }
        return 0;
    }
    @Override
    public int DaysAbsent(int rollno, String subname) {
      String hql="select count(*) from Attendance as a ,Student as s where s.s_username=a.s_username AND s.rno='"+rollno+"' AND a.subname='"+subname+"' AND a.a_status='absent'";
     int count = ((Long)ss.createQuery(hql).uniqueResult()).intValue();
        if(count>0)
        {
        return count;
        }
        return 0;
    }
    public static void main(String[] args) {
        {
            AttendanceOperation ap=new AttendanceOperation();
            System.out.println("Present "+ap.DaysPresent(77,"ERP"));
            System.out.println("Absent "+ap.DaysAbsent(77,"ERP"));
        }
    }
}
