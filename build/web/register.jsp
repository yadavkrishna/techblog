<%-- 
    Document   : register
    Created on : 07-Mar-2020, 9:35:50 PM
    Author     : krish
--%>

<%@page import="com.techBlog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!--css-->
        <link href="css/techBlogcss.css" rel="stylesheet" type="text/css"/>
        <%--fontawesome w3school--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--jquery downloaded-->
        <script src="js/jquery-3.4.1.min_1.js" type="text/javascript"></script>
        <title>Sign Up</title>
        <style>
            .banner-background{
                clip-path: polygon(0 0, 70% 0%, 100% 0, 100% 84%, 68% 90%, 29% 83%, 0 91%, 0% 30%);
            }
        </style>

    </head>
    <body>
        <%--navbar--%>
        <%@include file="navbar.jsp"%>
        <main class="primary-background banner-background " style="padding-bottom:150px;" >
            <div class="container "style="">
                <div class="col-md-5 offset-md-4 ">
                    <div class="card p-1">
                        <div class="card-header primary-background text-white text-center">
                            <h2><span class="fa fa-user"></span><br>Register</h2>
                        </div>
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
                                    
                        
                        
                        <div class="card-body">
                            <form id="reg-form"  action="UserServlet" method="Post">
                                    <div class="form-group">
                                        <label for="Username">Username</label>
                                        <input type="text" required class="form-control" id="usname" name="uname">
                                    </div>
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Email address</label>
                                        <input name="umail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"></div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" required class="form-control" name="upass">
                                    </div>
                                    <div class="form-group">
                                        <label for="Usermobile">Mobile</label>
                                        <input type="number" required class="form-control" name="umobile">
                                    </div>
                                    <div class="form-group ">
                                        <label for="gender">Gender</label><br>
                                        <input required type="radio" name="gender" value="Male">Male
                                        <input type="radio"  name="gender" value="Female">Female
                                    </div>
                                    <div class="form-group form-check">
                                        <input required type="checkbox" class="form-check-input" id="exampleCheck1" name="tc">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms & condtions</label>
                                    </div>
                                <div class="container text-center" id="loader" style="display:none; ">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h3>Please wait..</h3>
                                    </div>
                                <div class="container text-center ">
                                    <button id="submit-btn" type="submit" class="btn btn-primary btn-lg ">Sign up</button>
                                </div>    
                                </form>

                        </div>

                    </div>


                </div>

            </div>
        </main>



        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        
        
        <!--sweet alert js-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <!--ajax-->
        <script>
            $(document).ready(function (){
                    console.log("loaded...->..")

        $("#reg-fo rm").on("submit", function(event){
<!--event.preventDefault();-->
        event.PreventDefault(); 
        let form=new FormData(this);
        
        
        $("#submit-btn").hide();
        $("#loader").show();
        
        
        //send data to register servlet
        
        $.ajax({
                    url:"UserServlet",
                    type:'Post',
                    data:form,
                    success: function (data, textStatus, jqXHR) {
                    $("#submit-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done') {
                    swal("Registered successsfully! redirecting to login page ")
                            .then((value) => {
                            window.location = "login.jsp";
                        });
                        }else{
                                    swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                                    $("#submit-btn").show();
                                    $("#loader").hide();
                                    swal("something went wrong!.. ")
                       
                    },
                    processData: false,
                    contentType: false
                  });
                  
                });
            });   
        </script>
    </body>
</html>
