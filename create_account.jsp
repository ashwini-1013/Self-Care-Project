

<%@page import="com.self.care.entities.Database"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="DEFAULT"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <!--        X-Content-Type-Options:"no-sniff"-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>


        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <!--    style="background-image: url(images/manu-schwendener-zFEY4DP4h6c-unsplash.jpg);background-size:cover;background-attachment:fixed;"-->
    <body style="background-color:#F6F5F2">

        <br>
        <main>
            <div class="container-fluid" style="align-items:center; margin-top: 7%;  width:95%; height:80%;">
                <div class="row">
                    <div class="col-md-6 offset-md-3" style="justify-content:center;">
                        <div class="card" style=" width:100%; background-color: #FFF5E0; box-shadow: 3px 3px 2px 2px #A79277;">
                            <div class="card-header" style="background-color:#EADBC8" >
                                <h2 class="text-center font-weight-bold">Sign in !</h2>
                            </div>
                            <div class="card-body" >
                                <form id="reg-form" action="SignUpServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputText1" style="color:#153448; font-size: 20px;">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="exampleInputText1" style="background-color: #FEFCF3;"  placeholder="Enter Name">
                                    </div>
                                    
                                    <div class="form-group" >
                                        <label for="exampleInputTel1" style="color:#153448; font-size: 20px;">Contact</label>
                                        <input name="user_contact" type="contact" class="form-control" id="exampleInputTel1" style="background-color: #FEFCF3;" placeholder="Enter Contact" style="width:60%;">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" style="color:#153448; font-size: 20px;">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" style="background-color: #FEFCF3;" placeholder="Enter Password">
                                    </div>
                                    <div class="form-check">
                                        <input name="check1" type="checkbox" class="form-check-input" id="exampleCheck1" value="on">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label>
                                    </div>



                                    <button id="submitBtn" type="submit" class="btn btn" style="margin-top:10px; background-color: #D1BB9E; " >Submit</button>  

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
        <!--                                        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                                                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
<!--        <script src="JS/myjs.js" type="text/javascript"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>-->

        <script>
            $(document).ready(function () {
                console.log("loaded...");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    console.log(form);

                    //send on registerservlet:-
                    $.ajax({
                        url: "SignUpServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script> 


    </body>
</html>