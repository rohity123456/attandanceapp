package bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
/**
 *
 * @author rohity123
 */
@Entity
public class Department implements Serializable {
    @Id
    @Column(unique = true,nullable = false)
    private int dept_no;
    private String d_name;

    public Department() {
    }
    
    
    public Department(int dept_no, String d_name) {
        this.dept_no = dept_no;
        this.d_name = d_name;
    }
    
    public int getDept_no() {
        return dept_no;
    }

    public void setDept_no(int dept_no) {
        this.dept_no = dept_no;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }
    
    
}
