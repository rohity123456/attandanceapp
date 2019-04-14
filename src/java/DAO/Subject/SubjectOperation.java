package DAO.Subject;
import DAO.Subject.*;
import bean.Subject;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class SubjectOperation implements SubjectInterface{
     SessionFactory sf;
    Session ss;

    public SubjectOperation() {
      sf=helpingClasses.SessionFact.getSessionFact();
      ss=sf.openSession();
    }

    @Override
    public int subjectInsert(Subject st) {
      Transaction tx=ss.beginTransaction();
      ss.save(st);
      ss.flush();
      tx.commit();
      return st.getSub_id();
    }

    @Override
    public boolean subjectDelete(int id) {
        Subject st=new Subject();
        st.setSub_id(id);
        Transaction tx=ss.beginTransaction();
        try{
        String hql="delete from bean.Subject where sub_id='"+id+"'";
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
    public Subject subjectSelect(int id) {
        Subject st=null;
        String hql="from bean.Subject where sub_id='"+id+"'";
     Query query=ss.createQuery(hql);
     List<Subject> li=query.list();
     ListIterator lit=li.listIterator();
      while(lit.hasNext())
            {
                st=(Subject)lit.next();
            }
        if(st!=null)
        {
        return st;
        }
        return null;
    }
@Override
    public List subjectSelectbydept(String dept,int sem) {
        String hql="from bean.Subject where sem='"+sem+"' AND su_dept='"+dept+"'";
     Query query=ss.createQuery(hql);
     List<Subject> li=query.list();
        if(li!=null)
        {
        return li;
        }
        return null;
    }
    @Override
    public List subjectSelectAll() {
     String hql="from bean.Subject";
     Query query=ss.createQuery(hql);
     List<Subject> li=query.list();
     return li;
      }

    @Override
    public List searhByName(String Name) {
        Criteria c=ss.createCriteria(Subject.class);
        c.add(Restrictions.like("sub_name","%"+Name+"%"));
        List li=c.list();
            return li;
             
}   
}
