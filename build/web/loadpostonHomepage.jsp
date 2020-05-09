<%@page import="com.techBlog.dao.LikeDao"%>
<%@page import="com.techBlog.entities.User"%>
<%@page import="com.techBlog.dao.UserDao"%>
<%@page import="com.techBlog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page errorPage="ErrorPage.jsp" %>
<style>
    .text{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
</style>
<div class="row">
    <%
       
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
     
        List<Post> posts =pd.getAllPost() ;
        for (Post allpost : posts) {
    %>
    <div class="col md-4 offset-md-2"><br>
        <div class="card">
            <b class="text-center primary-background p-2 m-1"><%=allpost.getPtitle()%></b>
            <img src="Blog_pics/<%=allpost.getPpic()%>"  class="card-img-top" alt="...">
            <div class="card-body">

                <p class="text"><%=allpost.getPprog()%></p>
                </div>
                <div class="card-footer text-center primary-background m-1">
                    <a  href="showPost.jsp?postid=<%=allpost.getPid()%>" class="btn btn-outline-light ">Read More..</a>
                  </div>

        </div>

    </div>
   <%
        }

    %>
</div>

