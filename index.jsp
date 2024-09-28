<%-- 
    Document   : index
    Created on : 1 Nov, 2023, 11:26:13 AM
    Author     : kavit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.self.care.entities.Message"%>
<%@page import="com.self.care.entities.Database"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Rubik+Scribble&display=swap" rel="stylesheet">
        <title>Bliss Yourself</title>
    </head>
    <body>
        <header class="header">
            <nav class="nav">
                <a href="#" class="nav_logo"><i class="fa fa-leaf" aria-hidden="true"></i>GlowGateway</a>
                <!--<div id="logo">
                     <img src="wo.jpg">
                </div> -->
                <ul class="nav_items">
                    <li class="nav_item">
                        <a href="#home" class="nav_link"> <i class="fas fa-house-user"></i> HOME</a>
                        <a href="#services-main" class="nav_link"><i class="fas fa-thumbs-up"></i>COMMUNITY</a>
                        <a href="#about-main" class="nav_link"><i class="far fa-lightbulb"></i>ABOUT</a>
                        <a href="#contact-main" class="nav_link"><i class="fas fa-phone"></i>CONTACT</a>
                    </li>  
                </ul>
                <a href="create_account.jsp"><button class="button"><span class="fas fa-user-alt"></span>Sign Up</button></a>
            </nav>
        </header>
    </body>

    <section id="home">
        <img src="images1/k7.jpeg" style="position: absolute;
             background:url(images/k7.jpg) no-repeat center center/cover;
             height: 90%;
             width: 100%;
             left: 0px;
             z-index: -1;">
        <h1 class="h-primary">Empower Your Self-Care Journey</h1>
        <p class="center">"Love Yourself Enough To Set Boundries
        </p>
        <p>Your Time And Energy Are Precious.”</p>
        <a href="login-page.jsp" class="btn"> Let's Go</a>

    </section>

    <section id="slider">
        <div class="container">
            <input type="radio" name="dot" id="one">
            <input type="radio" name="dot" id="two">
            <div class="main-card">
                <div class="cards">
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k19.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Physical Self-Care</div>
                                <div class="job"> Take Care Of Your Body  </div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k20.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Social Self-Care</div>
                                <div class="job">Take Time To Love Yourself</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k28.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Emotional Self-Care</div>
                                <div class="job">Nurture Your Inner Peace</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k22.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Personal Self-Care</div>
                                <div class="job">Prioritize Self-Love Daily</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k29.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Spiritual Self-Care</div>
                                <div class="job">Embrace Spiritual Harmony</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="images1/k24.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Professional Self-Care</div>
                                <div class="job">Managing Work Life Balance</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="button">
                <label for="one" class="one active"></label>
                <label for="two" class="two"></label>
            </div>

        </div>
    </section>

    <section class="services-container" id="services-main">
        <h1 class="h-primary center">Join Blog Community</h1>
        <div id="services">
            <div class="box">
                <img src="images1/k18.jpeg" alt="">
                <h2 class="h-secondary center">To Do List </h2>
                <p class="center" style="text-align: justify;">With a To Do List you can complete goals without wasting time trying to figure out priorities.Your productivity will increase,You wont forget things, your time management will improve and YOu will able to manage your task more effectively.</p>

            </div>

            <div class="box">
                <img src="images1/k30.jpeg" alt="">
                <h2 class="h-secondary center">Create & Post Blogs</h2>
                <p class="center"  style="text-align: justify;">Investing in ourselves is essential to managing stress, staying healthy, and living a balanced life.For example, you can share self-care benefits, tips on how to fit self-care into your daily life, favorite beauty products, and go-to healthy meals.</p>

            </div>

            <div class="box">
                <img src="images1/k31.jpeg" alt="">
                <h2 class="h-secondary center">Explore Blogs</h2>
                <p class="center"  style="text-align: justify;">Exploring blogs can be a fantastic way to discover new ideas and stay updated on topics you're passionate about.Keep an open mind and explore blogs outside your usual interests or comfort zone. You may discover new perspectivesby exploring diverse blogs</p>

            </div>
        </div>
    </section>

    <div style="margin-top:100px;" id="about-main"> <h1 class="h-primary center">About</h1></div>
    <section class="about" style="display: flex;flex-direction: row;margin-top:50px; ">

        <div id="about-content" style="margin-top:5%;" >
            <h8 style="text-align:justify;">
            <p style="text-align: justify;">GlowGateway typically focus on providing resources,</p>
            <p style="text-align: justify;">tips, and information to help individuals improve</p>
            <p style="text-align: justify;">their physical, mental, and emotional well-being.</p>
            <p style="text-align: justify;"> Self-care websites are dedicated to promoting and</p>
            <p style="text-align: justify;">supporting holistic well-being, encompassing physical,</p>
            <p style="text-align: justify;"> mental, emotional, and spiritual aspects of health.</p>
            <p style="text-align: justify;">These websites offer a range of resources, tools, </p>
            <p style="text-align: justify;">and information to help individuals practice </p>
            <p style="text-align: justify;">self-care and improve their overall quality of life.</p>
            </h8>
            <h2 style="font-weight: bold; margin-top: 20px; font-size: 20px;">Some common themes and topics you might find:</h2>
            <div class="boxes" >
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;"> mindfullness</button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Physical Wellness</button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Emotional Well-being</button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Wellness Tips</button>
            </div>
            <div class="box1">
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Mental Health</button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Self Discovery </button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Community</button>
                <button style="border:1px solid grey;padding:3px;font-weight:bold;background-color:transparent;border-radius:28px;">Professional Guidance </button>
            </div>
        </div>

        <div class="images" style="margin-top:5%;">
            <img src="images1/c2.jpeg" class="girl">

        </div>
    </section>


    <section class="contact-section" id="contact-main">
        <div class ="contact-bg">
            <h3>Get In Touch With Us</h3>
            <h2>Contact Us</h2>
            <div class="line">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <p class="text"></p>
        <div class="contact-body" style="padding-right:220px;">
            <div class="contact-info" style="margin-left: 120px;">
                <div>
                    <span><i class="fas fa-mobile-alt"></i></span>
                    <span>Phone No.</span>
                    <span class="text">1-2392-23928-2</span>

                </div>
                <div>
                    <span><i class="fas fa-map-marker-alt"></i></span>
                    <span>Address</span>
                    <span class="text">Glow Gateway, Dhule </span>

                </div>

                <div>
                    <span><i class="fas fa-envelope-open"></i></span>
                    <span>Email</span>
                    <span class="text">mail@company.com</span>

                </div>
<!--                <div>
                    <span><i class="fas fa-map-marker-alt"></i></span>
                    <span>Address</span>
                    <span class="text">Indira garden ,pramod nagar, Dhule-424001</span>

                </div> -->




            </div>
        </div>
    </div>
</section>

<script src="JS/index.js"></script>
</body>
</html>





