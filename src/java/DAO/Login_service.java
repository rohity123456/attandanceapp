package DAO;
import DAO.Student.StudentOperation;
import bean.Student;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import bean.Student;
import bean.Teacher;
import org.hibernate.SessionFactory;
 
public class Login_service {
   SessionFactory sf;
    Session ss;

    public Login_service() {
        sf=helpingClasses.SessionFact.getSessionFact();
       ss=sf.openSession();
    }
    
  public boolean authenticateUser(int userId, String password,String utype) {
        StudentOperation sp=new StudentOperation();
        Student user = sp.studentSelect(userId);
        Teacher user1 = (Teacher)ss.get(Teacher.class,userId);
        if(utype.equals("Student")){
        if(user!=null && user.getS_username()==(userId) && user.getS_pass().equals(password)){
            return true;
        }    
        }
        else if(utype.equals("Admin")){
         
            if(user1!=null && user1.getT_username()==userId && user1.getT_pass().equals(password)){
            return true;
        }    
        }
        else if(utype.equals("Teacher")){
         if(user1!=null && user1.getT_username()==(userId) && user1.getT_pass().equals(password)){
            return true;
        }   
        }
        else{
            return false;
        }
            return false;    
    }    
  public Teacher teacherSelect(int username) {
        Teacher t=(Teacher)ss.get(Teacher.class, username);
        if(t!=null)
        {
        return t;
        }
        return null;
    }
  public Student studentSelect(int username) {
        Student st=(Student)ss.get(Student.class, username);
        if(st!=null)
        {
        return st;
        }
        return null;
    }
   
}
