/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Student;

import bean.Student;
import java.util.List;

public interface StudentInterface {
   int studentInsert(Student st);
   int studentUpdate(Student st,int id);
   boolean studentDelete(int id);
   public List studentSelectbydept(String dept,int sem);
   Student studentSelect(int id);
   public List studentSelectAll();
   public List searhByName(String Name);
 }
