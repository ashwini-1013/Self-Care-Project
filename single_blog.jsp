<%-- 
    Document   : single_blog
    Created on : 10 Apr, 2024, 6:22:13 PM
    Author     : kavit
--%>

<%@page import="com.self.care.entities.LikeData"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.self.care.entities.Category"%>
<%@page import="com.self.care.entities.PostData"%>
<%@page import="com.self.care.entities.Database"%>
<%@page import="java.util.List"%>
<%@page import="com.self.care.entities.Posts"%>
<%@page import="com.self.care.entities.Message"%>
<%@page import="java.sql.*" %>
<%@page import="com.self.care.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }
%>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostData pd = new PostData(Database.getConnection());

    Posts p = pd.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <!--                <link href="CSS/.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%> ~ BLISS</title>
        
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" type="text/javascript" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="bgXLKJYI"></script>
</head>
<body style="background-color:#F2F2F2;background:url('pics/<%=p.getpPic()%>');background-size:cover;width:100%;height:90%;background-attachment:fixed;">

    <div id="nav-profile" class="container-fluid p-0 m-0" style="background-color:transparent;">
        <nav class="navbar navbar-expand-lg navbar-light primary-background p1">
            <a class="navbar-brand" style="color:white;" href="#"><span class="fa fa-snowflake-o "></span> BLisS yOuRselF</a>
            <button class="navbar-toggler" style="background-color:white;" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div  class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <!--                        <li class="nav-item active">
                                                <a class="nav-link text-light" href="index.jsp"><span class="fa fa-home"></span> Self-Care</a>
                                            </li>-->
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="profile.jsp"><span class="fa fa-edit"></span> Blogs</a>
                    </li>

                    <!--                        <li class="nav-item">
                                                <a class="nav-link text-light" href="about.jsp"><span class="fa fa-info-circle"></span> About</a>
                                            </li>-->
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="#!" data-toggle="modal" data-target="#profile-modal"><img src="pics/<%= user.getProfile()%>" style="width:25px; height:25px; border-radius:50%;"> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="LogoutServlet"><span class="fa fa-user-o"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card" style="padding:10px;text-align:center;border:none;background-color:#FFFFFF;">
                    <div class="card-header" style="margin-top:-15px;margin-left:-18px;margin-right:-18px;border-bottom:1px solid grey;background-color:#FFFFFF;border-radius:4px;">
                        <h1 style="font-weight:200;font-family:Georgia;color:#013554;margin-bottom:5px;align-items:center;"><%=p.getpTitle()%></h1>
                    </div>
                    <div class="card-body" style="width:100%;">

                        <image style="width:100%;background-size:cover;height:580px;margin-top:-5px;border-radius:15px;" src="pics/<%=p.getpPic()%>" />

                        <div class="row my-3" style="padding-top:10px;border:1px solid transparent;background-color:#013554;border-radius:50px;height:80px;align-items:center;color:#FFFFFF;box-shadow:1px 1px 1px 1px grey;" >
                            <div class="col-md-8" style="text-align:left;">
                                <% Database db = new Database(Database.getConnection());%>

                                <p style="font-size:16px;font-weight:100;font-family:monospace;"><a href="#!" style="font-size:17px;color:#FFFFFF;"> <%= db.getUserByUserId(p.getUserid()).getName()%> </a>has posted on :</p>
                            </div>

                            <div class="col-md-4" style="text-align:right;align-items:center;">
                                <p style="font-style:italic;font-family:monospace;font-weight:bold;font-size:15px;"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                            </div>
                        </div>

                        <p  style="font-weight:100;font-size:25px;margin-top:5px;margin-bottom:20px;text-align:center;color:#142E54;text-align:justify;"><%=p.getpContent()%></p>
                    </div>
                    <div class="card-footer" style="background-color:#013554;border-radius:10px;">

                        <%
                            LikeData ld = new LikeData(Database.getConnection());
                        %>


                        <a style="margin-left:4px;width:80px;height:30px;color:#FFFFFF;" href="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class="btn btn-outline btn-sm"><i>&#x2661</i> <span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                        <a style="margin-left:4px;width:80px;height:30px;color:#FFFFFF;" href="#!" class="btn btn-outline btn-sm" id="comment-btn"><i class="fa fa-commenting-o"></i> <span>0</span></a>
                        <a style="margin-left:4px;width:80px;height:30px;color:#FFFFFF;" href="#!" class="btn btn-outline btn-sm"><i class="fa fa-send-o"></i> <span>0</span></a>

                    </div>

                    <div class="card-footer" id="comment-div" style="border:1px solid grey;margin-top:10px;height:100px;display:none;">
                       <div class="fb-comments" data-href="http://localhost:8080/TRYBLISS/single_blog.jsp?post_id=<%=p.getPid()%>,<%=user.getId()%>" data-width="100%" data-numposts="5"></div> 
                    </div>
                    <!--                    <div class="card-footer">
                                            <div class="fb-comments" data-href="http://localhost:8080/TRYBLISS/single_blog.jsp?post_id=3" data-width="100px" data-numposts="5"></div>
                                        </div>-->
                    
                    
                </div>
            </div> 
        </div>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0./dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="https://connect.facebook.net/fr_FR/sdk.js#xfbml=1"></script>
<script src="JS/myjs.js" type="text/javascript"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
                            $(document).ready(function () {
                                let addCommentBox = false;

                                $('#comment-btn').click(function () {
                                    if (addCommentBox === false) {
                                        $('#comment-div').show();


                                        addStatus = true;
                                        

                                    } else {

                                        $('#comment-div').hide();

                                        editStatus = false;
                                        
                                    }
                                });
                            });
</script>

</html>



<%--
 <h1>Post id: <%=postId%></h1>
        <h2><%=p.getpTitle()%></h2>
        <image style="width:200px;height:200px;" src="pics/<%=p.getpPic()%>" />
        <h3><%=p.getpContent()%></h3>
        <p><%=p.getpDate()%></p>
--%>