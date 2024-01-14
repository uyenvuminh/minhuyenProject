<%-- 
    Document   : register
    Created on : Dec 21, 2023, 4:38:14 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css");
            body{
                margin: 0;
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }

            .container{
                max-width: 960px;
                margin: 0 auto;
            }
            .d-flex{
                display: flex;
            }
            .justify-content-between{
                justify-content: space-between;
            }
            .align-items-center{
                align-items: center;
            }

            #header{
                background: #f5f5f5;
                padding: 15px 0px;
            }
            #header #logo{
                color: #333;
                text-decoration: none;
                font-size: 21px;
                font-weight: 600;
            }
            #header #switch-mode{
                outline: none;
                border: none;
                background: none;
                cursor: pointer;
            }
            #header #switch-mode i{
                font-size: 21px;
            }


            #content h1{
                text-align: center;
                font-size: 45px;
            }

            /* // Css Dark mode */
            body.dark{
                background: #000;
                color: #fff;
            }

            body.dark #header{
                background: #3f3e3e;
            }
            body.dark #header #logo{
                color: #fff;
            }
            body.dark #header #switch-mode{
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div class="container d-flex justify-content-between align-items-center">
                    <button id="switch-mode">
                        <i class="bi bi-moon-stars-fill"></i>
                    </button>
                    <div>
                        <a href="/"style="color: #393f81;text-decoration: none;">Home</a>
                    </div>
                </div>
            </div>
            <section class="vh-100" ">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col col-xl-13">
                            <div class="card" style="border-radius: 2rem;">
                                <div class="row g-6">
                                    <%
                                        ResultSet rs = (ResultSet) request.getAttribute("arrUser");
                                        System.out.println(rs);
                                        if (rs != null) {
                                            while (rs.next()) {
                                                System.out.println(rs.getString("username"));
                                    %>
                                    <input type="hidden" class="elementAccount" value="<%= rs.getString("username")%>">
                                    <%
                                            }
                                        }
                                    %>
                                    <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                        <div class="card-body p-4 p-lg-5 text-black">
                                            <!--<form id="formRegister" method="post" action="/AccountsController"class="w-100" style="margin-top: 100px; margin-bottom: 100px;">-->
                                            <form method="post" action="AccountController"  enctype="multipart/form-data" >
                                                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Create an Admin account</h5>
                                                <div class="form-outline mb-4">
                                                    <input type="text" id="form2Example17" class="form-control form-control-lg" placeholder="Enter username" required="" name="usernameAd"/>
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <input type="password" id="form2Example27" class="form-control form-control-lg" placeholder="Enter password" required="" name="passwordAd"/>
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <input type="email" id="form2Example17" class="form-control form-control-lg" placeholder="Enter emailAd" required="" name="emailAd"/>
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <input type="hidden" id="form2Example27" class="form-control form-control-lg" placeholder="Enter avatarAd" value="resource/imag/logo.png" name="avatarAd"/>
                                                </div>
                                                <!--                                                    <div class="form-outline mb-4">
                                                                                                        <input type="password" id="form2Example27" class="form-control form-control-lg" placeholder="Enter password again" required="" />
                                                                                                    </div>-->
                                                <div class="input-control">
                                                    <input type="hidden" id="text" class="form-control form-control-lg" name="avatar" value="resource/imag/logo.png"/>
                                                </div>
                                                <div class="pt-1 mb-4" id="login">
                                                    <button class="btn btn-dark btn-lg btn-block" type="submit" name="registerAdmin" >Register</button>
                                                </div>
                                                <p class="mb-5 pb-lg-2" style="color: #393f81;">You have an account? <a href="/AccountController/loginAdmin"
                                                                                                                        style="color: #393f81;"> Login here</a></p>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-5 d-none d-md-block">
                                        <img src="/resource/imag/uyenuyeneuyen.jpg" alt="login form" class="img-fluid"
                                             style="border-radius: 0 1rem 1rem 0;height:530px;width: 400px;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--//TẠO NÚT SÁNG TỐI-->
            <script>
                const body = document.body;
                const switch_mode = document.querySelector('#switch-mode i');
                // Load mode 
                let mode = localStorage.getItem('darkmode');
                if (mode == 'true') {
                    body.classList.add('dark');
                    switch_mode.className = "bi bi-brightness-high-fill";
                }

                switch_mode.addEventListener('click', () => {
                    switch_mode.classList.toggle('bi-moon-stars-fill');
                    switch_mode.classList.toggle('bi-brightness-high-fill');
                    let mode = body.classList.toggle('dark');
                    // save mode 
                    localStorage.setItem('darkmode', mode);
                });
            </script>
    </body>
</html>
