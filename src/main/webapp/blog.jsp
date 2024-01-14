<%-- 
    Document   : news
    Created on : Nov 5, 2023, 8:37:10 AM
    Author     : Admin
--%>

<%@page import="Models.account"%>
<%@page import="Models.blogPost"%>
<%@page import="DAO.PostDAO"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="DAO.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="/resource/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="/resource/css/tiny-slider.css" rel="stylesheet">
        <link href="/resource/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="/resource/css/mystyle.css">
        <link rel="stylesheet" href="/resource/css/news.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie[] cook = request.getCookies();
            String cookieUS = null;
            int count = 0;
            for (int i = 0; i < cook.length; i++) {
                if (cook[i].getName().equals("cookieUS")) {
                    cookieUS = cook[i].getValue();
                    count++;
                    break;
                }
            }
            if (count == 0) {
                response.sendRedirect("/");
            } else {
                AccountDAO adao = new AccountDAO();
                account acc = adao.getAccount(cookieUS);
        %>
 
        <!-- head page -->

        <main>
            <div class="container">
                <%
                    String idNews = (String) session.getAttribute("idBlogPost");
                    PostDAO ndao = new PostDAO();
                    blogPost news = ndao.getBlogPost(idNews);
                %>
                <section class="news">
                    <div class="custom-container">
                        <article class="article">
                            <div class="item">
                                <ul>
                                    <li><a href="/ProductsController">Trang Chủ</a></li>
                                    <li><a href="/BlogController/detail/<%= news.getIdBlogPost()%>">Tin Tức Chủ đề</a></li>
                                </ul>
                            </div>
                            <h2><%= news.getNameBlogPost()%></h2>
                            <p class="author"><%= news.getNameAuthorPost()%> <%= news.getDatePost()%></p>
                            <p class="header"><%= news.getContent1Post()%></p>
                            <figure>
                                <img src="/resource/<%= news.getImg1Post()%>" alt="">
                            </figure>
                            <p class="body"><%= news.getContent2Post()%></p>
                            <figure>
                                <img src="/resource/<%= news.getImg2Post()%>" alt="">
                            </figure>
                            <p class="footer"><%= news.getContent3Post()%></p>
                              <figure>
                                <img src="/resource/<%= news.getImg3Post()%>" alt="">
                            </figure>
                        </article>
                    </div>
                </section>
                <aside class="sidebar">
                    <div class="other-news-container">
                     
                    </div>
                </aside>
            </div>
        </main>

        <%
            }
        %>

        <!-- js -->
        <script src="/resource/js/bootstrap.bundle.min.js"></script>
        <script src="/resource/js/tiny-slider.js"></script>
    </body>
</html>
