package com.techBlog.servlets;

import com.techBlog.dao.UserDao;
import com.techBlog.entities.Message;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class UserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String tc = request.getParameter("tc"); //check term&condt checked or not
            if (tc == null) {
                out.println("Please select terms & Conditions");
                Message msg = new Message("Please fill all the required fields", "danger", "danger");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("register.jsp");

            } else {
                //fetch Data from view-form and send to -> Model &to ->(Db)
                String name = request.getParameter("uname");
                String email = request.getParameter("uemail");
                String pass = request.getParameter("upass");
                String mobile = request.getParameter("umobile");
                String gender = request.getParameter("gender");

                //now pass data to entities  for set all data 
                User ru = new User(name, email, pass, gender, mobile);

                //now pass all userdao dattabase 
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                if (dao.saveUser(ru)) {
                    out.print("done");
                }
                Message msg = new Message("Registration seccessful! Login here ", "success", "success");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);

                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } catch (Exception se) {
            out.print("Error\n" + se);
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
