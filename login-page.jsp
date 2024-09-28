<%-- 
    Document   : login-page
    Created on : 2 Nov, 2023, 10:22:24 PM
    Author     : kavit
--%>
<%@page import="com.self.care.entities.Message"%>
<%@page import="com.self.care.entities.Database"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>


        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <!--    style="background-image: url(images/manu-schwendener-zFEY4DP4h6c-unsplash.jpg);background-size:cover;background-attachment:fixed;"-->
    <body style="background-color:#F6F5F2">
        <!--        <div class="container-fluid p-0 m-0">
                    <nav class="navbar navbar-expand-lg navbar-light primary-background p1">
                        <a class="navbar-brand text-light" href="#"><span class="fa fa-snowflake-o "></span> BLisS yOuRselF</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
        
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link text-light" href="index.jsp"><span class="fa fa-home"></span> Self-Care</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-light" href=""data-toggle="modal" data-target="#exampleModal2"><span class="fa fa-user"></span> Login</a>
                                </li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <span class="fa fa-leaf"></span>
                                                    Self-Care
                                                </a>
                                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#"><span class="fa fa-magic"></span> Skin-Care</a>
                                                    <a class="dropdown-item" href="#"><span class="fa fa-heart"></span> HairCare</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#"><span class="fa fa-cutlery"></span> Health-Care</a>
                                                </div>
                                            </li>
                                <li class="nav-item">
                                    <a class="nav-link text-light" href="about.jsp"><span class="fa fa-info-circle"></span> About</a>
                                </li>
                            </ul>
                            <form class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn  my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </div>
                    </nav>
                </div>-->
        <br>
        <main>
            <div class="container"  style="align-items:center; margin-top: 7%;  width:95%; height:80%;">
                <div class="row">
                    <div class="col-md-4 offset-md-3">
                        <div class="card " style="width:30rem; height:25rem;margin:30px auto; margin-left: 18%;  background-color: #FFF5E0; box-shadow: 3px 3px 2px 2px #A79277;">  
                            <div class="card-header" style="background-color:#EADBC8">
                                <h2 class="text-center font-weight-bold">Login Here</h2>
                            </div>
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class=" alert<%=m.getCssClass()%> text-center" role="alert">
                                <%=m.getContent()%>
                            </div>

                            <%
                                    session.removeAttribute("msg");
                                }
                            %>
                            <div class="card-body">
                                <form action="LoginServlet" method="POST" id="log-form">
                                    <div class="form-group">
                                        <label for="exampleInputText1" style="color:#153448; font-size: 20px;">User Name</label>
                                        <input name="name1" required type="text" class="form-control" id="exampleInputText1"  style="background-color: #FEFCF3;"  placeholder="Enter username">
                                        <small id="emailHelp" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" style="color:#153448; font-size: 20px;">Password</label>
                                        <input name="password1" required type="password" class="form-control" id="exampleInputPassword"  style="background-color: #FEFCF3;"  placeholder="Password">
                                    </div >
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label>
                                    </div>
                                    <br>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn" style="margin-top:10px; background-color: #D1BB9E; ">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="container p1">
            <h5 class="display-5 text-center"  style="font-size: 35px; margin-top: 20px;"><i class="fa fa-leaf" aria-hidden="true"></i>GlowGateway</h5>

        </div>


        <!--bootstrap javascipt-->
        <!--            <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <script src="JS/myjs.js" type="text/javascript"></script>-->

    </body>
</html>