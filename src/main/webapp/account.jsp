<%-- 
    Document   : account
    Created on : Dec 28, 2023, 6:00:32 PM
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
        <div id="wrapper">
            <div id="header">
                <div class="container d-flex justify-content-between align-items-center">
                    <button id="switch-mode">
                        <i class="bi bi-moon-stars-fill"></i>
                    </button>
                    <div>
                        <a href="/LoginController" style="color: #393f81;text-decoration: none;">Home</a>
                    </div>
                </div>
            </div>


            <h1 class="alert-dark-white font-weight-bold">vuminhuyen vuminhuyen vuminhuyen vuminhuyen</h1>

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
