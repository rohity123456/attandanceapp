package bean;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;
import javax.persistence.Temporal;
@Entity
public class Attendance implements Serializable {
    @Id
    @GeneratedValue
    @Column(unique = true,nullable = false)
    private int Aid;
    private int s_username,t_username;
    private int sem;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date;
    private String d_name,a_status,subname;

    public Attendance() {
    }

    public Attendance(int s_username, int t_username, int sem, Date date, String d_name, String a_status, String subname) {
        this.s_username = s_username;
        this.t_username = t_username;
        this.sem = sem;
        this.date = date;
        this.d_name = d_name;
        this.a_status = a_status;
        this.subname = subname;
    }


    public int getAid() {
        return Aid;
    }

    public void setAid(int Aid) {
        this.Aid = Aid;
    }
    
    
    public int getS_username() {
        return s_username;
    }

    public void setS_username(int s_username) {
        this.s_username = s_username;
    }

    public int getT_username() {
        return t_username;
    }

    public void setT_username(int t_username) {
        this.t_username = t_username;
    }

    public int getSem() {
        return sem;
    }

    public void setSem(int sem) {
        this.sem = sem;
    }

    public Date getDate() {
        return date;
    }

    public void setD(Date date) {
        this.date = date;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getA_status() {
        return a_status;
    }

    public void setA_status(String a_status) {
        this.a_status = a_status;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }
    
    
}

