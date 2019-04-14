package bean;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Student implements Serializable {
    @Id
    @Column(nullable = false)
    private int rno;
    @Column(unique = true,nullable = false)
    private int s_username;
    private int sem;
    private String name,batch,address,contact,d_name,s_pass,s_utype;

    public Student() {
    }

    public Student(String name,int sem,String batch, int rno,String d_name,String address, String contact , int s_username , String s_pass, String s_utype) {
        this.rno = rno;
        this.sem = sem;
        this.name = name;
        this.batch=batch;
        this.address = address;
        this.contact = contact;
        this.d_name = d_name;
        this.s_pass = s_pass;
        this.s_username = s_username;
        this.s_utype = s_utype;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }
    
   public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getSem() {
        return sem;
    }

    public void setSem(int sem) {
        this.sem = sem;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getS_pass() {
        return s_pass;
    }

    public void setS_pass(String s_pass) {
        this.s_pass = s_pass;
    }

    public int getS_username() {
        return s_username;
    }

    public void setS_username(int s_username) {
        this.s_username = s_username;
    }

    public String getS_utype() {
        return s_utype;
    }

    public void setS_utype(String s_utype) {
        this.s_utype = s_utype;
    }


    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }
    
}
