/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Attendance;

import bean.Attendance;
import java.util.Date;
import java.util.List;

/**
 *
 * @author rohity123
 */
public interface AttendanceInterface {
   public List absentStudentList(String dept,int sem,String date);
   public int attendanceInsert(Attendance st);
   public int getstudentCount(String dept,int sem);
   Attendance attendanceSelect(int id);
   public List attendanceSelectbydept(String dept,int sem);
   public List StudentListforAttendance(String sub, int sem,String date);
   public int DaysPresent(int rollno,String subname);
   public int DaysAbsent(int rollno, String subname);
}
