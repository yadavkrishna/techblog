

<%@page import="com.techBlog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
             <!--css-->
        <link href="css/techBlogcss.css" rel="stylesheet" type="text/css"/>
        <%--fontawesome w3school--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <style>
             .banner-background{
                 clip-path: polygon(0 0, 70% 0%, 100% 0, 100% 84%, 68% 90%, 29% 83%, 0 91%, 0% 30%);
             }
        </style>
        
    </head>
    <body>
                  <%--navbar--%>
        <%@include file="navbar.jsp"%>
        
        <main class="d-flex align-items-center primary-background banner-background " style="height: 80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card p-1">
                            <div class="card-header primary-background text-white text-center">
                                
                                <h2><span class="fa fa-user plus fa-3x"></span> Login</h2>
                            </div>
                            
                            <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null){
                                    %>
                                    
                                    <div class="alert-<%=m.getType()%>" role="alert-<%=m.getCsstype() %>">
                                        <%=m.getContent() %>
                                    </div>
                                    
                                    <%
                                        session.removeAttribute("msg");
                                }
                            
                            %>
                            
                            <div class="card-body">
                               
                                <form id="login-form" action="LoginServlet" method="post">
                                    
                                    <div class="form-group">
                                       
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="umail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="upass" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                  
                                    <div class="container text-center">
                                        <button id="loginbtn" type="submit" class="btn btn-primary align-items-left">Login</button>
                                        <a href="register.jsp" id="loginbtn" type="submit" class="btn btn-primary align-items-right">Create new Account</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--Js-->
        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--sweet alert js-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
