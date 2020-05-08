<%@page import="com.techBlog.dao.LikeDao"%>
<%@page import="com.techBlog.entities.User"%>
<%@page import="com.techBlog.dao.UserDao"%>
<%@page import="com.techBlog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page errorPage="ErrorPage.jsp" %>
<div class="row">
    <%
       
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
     
        List<Post> posts =pd.getAllPost() ;
        for (Post allpost : posts) {
    %>
    <div class="col md-4 offset-md-2">
        <div class="card">
            <b class="text-center"><%=allpost.getPtitle()%></b>
            <img src="Blog_pics/<%=allpost.getPpic()%>"  class="card-img-top" alt="...">
            <div class="card-body">

                <p><%=allpost.getPprog()%></p>
                </div>
                <div class="card-footer text-center primary-background">
                    <a href="showPost.jsp?postid=<%=allpost.getPid()%>" class="btn btn-outline-light  ">Read More..</a>
                  </div>

        </div>

    </div>
   <%
        }

    %>
</div>

