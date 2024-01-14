
<%-- 
    Document   : basciCode
    Created on : Dec 22, 2023, 10:11:41 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="/resource/css/styles.css" rel="stylesheet" />
        <link href="resource/css/styles.css"/>
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
                /*background: #f5f5f5;*/
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
                /*background: #3f3e3e;*/
            }

            body.dark #header #logo {
                color: #fff;
            }

            body.dark #header #switch-mode {
                color: #fff;
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
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
                        <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/AccountController/login">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <h1>Happy. You done</h1>
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
