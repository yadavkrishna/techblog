<%-- 
    Document   : welcome
    Created on : 07-Mar-2020, 9:36:13 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!--css-->
        <link href="css/techBlogcss.css" rel="stylesheet" type="text/css"/>
        <%--fontawesome w3school--%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
        <title>Welcome</title>
         <style>
             .banner-background{
                 clip-path: polygon(0 0, 70% 0%, 100% 0, 100% 84%, 68% 90%, 29% 83%, 0 91%, 0% 30%);
             }
        </style>
    </head>
    <body>
          <%--navbar--%>
        <%@include file="navbar.jsp"%>
        <!--//banner-->
        <div class="container-fluid p-0 m-0 banner-background">
            <div class="jumbotron primary-background">
                <div class="container ">
                    
                <h3 class="display-3">Welcome to Tech Blog</h3>
                <p>Programmed learning is a research-based system which helps learners work successfully.</p>
                <a class="btn btn-primary btn-lg" href="profile.jsp" role="button"> <span class="fa fa-pencil-square-o"></span>Learn more</a>
                <a class="btn btn-primary btn-lg" href="login.jsp" role="button"> <span class="fa fa-user-circle-o fa-spin"></span> Login</a>
                </div>
            </div>
      </div>
        <!--mid section-->
        <!--cards-->
        <div class="container" >
          <!--  //row for cards-->  
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="showPost.jsp" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                
            </div>
            <br>
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"> <span class="fa fa-pencil-square-o"></span>Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">read more</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
     

        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
