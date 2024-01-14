<%-- 
    Document   : createNews
    Created on : Nov 5, 2023, 3:27:56 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Models.account"%>
<%@page import="DAO.AccountDAO"%>
<%@page import="DAO.BlogDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="/resource/css/styleadmin.css">
        <link rel="stylesheet" href="/resource/css/newsManageStyle.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <title>Write Blog Page</title>
    </head>
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
    <%
        AccountDAO adao = new AccountDAO();
        ResultSet as = adao.getAll();

        Cookie[] cook = request.getCookies();
        int count = 0;
        String userCookie = null;
        for (int i = 0; i < cook.length; i++) {
            if (cook[i].getName().equals("cookieUS")) {
                userCookie = cook[i].getValue();
                count++;
                break;
            }
        }
        if (count == 0) {
            response.sendRedirect("/");
        } else {
            account oldAcc = adao.getAccount(userCookie);
    %>
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
        <div>
            <section id="content">
                <main>

                    <div class="head-title">
                        <div class="left">
                            <h1>Tạo Blog của bạnnn</h1>
                        </div>
                    </div>
                    <div id="formNews">
                        <form id="formCreateBlog" method="post" action="BlogController" enctype="multipart/form-data">
                            <%
                                BlogDAO bdao = new BlogDAO();
                                ResultSet rs = bdao.getAll();

                                if (rs != null) {
                                    while (rs.next()) {
                            %>
                            <input type="hidden" class="elementNews" value="<%= rs.getString("idBlog")%>"/>
                            <%
                                    }
                                }
                            %>


                            <div class="input-control">
                                <label for="idnews">ID Blog</label>
                                <input type="text" id="idBlog" name="idBlog" placeholder="Nhập ID Blog" required=""/>
                                <div class="error"></div>
                            </div>

                            <div class="input-control">
                                <label for="tittle">Nguoi</label>
                                <input type="text" id="username" value="<%= oldAcc.getUsername()%>" name="username" placeholder="" required=""/>
                                <div class="error"></div>
                            </div>

                            <div class="input-control">
                                <label for="tittle">Tác giả</label>
                                <input type="text" id="nameAuthor" name="nameAuthor" placeholder="Nhập tác gia Blog" required=""/>
                                <div class="error"></div>
                            </div>

                            <div class="input-control">
                                <label for="author">Tiêu đề</label>
                                <input type="text" id="nameBlog" name="nameBlog"  placeholder="Nhập Tieu dè Blog" required=""/>
                                <div class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="header">Nội dung 1</label>
                                <input type="text" id="content1" name="content1" placeholder="Nội dung thứ 1" required=""/>
                                <div class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="img1">Hình 1</label>
                                <input type="file" id="img1" name="img1" value="" placeholder="Chọn hình ảnh thứ 1" required=""/>
                                <input type="hidden" name="img1_default" value=""/>
                                <div class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="body">Nội dung 2</label>
                                <input type="text" id="content2" name="content2" placeholder="Nội dung thứ 2"/>
                                <div  class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="img2">Hình 2</label>
                                <input type="file" id="img2" name="img2" value="" placeholder="Chọn hình ảnh thứ 2"/>
                                <input type="hidden" name="img2_default" value=""/>
                                <div id="img2Error" class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="footer">Nội dung 3</label>
                                <input type="text" id="content3" name="content3" placeholder="Nội dung thứ 3"/>
                                <div class="error"></div>
                            </div>
                            <div class="input-control">
                                <label for="img2">Hình 3</label>
                                <input type="file" id="img3" name="img3" value="" placeholder="Chọn hình ảnh thứ 3"/>
                                <input type="hidden" name="img3_default" value=""/>
                                <div id="img3Error" class="error"></div>
                            </div>
                            <%
                                LocalDate date = LocalDate.now();
                                Date o_date = Date.valueOf(date);
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String dateStr = sdf.format(o_date);
                            %>
                            <div class="input-control">
                                <label for="dateW">Ngày đăng</label>
                                <input type="date" id="dateW" name="dateW" placeholder="dateW" value="<%=dateStr%>" readonly/>
                                <div id="img3Error" class="error"></div>
                            </div>
                            <!--                        <div class="input-control">
                                                        <label for="pubDate">Ngày đăng</label>
                                                        <input type="date" id="pubDate" name="pubDate" placeholder="Ngày xuất bản" value=""/>
                                                        <div class="error"></div>
                                                    </div>-->
                            <button type="submit" id="submit" name="btnCreateBlog">Đăng</button>
                        </form>
                    </div>
                    <div>
                        <img src="/resource/imag/viet.png" alt="alt" style=" width: 100%;
                             height: auto;">
                    </div>
                </main>
                <!-- MAIN -->
            </section>
            <%
                }
            %>
        </div>
    </div>
    <!-- CONTENT -->
    <script src="/resource/js/createNewsValidate.js"></script>
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
