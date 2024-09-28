<%-- 
    Document   : loadpost
    Created on : 27 Nov, 2023, 12:36:37 PM
    Author     : kavit
--%>

<%@page import="com.self.care.entities.LikeData"%>
<%@page import="java.util.List"%>
<%@page import="com.self.care.entities.Category"%>
<%@page import="com.self.care.entities.Posts"%>
<%@page import="com.self.care.entities.User"%>
<%@page import="com.self.care.entities.PostData"%>
<%@page import="com.self.care.entities.Database"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }
%>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
<link href="CSS/profile.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="row" style="margin-top:10px;">
    <%
        PostData pd = new PostData(Database.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Posts> posts = null;
        if (cid == 0) {
            posts = pd.getAllPosts();
        } else {
            posts = pd.getPostsByCatid(cid);
        }
        for (Posts p : posts) {

    %>
    <div class="col-md-4 mt-2" style="" >
        <div class="grid-item1" style="text-align:center;border:1px solid transparent;width:270px;height:400px;background-color:#fff;">
            <img id="blog-img1" style="width:100%;height:300px;padding:2px;" src="pics/<%=p.getpPic()%>">
            <b><a href="single_blog.jsp?post_id=<%=p.getPid()%>" id="blog-title1" style="text-align:center;font-size:18px;color:black;font-family:serif;"><%=p.getpTitle()%></a></b>

            <div class="blog-footer" style="margin-top:12px;text-align:center;padding-right:5px;">

                <%
                    LikeData ld = new LikeData(Database.getConnection());
                %>

                <a style="margin-left:4px;" href="#!"  onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>);disLike(<%=p.getPid()%>, <%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i>&#x2661</i> <span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                <a style="margin-left:4px;" href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i> <span>0</span></a>
                <a style="margin-left:4px;" href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-send-o"></i> <span>0</span></a>

            </div>
        </div>


    </div>



    <%
        }
    %>


</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="JS/myjs.js" type="text/javascript"></script>


<%-- <p style="text-align:left;margin-left:3px;font-size:17px;"><%=p.getpContent()%></p>--%>