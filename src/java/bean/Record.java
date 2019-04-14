package bean;
public class Record {
 
 private String name;
 private int rno;
 private String status;

    public Record() {
    }

    public Record(int rno, String name, String status) {
        this.rno = rno;
        this.name = name;
        this.status = status;
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
 
}
