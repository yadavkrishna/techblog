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
        User u=(User) session.getAttribute("CurrentUser");
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        int id= Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (id==0) {
                posts=pd.getAllPost() ;
            } else {
                posts=pd.getAllPostByCid(id);
            }
        if(posts.size()==0){
            out.print("<h3>No post uploaded yet in this category.</h3>");
            return;
        }
        for (Post allpost : posts) {
    %>
    <div class="col md-4 ">
        <div class="card my-2 p-1 ">
            <b class="text-center primary-background "><%=allpost.getPtitle()%></b>
            <img src="Blog_pics/<%=allpost.getPpic()%>" class="card-img-top" alt="...">
            <div class="card-body">

                
                <p class="text"><%=allpost.getPcontent()%></p>
                <p class="text"><%=allpost.getPprog()%><br></p>
                <p><a href=""><%=allpost.getPlink()%></a><br></p>
                <p><%=allpost.getPuploaddate().toLocaleString()%></p><br>
                
            </div>
                <div class="card-footer text-center primary-background">
                    <%
                        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                    %>
                    <a href="showPost.jsp?postid=<%=allpost.getPid()%>" class="btn btn-outline-light  ">Read More..</a>
                    <a href="#" onclick="dolike(<%=allpost.getPid()%>,<%=u.getId() %>);" class="btn btn-outline-light  "><i class="fa fa-thumbs-o-up" class="likeCounter"><span > <%=ld.getLikeByPostId(allpost.getPid())%></span></i></a>
                    <a href="#" class="btn btn-outline-light  "><i class="fa fa-comments"></i></a>
                </div>

        </div>

    </div>
    <%
        }

    %>
</div>

