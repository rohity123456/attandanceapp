package DAO.Subject;
import bean.Subject;
import java.util.List;

public interface SubjectInterface {
   int subjectInsert(Subject st);
   boolean subjectDelete(int id);
   Subject subjectSelect(int id);
   public List subjectSelectbydept(String dept,int sem);
   public List subjectSelectAll();
   public List searhByName(String Name);
 }
