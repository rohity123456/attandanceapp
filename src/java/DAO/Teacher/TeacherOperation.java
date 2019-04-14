package DAO.Teacher;
/**
 *
 * @author rohity123
 */
  import bean.Teacher;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class TeacherOperation implements TeacherInterface{

    SessionFactory sf;
    Session ss;

    public TeacherOperation() {
      sf=helpingClasses.SessionFact.getSessionFact();
      ss=sf.openSession();
    }

    @Override
    public long TeacherInsert(Teacher st) {
      Transaction tx=ss.beginTransaction();
      ss.save(st);
      ss.flush();
      tx.commit();
      return st.getT_username();
    }

    @Override
    public long TeacherUpdate(Teacher st, int id) {
        Transaction tx=ss.beginTransaction();
        st.setT_username(id);
        ss.update(st);
        tx.commit();
        return id;
    }

    @Override
    public boolean TeacherDelete(int id) {
        Teacher st=new Teacher();
        st.setT_username(id);
        Transaction tx=ss.beginTransaction();
        try{
        ss.delete(st);
        tx.commit();
        return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
        
    }
 @Override
    public Teacher TeacherSelect(int id) {
        Teacher st=(Teacher)ss.get(Teacher.class, id);
        if(st!=null)
        {
        return st;
        }
        return null;
    }

    @Override
    public List TeacherSelectAll() {
     String hql="from bean.Teacher";
     Query query=ss.createQuery(hql);
     List<Teacher> li=query.list();
     return li;
      }

    @Override
    public List searhByName(String Name) {
        Criteria c=ss.createCriteria(Teacher.class);
        c.add(Restrictions.like("t_name","%"+Name+"%"));
        List li=c.list();
            return li;
             
}
    public static void main(String[] args) {
        TeacherOperation s=new TeacherOperation();
        Teacher s1= s.TeacherSelect(1234);
        System.out.println("Name is"+s1.getT_name());
    }
}
    
