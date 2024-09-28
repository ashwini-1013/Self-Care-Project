
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
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Profile</title>
        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/profile.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body style="background-color:whitesmoke;"> 


        <div id="nav-profile" style="background-color:whitesmoke;" class="container-fluid p-0 m-0">
            <nav class="navbar navbar-expand-lg navbar-light primary-background p1">
                <a class="navbar-brand" style="color:#5b3e31;font-weight:bold;margin-left:30px;padding-left:5px;" href="#"><span class="fa fa-snowflake-o "></span> BLisS yOuRselF</a>
                <button class="navbar-toggler" style="margin-right:10px;" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div  class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <!--                        <li class="nav-item active">
                                                    <a class="nav-link text-light" href="index.jsp"><span class="fa fa-home"></span> Self-Care</a>
                                                </li>-->
                        <li class="nav-item">
                            <a class="nav-link" style="color:#5b3e31;margin-left:40px;" href="#!" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-bolt"></span> Post</a>
                        </li>

                        <!--                        <li class="nav-item">
                                                    <a class="nav-link text-light" href="about.jsp"><span class="fa fa-info-circle"></span> About</a>
                                                </li>-->
                    </ul>
                    <ul class="navbar-nav mr-right" style="margin-right:35px;">
                        <li class="nav-item">
                            <a class="nav-link" style="color:#5b3e31;margin-left:40px;" href="#!" data-toggle="modal" data-target="#profile-modal"><img src="pics/<%= user.getProfile()%>" style="width:25px; height:25px; border-radius:50%;"> <%= user.getName()%></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" style="color:#5b3e31;margin-left:40px;" href="LogoutServlet"><span class="fa fa-user-o"></span> Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>


        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>
        <div class=" alert<%=msg.getCssClass()%> text-center" role="alert">
            <%=msg.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>

        <img src="images/blog_page.jpg" style="width:94%;box-shadow: 1px 1px 2px 2px burlywood;height:550px;margin-top:63px;border-radius:15px;margin-left:3%;border:1px solid transparent;" alt=""/>

        <div class="head-bar">
            <form class="search">
                <input id="search-field" type="search" placeholder="search" />
                <button id="search-btn" type="search"><b>Search</b></button>
            </form>
        </div>

        <!--main body of the page-->
        <main>
            <div class="row" id="profile-row">
                <!--first col>-->
                <div id="profile-col1">
                    <button class="navbar-toggler" style="background-color:transparent;border:none;margin-top:15px;"  type="button" data-toggle="collapse" data-target="#profile-category" aria-controls="profile-category" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="fa fa-bars" style="color:#7C6D62;"></span>
                    </button>

                    <div  class="collapse navbar-collapse" id="profile-category" style="margin-top:15px;">
                        <ul class="list-group navbar-nav mr-auto">
                            <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item active">All Posts</a>

                            <!--get all categories to display on profile page main-->
                            <%
                                PostData pd = new PostData(Database.getConnection());
                                ArrayList<Category> list1 = pd.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%=cc.getCid()%>, this)" class="c-link list-group-item"><%=cc.getCname()%></a>
                            <%
                                }
                            %>
                            <a href="#!" data-toggle="modal" data-target="#routine-modal" class="list-group-item">Create Your Self-care Routine</a>

                        </ul>
                    </div>
                </div>

                <!--second col-->
                <div class="col-md-8 grid-container">
                    <div class="container" id="loader">
                    </div>
                    <div class="container-fluid post-container">

                    </div>
                </div>

            </div>
        </main>
        <!--        end of main body-->



        <!--create your own self-care routine modal-->
        <div style="margin-top:40px;" class="modal fade" id="routine-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="background-color:#FAF7F0;border-radius:10px;border:2px solid #7C6D62;">
                    <div class="modal-header" style="background-color:#E2DAC9;border:1px solid #E8D0A3">
                        <h5 style="margin-left:auto;font-size:25px;font-family:fantasy monospace;" class="modal-title p1" id="exampleModalLabel">Create Your Own Routine</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="routine-buttons" style="display:flex;flex-direction: row;gap:8px;margin-left:10%;">
                            <button class="b11" style="
                                    height:50px;
                                    border-radius:15px;background-color:#E8DFCA;
                                    border:1px solid #D1BB9E;box-shadow:1px 1px 1px 1px grey;" >Add routine</button>
                            <button class="b12" style="
                                    height:50px;
                                    border-radius:15px;background-color:#E8DFCA;
                                    border:1px solid #D1BB9E;box-shadow:1px 1px 1px 1px grey;">Show My routine</button>
                            <button class="b13" style="
                                    height:50px;
                                    border-radius:15px;background-color:#E8DFCA;
                                    border:1px solid #D1BB9E;box-shadow:1px 1px 1px 1px grey;" >Delete routine</button>
                        </div>

                        <div class="add-routine" style="display:none;width:100%;margin-top:20px;">
                            <div style="display:flex;flex-direction: row;gap:3px;">
                                <form>
                                    <input id="routine-input" name="routineText" style="width:350px;border-radius:8px;height:35px;" placeholder="Set your To-Do"/>
                                </form>
                                <button type="submit" id="routine-add-btn" style="width:100px;height:35px;border-radius:3px;background-color:#D1BB9E;">Add</button>
                            </div>
                            <div id="routine-items-div" style="border:1px solid grey;margin-top:10px;display:none;">
                                <ul>
                                    <li id="routine-items"></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="show-routine" style="display:none;margin-top:20px;border:1px solid grey;">
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>






        <!--post modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title p1" id="exampleModalLabel">New Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="post-form" action="AddPostServlet" method="post" enctype=multipart/form-data>
                            <div class="form-group">  
                                <select class="form-control" name="cid">
                                    <option selected disabled>-- Select --</option>

                                    <%
                                        PostData postd = new PostData(Database.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getCname()%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </div>
                            <div class="form-group">
                                <input name="title1" type="text" placeholder="Enter post title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="content1" class="form-control" placeholder="Enter your content"></textarea>     
                            </div>
                            <div class="form-group">
                                <label>Upload Pic</label>
                                <br>
                                <input type="file" name="pic1">
                            </div>
                            <div class="text-center">
                                <button  type="submit" class="btn btn-light">POST</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--profile modal><!-- comment -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title " id="exampleModalLabel text-center">BLISS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img width="105px" height="100px" style="border-radius:50%"   src="pics/<%=user.getProfile()%>">
                            <h5 class="modal-title " id="exampleModalLabel text-center"><%=user.getName()%></h5>
                            <div class="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">About me : </th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Joined On : </th>
                                            <td style="font-weight:bold;font-style:italic;font-size:15px;"><%= DateFormat.getDateTimeInstance().format(user.getRdate())%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display:none;">

                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>About : </td>
                                            <td><textarea rows="3" name="user_about" class="form-control" placeholder="Enter about you">
                                                    <%=user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Name : </td>
                                            <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile: </td>
                                            <td>
                                                <input type="file" name="user_profile" class="form-control" value="<%= user.getProfile()%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--        <script src="JS/myjs.js" type="text/javascript"></script>-->

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function () {
                                        if (editStatus === false) {
                                            $('.profile-details').hide();

                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $('.profile-details').show();

                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }
                                    });
                                });
        </script>


        <script>
            function getPosts(catId, temp) {
//                $('#loader').show();
//                $('.post-container').hide();

                $(".c-link").removeClass('active');

                $.ajax({
                    url: "loadpost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $('.post-container').html(data);
                        $(temp).addClass('active');
                    }
                });
            }

            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);

            });
        </script>
        <script>
            $(document).ready(function (e) {
                $("#post-form").on("submit", function (event) {
                    //this code gets called when form is submitted:-
                    event.preventDefault();
                    console.log("you have clicked on post");
                    let form = new FormData(this);

                    //now requesting to server:-
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() !== 'done') {
                                swal("Hurray!!", "Blog Saved", "success");
                            } else {
                                swal("Error!", "sorry! something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "sorry! something went wrong1", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <script>

            const routineInput = document.getElementById('routine-input');
            const routineBtn = document.getElementById('routine-add-btn');
            const routineDiv = document.getElementById('routine-items-div');
            const routineItem = document.getElementById('routine-items');

            routineBtn.addEventListener("click", () => {
                if (routineInput.value) {
                    routineDiv.style.display = "block";
//                         routineArr+=routineInput.value;
//                         console.log(routineArr);
                }
                routineItem.innerText += routineInput.value + "\n";
            });

            $(document).ready(function () {
                let addStatus = false;

                $('.b11').click(function () {
                    if (addStatus === false) {
                        $('.add-routine').show();


                        addStatus = true;
                        $(this).text("Save Routine");

                    } else {

                        $('.add-routine').hide();

                        editStatus = false;
                        $(this).text("Add routine");
                    }
                });
                
                const showRoutine=document.getElementByClassName('show-routine');
                
                 $('.b12').click(function(){
                    if(addStatus===true){
                         $('.show-routine').show();
                         showRoutine.innerText=routineInput.value;
                       
                    }else{
                         $('.show-routine').hide();
                        
                    }
                });
            });
            
           


        </script>
    </body>
</html>
