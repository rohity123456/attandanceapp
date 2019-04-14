package DAO.Student;
import bean.Student;
import bean.Subject;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class StudentOperation implements StudentInterface{
    SessionFactory sf;
    Session ss;

    public StudentOperation() {
      sf=helpingClasses.SessionFact.getSessionFact();
      ss=sf.openSession();
    }

    @Override
    public int studentInsert(Student st) {
      Transaction tx=ss.beginTransaction();
      ss.save(st);
      ss.flush();
      tx.commit();
      return st.getS_username();
    }

    @Override
    public int studentUpdate(Student st, int id) {
        Transaction tx=ss.beginTransaction();
        st.setS_username(id);
        ss.update(st);
        tx.commit();
        return id;
    }

    @Override
    public boolean studentDelete(int id) {
        Student st=new Student();
        st.setS_username(id);
        Transaction tx=ss.beginTransaction();
        try{
        String hql="delete from bean.Student where s_username='"+id+"'";
        Query query=ss.createQuery(hql);
        int i=query.executeUpdate();
        tx.commit();
        if(i>0)
        return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
        return false;
    }
 @Override
    public List studentSelectbydept(String dept,int sem) {
        String hql="from bean.Student where sem='"+sem+"' AND d_name='"+dept+"' ORDER BY rno";
     Query query=ss.createQuery(hql);
     List<Subject> li=query.list();
        if(li!=null)
        {
        return li;
        }
        return null;
    }
    @Override
    public Student studentSelect(int id) {
        Student st=null;
        String hql="from bean.Student where s_username='"+id+"'";
     Query query=ss.createQuery(hql);
     List<Student> li=query.list();
     ListIterator lit=li.listIterator();
      while(lit.hasNext())
            {
                st=(Student)lit.next();
            }
        if(st!=null)
        {
        return st;
        }
        return null;
    }

    @Override
    public List studentSelectAll() {
     String hql="from bean.Student";
     Query query=ss.createQuery(hql);
     List<Student> li=query.list();
     return li;
      }

    @Override
    public List searhByName(String Name) {
        Criteria c=ss.createCriteria(Student.class);
        c.add(Restrictions.like("name","%"+Name+"%"));
        List li=c.list();
            return li;
             
}   
}
