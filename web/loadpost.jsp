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
        User u=(User)session.getAttribute("CurrentUser");
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
        <div class="card">
            <img src="Blog_pics/<%=allpost.getPpic()%>" style="border-radius:20px; max-height: 200px; max-width:250px; " class="card-img-top" alt="...">
            <div class="card-body">

                <b>Title: <%=allpost.getPtitle()%></b>
                <p><b>Content:</b> <%=allpost.getPcontent()%></p>
                <p><b>Program if any:</b> <%=allpost.getPprog()%><br></p>
                <p><b>Links:</b> <%=allpost.getPlink()%><br></p>
                <p><b>Upload date</b><p><%=allpost.getPuploaddate()%></p><br>
                <p><b>Uploaded by</b><p><%=allpost.getPuid() %></p>

            </div>
                <div class="card-footer text-center bg-dark">
                    <%
                        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                    %>
                    <a href="showPost.jsp?postid=<%=allpost.getPid()%>" class="btn btn-outline-light  ">Read More..</a>
                    <a href="#" onclick="dolike(<%=allpost.getPid()%>,<%=u.getId() %>)" class="btn btn-outline-light  "><i class="fa fa-thumbs-o-up" class="likeCounter"><span > <%=ld.getLikeByPostId(allpost.getPid())%></span> likes</i></a>
                    <a href="#" class="btn btn-outline-light  "><i class="fa fa-comments"><span>20</span></i></a>
                    
                </div>

        </div>

    </div>


    <%
        }

    %>
</div>

