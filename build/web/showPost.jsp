<%-- 
    Document   : showPost
    Created on : 8 Apr, 2020, 8:41:19 PM
    Author     : krish
--%>

<%@page import="com.techBlog.dao.CommentDao"%>
<%@page import="com.techBlog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techBlog.dao.UserDao"%>
<%@page import="com.techBlog.entities.Post"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>
<%
    //only logined user can access this page
    User u = (User) session.getAttribute("CurrentUser");
    if (u == null) {
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("postid"));
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    Post p = pd.getPostByPid(id);


%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <link href="css/techBlogcss.css" rel="stylesheet" type="text/css"/>
        <%--fontawesome w3school--%>
        <script src="js/jquery-3.4.1.min_1.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--like fun script-->
        <script src="js/likefun.js" type="text/javascript"></script>
        <script src="js/commentFun.js" type="text/javascript"></script>

        <title><%=p.getPtitle()%></title>
        <style>
            .banner-background{
                clip-path: polygon(0 0, 70% 0%, 100% 0, 100% 84%, 68% 90%, 29% 83%, 0 91%, 0% 30%);
            }
            body{
                background: url(images/digitalization.jpeg);
                background-size: cover;
                background-attachment: fixed;

            }
            .ptitle{

                font-weight: 100;
                font-size: 30px;
            }
            .pcnt{
                font-weight: 100;
                font-size: 24px;
            }
            .pcode{
                font-weight: 50;
                font-size: 20px;
            }

            .row_user{
                border: 1px solid #e2e2e2;
            }
        </style>

    </head>
    <body >
        <!--navvar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background fixed-top">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-comments"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-desktop"></span>Report Post</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#addnewpost-modal" > <span class="fa fa-comments	
                                                                                                                  "></span>New Post</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-user-circle-o"></span><%=u.getName()%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"data-toggle="modal" data-target="#profile-modal">My Profile</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">My Courses</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Achievements</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Edit Profile</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet" tabindex="-1" aria-disabled="true"> <span class="fa fa-user	
                                                                                                            "></span>Logout</a>
                    </li> 


                </ul>

            </div>
        </nav>
        <!--main for show post-->
        <main class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card my-2 p-1">
                        <div class="card-header primary-background "
                             <h4 class="ptitle"><%=p.getPtitle()%></h4>
                        </div>
                        <div class="card-body">
                            <div class="img"> 

                                <img src="Blog_pics/<%=p.getPpic()%>" class="card-img-top" alt="image" >
                            </div>
                            <div class="row my-2 row_user">
                                <div class="col-md-6"> 
                                    <%
                                        //to get user name
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                    %>
                                    <p><b>Posted by: </b><a href=""><%=ud.getUsserById(p.getPuid()).getName()%></a></p>
                                </div>
                                <div class="col-md-6 ">
                                    <p><I><%=DateFormat.getDateTimeInstance().format(p.getPuploaddate())%></i></p>
                                </div>
                            </div>
                            <div class="pcmt">

                                <p ><%=p.getPcontent()%></p>

                                <p><%=p.getPprog()%> </p>
                            </div>

                        </div>
                        <div class="text-center container primary-background p-1">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>



                            <a  href="#" onclick="dolike(<%=p.getPid()%>,<%=u.getId()%>)" class="btn btn-outline-light m-1 "><i class="fa fa-thumbs-o-up "><span class="likeCounter"><%=ld.getLikeByPostId(p.getPid())%></span> like</i></a>
                            <a href="#"  class="btn btn-outline-light m-1 " id="cbtn" ><i class="fa fa-comments "><span  class="cmtCounter"></span> </i>comment</a>
                            <a href="#" class="btn btn-outline-light m-1  "><i class="fa fa-send">share</i></a>



                        </div>

                        <div class="container" id="divcomment" >
                            <form id="commentonpost" method="GET" class="form-group">
                                <textarea type="text" name="cmmt" id="cmmt"></textarea>
                                <button onclick="doComment(<%=p.getPid()%>,<%=u.getId()%>)"  type="submit" class="btn btn btn-primary " id="docomment">submit</button>
                            </form>
                        </div>

                    </div>

                </div>


        </main>

        <!--sweet alert js cdn-->
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--Script for comment -->
        <script>
                                    function toggleCmt() {
                                        $("#divcomment").toggle();
                                    }
                                    $(document).ready(function (e) {
                                        console.log("Doc loaded");
                                        $("#divcomment").hide();
                                        $("#cbtn").click(function () {
                                            toggleCmt();
                                        })

                                        //hold form 
                                        $('#docomment').click(function (event) {

                                            event.preventDefault();
                                            console.log("event default stoped");
                                            //fetch data

                                            var cmt = $('#cmmt').val();
                                            console.log("cmt: " + cmt);
                                            $.ajax({
                                                url: 'CommentServlet',
                                                data: "cmt" + cmt,
                                                type: 'GET',
                                                success: function (data, textStatus, jqXHR) {
                                                    console.log(data);
                                                    if (data.trim() == 'done')
                                                        console.log("success");
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    console.log(data);
                                                    console.log("error..");
                                                }


                                            });
                                        })


                                    });


        </script>
    </body>
</html>
