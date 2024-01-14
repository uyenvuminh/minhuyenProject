<%-- 
    Document   : login
    Created on : Dec 22, 2023, 12:10:02 AM
    Author     : DELL
--%>

<%@page import="DAO.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <style>
            @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css");

            body {
                margin: 0;
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }

            .container {
                max-width: 960px;
                margin: 0 auto;
            }

            .d-flex {
                display: flex;
            }

            .justify-content-between {
                justify-content: space-between;
            }

            .align-items-center {
                align-items: center;
            }

            #header {
                background: #f5f5f5;
                padding: 15px 0px;
            }

            #header #logo {
                color: #333;
                text-decoration: none;
                font-size: 21px;
                font-weight: 600;
            }

            #header #switch-mode {
                outline: none;
                border: none;
                background: none;
                cursor: pointer;
            }

            #header #switch-mode i {
                font-size: 21px;
            }


            #content h1 {
                text-align: center;
                font-size: 45px;
            }

            /* // Css Dark mode */
            body.dark {
                background: #000;
                color: #fff;
            }

            body.dark #header {
                background: #3f3e3e;
            }

            body.dark #header #logo {
                color: #fff;
            }

            body.dark #header #switch-mode {
                color: #fff;
            }
        </style>
    </head>

    <body>
        <!--<a href="/CustomerController">Click here to show</a>-->

        <div id="wrapper">
           <div id="header">
                <div class="container d-flex justify-content-between align-items-center">
                    <button id="switch-mode">
                        <i class="bi bi-moon-stars-fill"></i>
                    </button>
                    <div>
                        <a href="/" style="color: #393f81;text-decoration: none;">Home</a>
                        <a href="/AccountController/login"style="color: #cccccc;text-decoration: none;padding-left:100px">Member</a>
                    </div>
                </div>
            </div>
            <div id="content" class="container">
                <section class="vh-100">
                    <div class=" container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-80">
                            <div class="col col-xl-13">
                                <div class="card" style="border-radius: 2rem;">
                                    <div class="row g-6">
                                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                                            <img src="/resource/imag/uyenuyeneuyen.jpg" alt="login form" class="img-fluid"
                                                 style="border-radius: 1rem 0 0 1rem;height:530px;width: 400px;" />
                                        </div>
                                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                            <div class="card-body p-4 p-lg-5 text-black">
                                                <div class="d-flex align-items-center mb-3 pb-1">
                                                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                                    <span class="h1 fw-bold mb-0">TUV Blog</span>
                                                </div>
                                                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">
                                                    Admin Login</h5>
                                                <form method="post" action="AdminController">
                                                    <div class="form-outline mb-4">
                                                        <input type="text" id="form2Example17"
                                                               class="form-control form-control-lg"
                                                               placeholder="Enter username" required="" id="nameAdmin" name="nameAdmin" />
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        <input type="password" id="form2Example27"
                                                               class="form-control form-control-lg"
                                                               placeholder="Enter password" required="" id="passAdmin" name="passAdmin" />
                                                    </div>
                                                    <div class="pt-1 mb-4" id="login">
                                                        <button class="btn btn-dark btn-lg btn-block"
                                                                type="submit"id="loginAdmin" name="loginAdmin">Login</button>
                                                    </div>
                                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an
                                                        account? <a href="/AccountController/registerAdmin"
                                                                    style="color: #393f81;">Register here</a></p>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

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
