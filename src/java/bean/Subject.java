package bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Subject implements Serializable {
   
    @Id
    @Column(unique = true,nullable = false)
    @GeneratedValue
    private int sub_id;
    private String sub_name,su_dept;
    private int sem;

    public Subject() {
    }
    
    public Subject(String sub_name, String su_dept, int sem) {
        this.sub_name = sub_name;
        this.sem = sem;
        this.su_dept = su_dept;
    }

    public int getSub_id() {
        return sub_id;
    }

    public void setSub_id(int sub_id) {
        this.sub_id = sub_id;
    }

    
    public String getSub_name() {
        return sub_name;
    }

    public void setSub_name(String Sub_name) {
        this.sub_name = Sub_name;
    }

    public String getSu_dept() {
        return su_dept;
    }

    public void setSu_dept(String su_dept) {
        this.su_dept = su_dept;
    }
    
    public int getSem() {
        return sem;
    }

    public void setSem(int sem) {
        this.sem = sem;
    }
    
}
