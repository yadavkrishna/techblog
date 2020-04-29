package com.techBlog.servlets;

import com.techBlog.dao.CommentDao;
import com.techBlog.entities.Comment;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author krish
 */
public class CommentServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
           
            //fetch data from reques
            String cmt=request.getParameter("cmmt");
            int pid=Integer.parseInt(request.getParameter("pid"));
            int uid=Integer.parseInt(request.getParameter("uid"));
            //int uid=request.getParameter("uid");
           // int pid=Integer.valueOf(poid);
           // int uid=Integer.valueOf(urid);
            
            out.println(cmt);
            out.println(pid);
            out.println(uid);
            /*
            String pd=request.getParameter("postid
            int pid =Integer.parseInt(pd);
             int userId = Integer.parseInt(request.getParameter("uid"));
            out.println(userId);
            out.println(pd);
            int id = Integer.valueOf(request.getParameter("uid"));
           */
           
            
            //assign fetched data to comment obj
            Comment cm=new Comment(pid, uid, cmt);
            //call model obj for db interaction
            CommentDao cdao=new CommentDao(ConnectionProvider.getConnection());
            try {
                
               if(cdao.saveCommentOnPost(cm)) 
                out.println("done");
               else
                   out.println("comment not save");
            } catch (Exception sq) {
               sq.printStackTrace();
            }

           
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
