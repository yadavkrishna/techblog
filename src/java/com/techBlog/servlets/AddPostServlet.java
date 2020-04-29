
package com.techBlog.servlets;

import com.techBlog.dao.PostDao;
import com.techBlog.entities.Post;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import com.techBlog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author krish
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */

            String ptitle = request.getParameter("ptitle");
            String id = request.getParameter("cid");
            int cid = Integer.valueOf(id);
            String pcontent = request.getParameter("pdesc");
            String pprogram = request.getParameter("pprog");
            String plink = request.getParameter("plink");
            //to fetch files like pic and doc use Part
            Part part = request.getPart("ppic");
            
            String ppic;
            if(part.getSubmittedFileName().equals("")){
                ppic="default.png";
            }else{
                ppic=part.getSubmittedFileName();
           }

            //get user id  detail who want to post
            HttpSession hs = request.getSession();
            User u = (User) hs.getAttribute("CurrentUser");
            int puid = u.getId();

            //Modal intract with DB 
            Post p = new Post(cid, puid, ptitle, pcontent, pprogram, ppic, plink);

            //pass data to PostDao
            PostDao pd = new PostDao(ConnectionProvider.getConnection());
            //saving post
            boolean posted = pd.savePost(p);
            if (posted) {
                //path for blog pics in disk
                String blogpicpath = request.getRealPath("/") + "Blog_pics" + File.separator + ppic;
                Helper.saveFile(part.getInputStream(), blogpicpath);
                out.print("done");
            } else {
                out.print("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
