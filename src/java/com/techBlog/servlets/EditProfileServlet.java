/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techBlog.servlets;

import com.techBlog.dao.UserDao;
import com.techBlog.entities.Message;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import com.techBlog.helper.Helper;
import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //fetch all data from form & then pass 
            String uname = request.getParameter("uname");
            String umobile = request.getParameter("umobile");

            //to fetch files like pic and doc use Part
            Part part = request.getPart("newprofile");
            String newprofilepic = part.getSubmittedFileName();

            //get user detail who want to update
            HttpSession hs = request.getSession();
            User u = (User) hs.getAttribute("CurrentUser");
            //first get old pic name bcoz we have to remove it fro disk further 
            String oldPic = u.getProfile();

            //set new values to requested profile
            u.setName(uname);
            u.setMobile(umobile);

            if (part.getSubmittedFileName().equals("")) {
                u.setProfile(oldPic);
            } else {
                 //find old pic in disk to delete
                String oldPicpath = request.getRealPath("/") + "Pics" + File.separator + oldPic;
               
                 String newPicpath = request.getRealPath("/") + "Pics" + File.separator + newprofilepic;
                //delete old pic 
                Helper.deleteFile(oldPicpath);
                Helper.saveFile(part.getInputStream(), newPicpath);
                u.setProfile(newprofilepic);
            }

            //oldPic=u.getProfile();
            //now assign new pic to profile which is requested by user
            //call model( business logic) to do Db interaction
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            //call update method 
            //this will update in Database 
            boolean pfupdate = dao.updateUser(u);  //Db value updated
            //now to update in web/pics (disk) folder 
            if (pfupdate) {

               
                Message msg = new Message("Profile updated", "success", "success");

                hs.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            } else {
                out.print("profile not updated error");
                Message msg = new Message("Profile not updated", "danger", "danger");

                hs.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
