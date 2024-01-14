<%-- 
    Document   : aboutus
    Created on : Nov 5, 2023, 9:10:43 AM
    Author     : Admin
--%>

<%@page import="Models.blogPost"%>
<%@page import="Models.blog"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.PostDAO"%>
<%@page import="DAO.BlogDAO"%>
<%@page import="Models.account"%>
<%@page import="Models.Account"%>
<%@page import="DAO.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <!--    mk admin : admin
                    123@123a-->


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="/resource/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="/resource/css/tiny-slider.css" rel="stylesheet">
        <link href="/resource/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="/resource/css/mystyle.css">
        <title>JSP Page</title>
        <style>
            .social-link {
                width: 30px;
                height: 30px;
                border: 1px solid #ff0000;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #666;
                border-radius: 50%;
                transition: all 0.3s;
                font-size: 0.9rem;
            }

            .social-link:hover,
            .social-link:focus {
                background: #ffffff;
                text-decoration: none;
                color: #ff0000;
            }

            .demuc {
                text-shadow: 2px 2px #199bffbd;
                font-size: 40px;
                font-family: Arial, Helvetica, sans-serif;
                font-style: italic;
            }

            .h2chu {
                font-size: 40px;
                text-shadow:1px 5px #fff900;
                font-family: Arial, Helvetica, sans-serif;
                font-style: italic;
                font-style: oblique;
                font-weight: bold;
            }


            .beautiful-button:hover {
                background-color: rgb(255, 255, 255);
            }


            .beautiful-button {
                background-color: #015a4b;
                border: none;
                color: rgb(255, 255, 255);
                padding: 5px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                border-radius: 12px;
                position: fixed;
                bottom: 15px;
                right: 15px;
            }
        </style>
    </head>
    <body>

        <header>
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" href="#page-top">TUV Blog</a>
                    <div id="header">
                        <div class="container d-flex justify-content-between align-items-center">
                            <button id="switch-mode">
                                <i class="bi bi-moon-stars-fill"></i>
                            </button>

                        </div>
                    </div>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto my-2 my-lg-0">
                            <li class="nav-item"><a class="nav-link" href="#page-top">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="/AccountController/login">Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- head page -->
        <%
            String idNews = (String) session.getAttribute("idBlogPost");
            PostDAO ndao = new PostDAO();
            blogPost news = ndao.getBlogPost(idNews);
        %>
        <div class="bg-light">
            <div class="container py-5">
                <div class="row h-100 align-items-center py-5">
                    <div class="col-lg-6">
                        <h1 class="h2chu display-4" style="font-size: 50px;"><%= news.getNameBlogPost()%></h1>
                        <p class="lead text-muted mb-0"><%= news.getContent1Post()%></p>
                    </div>
                    <div class="col-lg-6 d-lg-block">
                        <img src="/resource/<%= news.getImg1Post()%>"
                             style="border-radius: 50%;" alt="" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-white py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-5 px-5 mx-auto">
                        <img src="/resource/<%= news.getImg2Post()%>"
                             alt="" class="img-fluid mb-4 mb-lg-0" style="border-radius: 50%;">
                    </div>
                    <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
                        <!--<h2 class="h2chu font-weight-light">Lịch sử hình thành</h2>-->
                        <p class="font-italic text-muted mb-4"><%= news.getContent2Post()%></p>
                    </div>
                </div>

            </div>
        </div>


        <!--src="https://th.bing.com/th/id/R.ca8d96482d19210062cdfd9b0b5edbc0?rik=6oADuy1N%2fMXhTw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-yqFZYwQ3y7g%2fUUQ3PSvHZWI%2fAAAAAAAAEdU%2fjBm22IsslTM%2fs1600%2fdoremon%2bdoraemon%2bwallpaper.jpg&ehk=4jdnV%2b%2fZNrrr1gbqfUGM4Pv9CRS%2fdJkO40aBKUkKMqo%3d&risl=&pid=ImgRaw&r=0"-->


        <div class="bg-white py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-5 px-5 mx-auto">
                        <img src="/resource/<%= news.getImg3Post() %>"
                             alt="" class="img-fluid mb-4 mb-lg-0" style="border-radius: 50%;">
                    </div>
                    <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
                        <!--<h2 class="h2chu font-weight-light">Lời Cảm ơn</h2>-->
                        <p class="font-italic text-muted mb-4"><%= news.getContent3Post()%></p>
                    </div>
                </div>
            </div>   
        </div>






        <a href="#" class="beautiful-button" style="  text-decoration: none; ">&uarr;</a>
        <!-- js -->
        <script src="/resource/js/bootstrap.bundle.min.js"></script>
        <script src="/resource/js/tiny-slider.js"></script>
    </body>
</html>
