<%-- 
    Document   : index
    Created on : Dec 21, 2023, 4:06:02 PM
    Author     : DELL
--%>

<%@page import="DAO.PostDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.BlogDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trang Home khách</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resource/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resource/css/styles.css" rel="stylesheet" />
        <link href="resource/css/styles.css"/>


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



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
                        <li class="nav-item"><a class="nav-link" href="#page-top">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/AccountController/login">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <!--        <header class="masthead">
                    <div class="container px-4 px-lg-5 h-100">
                        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                            <div class="col-lg-8 align-self-end">
                                <h1 class="text-white font-weight-bold">vuminhuyen vuminhuyen vuminhuyen vuminhuyen</h1>
                                <hr class="divider" />
                            </div>
                            <div class="col-lg-8 align-self-baseline">
                                <p class="text-white-75 mb-5">vuminhuyenvuminhuyenvuminhuyenvuminhuyenvuminhuyenvuminhuy /AccountController/login /AccountController/login </p>
                                <a class="btn btn-primary btn-xl" href="/BlogController/writeBlog">Viết Blog</a>
                            </div>
                        </div>
                    </div>
                </header>-->
        <!-- About-->
        <!--        <section class="page-section bg-primary" id="about">
                    <div class="container px-4 px-lg-5">
                        <div class="row gx-4 gx-lg-5 justify-content-center">
                            <div class="col-lg-8 text-center">
                                <h2 class="text-white mt-0">We've got what you need!</h2>
                                <hr class="divider divider-light" />
                                <p class="text-white-75 mb-4">Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!</p>
                                <a class="btn btn-light btn-xl" href="#services">Get Started!</a>
                            </div>
                        </div>
                    </div>
                </section>-->
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">Services</h2>
                <!--<hr class="divider" />-->
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                            <a  class="h4 mb-2" href="/AccountController/basicCode" style="text-decoration: none;cursor: all-scroll">Basic Code</a>
                            <p class="text-muted mb-0">Các bài code cơ bản về các thuật toán sắp xếp</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">Up to Date</h3>
                            <p class="text-muted mb-0">All dependencies are kept current to keep things fresh.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">Ready to Publish</h3>
                            <p class="text-muted mb-0">You can use this design as is, or you can make changes!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">Made with Love</h3>
                            <p class="text-muted mb-0">Is it really open source if it's not made with love?</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Portfolio-->
        <!--        <div id="portfolio">
                    <div class="container-fluid p-0">
                        <div class="row g-0">
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                                    <div class="portfolio-box-caption">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                                    <div class="portfolio-box-caption">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                                    <div class="portfolio-box-caption">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                                    <div class="portfolio-box-caption">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                                    <div class="portfolio-box-caption">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <a class="portfolio-box" href="assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                                    <div class="portfolio-box-caption p-3">
                                        <div class="project-category text-white-50">Category</div>
                                        <div class="project-name">Project Name</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- Call to action-->
        <!--        <section class="page-section bg-dark text-white">
                    <div class="container px-4 px-lg-5 text-center">
                        <h2 class="mb-4">Free Download at Start Bootstrap!</h2>
                        <a class="btn btn-light btn-xl" href="https://startbootstrap.com/theme/creative/">Download Now!</a>
                    </div>
                </section>-->

        <!-- Contact-->
        <%
            PostDAO ndao = new PostDAO();
            ResultSet setTopBlogPost = ndao.getTopBlogPost();
            if (setTopBlogPost != null) {
        %>
        <div class="blog-section">
            <div class="container">
                <div class="container px-4 px-lg-5">
                    <h2 class="text-center mt-0">Blog</h2>
                    <div class="row mb-5">

                        <div class="col-md-12">
                            <h2 class="section-title" style="border-bottom: 3px solid #f9bf29; text-shadow: 2px 2px 2px #3d5b50;"></h2>
                        </div>
                    </div>

                    <div class="row">
                        <%
                            while (setTopBlogPost.next()) {
                        %>
                        <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                            <div class="post-entry">
                                <a href="/BlogController/detail/<%= setTopBlogPost.getString("idBlogPost")%>"  class="post-thumbnail"><img style="width: 350px; height: 250px" src="/resource/<%= setTopBlogPost.getString("img1Post")%>"  alt="Image" class="img-fluid"  onclick="$('#myModal').modal('show'); return false;"></a>
                                <div class="post-content-entry">
                                    <h3><a href="" onclick="$('#myModal').modal('show'); return false;"><%= setTopBlogPost.getString("nameBlogPost")%></a></h3>
                                    <div class="meta">
                                        <span>by <a href="/BlogController/detail/<%= setTopBlogPost.getString("idBlogPost")%>" onclick="$('#myModal').modal('show'); return false;">
                                                <%= setTopBlogPost.getString("nameAuthorPost")%>
                                            </a></span> <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
            <%            }
            %>



            <section class="page-section" id="contact">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6 text-center">
                            <h2 class="mt-0">Chia sẻ đánh giá của bạn</h2>
                            <hr class="divider" />
                            <p class="text-muted mb-5">Bạn có hài lòng với các tính năng của trang web không ? Vui lòng cho ý kiến của bạn.</p>
                        </div>
                    </div>
                    <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                        <div class="col-lg-6">
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- * * SB Forms Contact Form * *-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- This form is pre-integrated with SB Forms.-->
                            <!-- To make this form functional, sign up at-->
                            <!-- https://startbootstrap.com/solution/contact-forms-->
                            <!-- to get an API token!-->
                            <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                <!-- Name input-->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="name" type="text" placeholder="Enter your name..." required="" />
                                    <label for="name">Họ tên</label>
                                    <!--<div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>-->
                                </div>
                                <!-- Email address input-->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="email" type="email" placeholder="name@example.com" required="" />
                                    <label for="email">Email</label>
                                    <!--                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                                                    <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>-->
                                </div>
                                <!-- Phone number input-->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890"  required="" />
                                    <label for="phone">SÐT</label>
                                    <!--<div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>-->
                                </div>
                                <!-- Message input-->
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                    <label for="message">Ý kiến</label>
                                    <!--<div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>-->
                                </div>
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                                <!--                            <div class="d-none" id="submitSuccessMessage">
                                                                <div class="text-center mb-3">
                                                                    <div class="fw-bolder">Form submission successful!</div>
                                                                    To activate this form, sign up at
                                                                    <br />
                                                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                                                </div>
                                                            </div>-->
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                                <!--<div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>-->
                                <!-- Submit Button-->
                                <!--<button class="btn btn-primary btn-xl disabled" id="submitButton" type="submit">Submit</button>-->
                                <button class="btn btn-dark tn-primary btn-xl btn-lg btn-block"
                                        type="submit" onclick="$('#myModal').modal('show'); return false;">Gửi phản hồi</button>
                            </form>
                        </div>
                    </div>
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-lg-4 text-center mb-5 mb-lg-0">
                            <i class="bi-phone fs-2 mb-3 text-muted"></i>
                            <div>0 7 8 9 . 6 1 . 6 5 . 7 3</div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close">-->
                            <!--<span aria-hidden="true">&times;</span>-->
                            </button>
                        </div>
                        <div class="modal-body">
                            Vui lòng đăng nhập để thực hiện nhé!
                        </div>
                        <div class="modal-footer">
                            <a href="/AccountController/login">Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Footer-->
            <footer class="bg-light py-5" style="background: #ffcccc;"  id="contact">
                <div class="container px-4 px-lg-5" ><div class="small text-center text-muted" >Copyright &copy; 2023 - Minh Uyen Vu</div></div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- SimpleLightbox plugin JS-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
            <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
            <!-- * *                               SB Forms JS                               * *-->
            <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
            <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
            <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
