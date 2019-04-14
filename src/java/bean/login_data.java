package bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class login_data implements Serializable {
   @Id
    @GeneratedValue
    private long l_id;
    @Column(unique = true,nullable = false)
    private String username;
    private String password,u_type;

    public long getL_id() {
        return l_id;
    }

    public void setL_id(long l_id) {
        this.l_id = l_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getU_type() {
        return u_type;
    }

    public void setU_type(String u_type) {
        this.u_type = u_type;
    }
    
}
