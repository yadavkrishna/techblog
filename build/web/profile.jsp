<%@page import="com.techBlog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page import="com.techBlog.entities.Message"%>
<%@page import="com.techBlog.entities.User" %>
<%@page errorPage="ErrorPage.jsp" %>


<%
    //only logined user can access this page
    User u = (User) session.getAttribute("CurrentUser");
    if (u == null) {
        response.sendRedirect("login.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Welcome</title>
        <style>
            .banner-background{
                clip-path: polygon(0 0, 70% 0%, 100% 0, 100% 84%, 68% 90%, 29% 83%, 0 91%, 0% 30%);
            }
             body{
                background: url(images/img6.jpeg);
                background-size: cover;
                background-attachment: fixed;
                
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <!--navvar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background fixed-top ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-comments"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-desktop"></span> Learn Code</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-american-sign-language-interpreting"></span>Programing Language
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"> Python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">C</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">C++</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Java</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#" tabindex="-1" aria-disabled="true"> <span class="fa fa-paper-plane-o	
                                                                                                "></span>Contact</a>
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
        </nav><br><br><br><br>
        <!--main body for post display -->
        <main>
            <div class="container">

                <div class="row">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%

                                PostDao pod = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = pod.getAllCategory();
                                for (Category cp : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%=cp.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%=cp.getCname()%></a> 
                            <% }
                            %>
                        </div>

                    </div>
                    <div class="post container col-md-8 ">

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3>Posts Loading...</h3>
                        </div>
                        <div class="container-fluid" id="LoadPost">

                        </div>

                    </div>

                </div> 

            </div>


        </main>
        <!--main body end -->
        <!-- for msg alert -->
        <div class="container">
            <%
                Message m = (Message) session.getAttribute("msg");
                if (m != null) {
            %>
            <div class="alert-<%=m.getType()%>" role="alert-<%=m.getCsstype()%>">
                <%=m.getContent()%>
            </div>

            <%
                    session.removeAttribute("msg");
                }

            %>
        </div>

        <!-- Modal alert for profile popup-->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="Pics/<%=u.getProfile()%>"class="img-fluid" style="border-radius:20px; max-height: 200px; max-width:250px; "><br>
                            <h5 class="modal-title mt-2" id="exampleModalLabel"><%=u.getName()%></h5>


                        </div>
                        <!--profileDetails-->
                        <div id="profileDetail">
                            <!--table-->
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">Id :</th>
                                        <td><%=u.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Name :</th>
                                        <td><%=u.getName()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%=u.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Mobile :</th>
                                        <td><%=u.getMobile()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td><%=u.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on :</th>
                                        <td><%=u.getRegdate()%></td>

                                    </tr>

                                </tbody>
                            </table> 
                        </div>

                        <!--profile edit table form-->

                        <div id="profileEdit" style="display: none;">

                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditProfileServlet" method="post" enctype="multipart/form-data">

                                <table class="table">
                                    <tr>
                                        <td>Id :</td>
                                        <td><%=u.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="text" class="form-control" name="uname" value="<%=u.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><%=u.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile :</td>
                                        <td><input type="text" class="form-control" name="umobile" value="<%=u.getMobile()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>

                                        <td><%=u.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <td>Profile Picture:</td>
                                        <td><input type="file" class="form-control" name="newprofile" value="<%=u.getProfile()%>"></td>
                                    </tr>


                                </table>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary" id="savbtn">Save Changes</button>
                                </div>

                            </form>


                        </div>

                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editbtn">edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal for Add new Post-->
        <div class="modal fade" id="addnewpost-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="postform" action="AddPostServlet" method="Post" enctype="multipart/form-data">
                            <div class="form-group">
                                <select class="form-control"  name="cid">
                                    <option selected disabled >--Select any category--</option>
                                    <%
                                        PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = pd.getAllCategory();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"> <%=c.getCname().toUpperCase()%></option>
                                    <% }
                                    %>
                                </select>
                            </div>
                            <div  class="form-group">
                                <input name="ptitle" type="text" required placeholder="Enter Post title" class="form-control">
                            </div>
                            <div  class="form-group">
                                <textarea name="pdesc" placeholder="Enter post content.." class="form-control"></textarea>
                            </div>
                            <div  class="form-group">
                                <textarea name="pprog" placeholder="Enter program if any" class="form-control"></textarea>
                            </div>
                            <div  class="form-group">
                                <label>Upload pic</label><br>
                                <input name="ppic" type="file" class="form-control">
                            </div>
                            <div  class="form-group">
                                <input name="plink" type="text" required placeholder="Provide links and refrences if any" class="form-control">
                            </div>        

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary" id="addpost">Post</button>  
                            </div>
                        </form>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--Js-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <!--sweet alert js cdn-->
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--profile edit logic -->
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#editbtn').click(function () {

                                        if (editStatus == false)
                                        {
                                            $('#profileDetail').hide()
                                            $('#profileEdit').show()
                                            editStatus = true;
                                            $(this).text("back")

                                        } else
                                        {
                                            $('#profileDetail').show()
                                            $('#profileEdit').hide()
                                            editStatus = false;
                                            $(this).text("edit")

                                        }

                                    });
                                });
        </script>

        <!--script for Do Post  -->
        <script>
            $(document).ready(function (e) {


                $("#postform").on("submit", function (event) {
                    event.preventDefault(); //stop page to go to servlet

                    let form = new FormData(this);
                    //use ajax to do Asynchronous method to save post
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'Post',
                        data: form,
                        //when request successfull

                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("New Post", "Save successfully", "success");
                            } else
                            {
                                swal("Post not save", "Something went wrong.. ", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Post not create", "Something went wrong.. ", "error");
                        },
                        //now we have to specify data format like jason , or nomal data it is
                        processData: false, //this require to process pic, video data
                        contentType: false


                    });
                });
            });
        </script>
        <!--Load Post page   -->
        <script>
            function getPosts(id, temp) {
                $(".c-link").removeClass('active')
                $('#loader').show();
                $("#LoadPost").hide();
                $.ajax({
                    url: 'loadpost.jsp',
                    data: {cid: id},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $("#LoadPost").show();
                        $("#LoadPost").html(data)
                        $(temp).addClass('active')

                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef = $(".c-link")[0]
                getPosts(0, allPostRef)
            })


        </script>


    </body>
</html>
