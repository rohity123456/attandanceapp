/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Teacher implements Serializable {
    
    @Id
    @Column(unique = true,nullable = false)
    private int t_username;
    private String t_name,t_dept,t_address,t_designation,t_pass,t_utype,t_userLink,t_photoLink;

    public Teacher() {
    }

    public Teacher(int t_username, String t_name, String t_dept, String t_address, String t_designation, String t_pass, String t_utype, String t_userLink, String t_photoLink) {
        this.t_username = t_username;
        this.t_name = t_name;
        this.t_dept = t_dept;
        this.t_address = t_address;
        this.t_designation = t_designation;
        this.t_pass = t_pass;
        this.t_utype = t_utype;
        this.t_userLink = t_userLink;
        this.t_photoLink = t_photoLink;
    }
    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getT_dept() {
        return t_dept;
    }

    public void setT_dept(String t_dept) {
        this.t_dept = t_dept;
    }

    public String getT_address() {
        return t_address;
    }

    public String getT_userLink() {
        return t_userLink;
    }

    public void setT_userLink(String t_userLink) {
        this.t_userLink = t_userLink;
    }

    public String getT_photoLink() {
        return t_photoLink;
    }

    public void setT_photoLink(String t_photoLink) {
        this.t_photoLink = t_photoLink;
    }
    
    public void setT_address(String t_address) {
        this.t_address = t_address;
    }

    public String getT_designation() {
        return t_designation;
    }

    public void setT_designation(String t_designation) {
        this.t_designation = t_designation;
    }

    public String getT_pass() {
        return t_pass;
    }

    public void setT_pass(String t_pass) {
        this.t_pass = t_pass;
    }

    public int getT_username() {
        return t_username;
    }

    public void setT_username(int t_username) {
        this.t_username = t_username;
    }

    public String getT_utype() {
        return t_utype;
    }

    public void setT_utype(String t_utype) {
        this.t_utype = t_utype;
    }
}
