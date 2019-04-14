package DAO.Teacher;
/**
 *
 * @author rohity123
 */
import bean.Teacher;
import java.util.List;

public interface TeacherInterface {

   long TeacherInsert(Teacher st);
   long TeacherUpdate(Teacher st,int id);
   boolean TeacherDelete(int id);
   Teacher TeacherSelect(int id);
   public List TeacherSelectAll();
   public List searhByName(String Name);
    
}
