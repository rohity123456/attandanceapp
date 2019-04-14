/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Teacher.controller;

import DAO.Teacher.TeacherOperation;
import bean.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author rohity123
 */
public class T_RegistrationController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
     PrintWriter out=response.getWriter();
      int username;
     String name,pholink,plink,password,address,dept,desig,utype;
     name=request.getParameter("name");
     dept=request.getParameter("department");
     address=request.getParameter("address");
     desig=request.getParameter("designation");
     plink=request.getParameter("profilelink");
     pholink=request.getParameter("photolink");
     username=Integer.parseInt(request.getParameter("username"));
     password=request.getParameter("password");
     utype=request.getParameter("usertype");
     Teacher st=new Teacher(username, name, dept, address, desig,password, utype, plink, pholink) ;
     TeacherOperation so=new TeacherOperation();
     long i = so.TeacherInsert(st);
     if(i>0)
     {
     out.println("success");
     response.sendRedirect("adminpanel/admin_homepage.jsp");
     }
     else
         out.println("something wrong");
    }
}


