/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Login_service;
import DAO.Student.StudentOperation;
import bean.Teacher;
import bean.Student;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author rohity123
 */
public class LoginController extends HttpServlet {

@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     Teacher user1,user2;
     Student user;
     StudentOperation sp=new StudentOperation();
     int userId = Integer.parseInt(request.getParameter("username"));   
     String password = request.getParameter("pwd");
     String utype = request.getParameter("utype");
     Login_service loginService = new Login_service();
     boolean result = loginService.authenticateUser(userId, password,utype);
     if(result == true){
         if(utype.equals("Admin")){
          user1= loginService.teacherSelect(userId);
         request.getSession().setAttribute("user1", user1);      
         response.sendRedirect("adminpanel/admin_homepage.jsp");    
         }
         if(utype.equals("Teacher")){
          user2= loginService.teacherSelect(userId);
         request.getSession().setAttribute("user2", user2);      
         response.sendRedirect("teacherpanel/teacher_homepage.jsp");    
         }
         if(utype.equals("Student")){
          user=sp.studentSelect(userId) ;
         request.getSession().setAttribute("user", user);      
         response.sendRedirect("studentpanel/student_homepage.jsp");    
         }
         
     }
     else{
         PrintWriter out=response.getWriter();
       request.setAttribute("errMsg", "!Sorry,Incorrect Credentials");
       RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
       rd.forward(request, response);  
     }
}
}
