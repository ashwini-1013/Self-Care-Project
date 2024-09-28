<%-- 
    Document   : normal_navbar
    Created on : 1 Nov, 2023, 7:57:57 PM
    Author     : kavit
--%>

<%@page import="com.self.care.entities.Message"%>
<%@page import="com.self.care.entities.Database"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container-fuild p-0 m-0">
    <nav class="navbar navbar-expand-lg navbar-light primary-background p1">
        <a class="navbar-brand" href="#"><span class="fa fa-snowflake-o "></span> BLisS yOuRselF</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Self-Care</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="login-page.jsp"><span class="fa fa-user"></span> Login</a>
                </li>
                <!--            <li class="nav-item dropdown">
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
                            </li>-->
                <li class="nav-item active">
                    <a class="nav-link" href="about.jsp"><span class="fa fa-info-circle"></span> About</a>
                </li>
            </ul>
            <h1 class="headingB">BLISS</h1>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn  my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>


<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title p1" id="exampleModalLabel">Login Here</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <%
                    Message m = (Message) session.getAttribute("msg");
                    if (m != null) {
                %>
                <div class=" alert <%=m.getCssClass()%> text-center" role="alert">
                    <%=m.getContent()%>
                </div>

                <%
                        session.removeAttribute("msg");
                    }
                %>

                <form action="LoginServlet" method="POST" id="log-form">
                    <div class="form-group">
                        <label for="exampleInputText1">User Name</label>
                        <input name="name1" required type="text" class="form-control" id="exampleInputText1" placeholder="Enter username">
                        <!--                                        <small id="emailHelp" class="form-text text-muted"></small>-->
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input name="password1" required type="password" class="form-control" id="exampleInputPassword" placeholder="Password">
                    </div >
                    <!--                                    <div class="form-check">
                                                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                              <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label>
                                                            </div>-->
                    <br>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
