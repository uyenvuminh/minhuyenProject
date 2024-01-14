/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDAO;
import DAO.PostDAO;
import DAO.StorageDAO;
import Models.blog;
import Models.blogPost;
import Models.storage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author DELL
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class BlogController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogControllehhhhhhhhr at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith("/BlogController/writeBlog")) {
            request.getRequestDispatcher("/writeBlog.jsp").forward(request, response);
        }
        if (path.startsWith("/BlogController/detail/")) {
            String[] s = path.split("/");
            String idNews = s[s.length - 1];
            HttpSession session = request.getSession();
            session.setAttribute("idBlogPost", idNews);
            request.getRequestDispatcher("/blog.jsp").forward(request, response);
        } else if (path.endsWith("/BlogController/successBlog")) {
            request.getRequestDispatcher("/successBlog.jsp").forward(request, response);
        } else if (path.startsWith("/BlogController/confirm")) {
            String[] s = path.split("/");
            String idBlog = s[s.length - 1];
            BlogDAO ndao = new BlogDAO();
            blog blogg = ndao.getBlog(idBlog);
            HttpSession session = request.getSession();
            session.setAttribute("blogOld", blogg);
            request.getRequestDispatcher("/confirm.jsp").forward(request, response);
        } else if (path.startsWith("/BlogController/deleteBlog")) {
            String[] s = path.split("/");
            String idBlog = s[s.length - 1];
            BlogDAO bbdao = new BlogDAO();
            blog blogg = bbdao.getBlog(idBlog);

            HttpSession session = request.getSession();
            session.setAttribute("blogOld", blogg);
            request.getRequestDispatcher("/deleteBlog.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO ndao = new BlogDAO();
        PostDAO podao = new PostDAO();
        StorageDAO sdao = new StorageDAO();

        if (request.getParameter("btnCreateBlog") != null) {
            String idBlog = request.getParameter("idBlog");
            String username = request.getParameter("username");
            String nameAuthor = request.getParameter("nameAuthor");
            String nameBlog = request.getParameter("nameBlog");
            String content1 = request.getParameter("content1");
            String content2 = request.getParameter("content2");
            String content3 = request.getParameter("content3");
            String dateW = request.getParameter("dateW");

            String image1_default = request.getParameter("img1_default");
            Part part = request.getPart("img1");
            String image1_new = part.getSubmittedFileName();
            String img1;

            if (image1_new.equals("")) {
                img1 = image1_default;
            } else {
                img1 = "imag/" + image1_new;
            }

            String image2_default = request.getParameter("img2_default");
            Part part2 = request.getPart("img2");
            String image2_new = part2.getSubmittedFileName();
            String img2;

            if (image2_new.equals("")) {
                img2 = image2_default;
            } else {
                img2 = "imag/" + image2_new;
            }

            String image3_default = request.getParameter("img3_default");
            Part part3 = request.getPart("img3");
            String image3_new = part3.getSubmittedFileName();
            String img3;

            if (image3_new.equals("")) {
                img3 = image3_default;
            } else {
                img3 = "imag/" + image3_new;
            }

            blog blogs = new blog(idBlog, username, nameAuthor, nameBlog, content1, img1, content2, img2, content3, img3, dateW);

            blog newNews = ndao.addBlog(blogs);

            if (newNews != null) {
                response.sendRedirect("/LoginController");
            } else {
                response.sendRedirect("/BlogController/writeBlog");
            }
        }

        if (request.getParameter("btnPostBlog") != null) {
            String idBlogPost = request.getParameter("idBlogPost");
            String username = request.getParameter("username");
            String nameAuthorPost = request.getParameter("nameAuthorPost");
            String nameBlogPost = request.getParameter("nameBlogPost");
            String content1Post = request.getParameter("content1Post");
//            String img1Post = request.getParameter("img1Post");
            String content2Post = request.getParameter("content2Post");
//            String img2Post = request.getParameter("img2Post");
            String content3Post = request.getParameter("content3Post");
//            String img3Post = request.getParameter("img3Post");
            String datePost = request.getParameter("datePost");

            String image1_default = request.getParameter("img1_default");
            Part part = request.getPart("img1Post");
            String image1_new = part.getSubmittedFileName();
            String img1Post;

            if (image1_new.equals("")) {
                img1Post = image1_default;
            } else {
                img1Post = "imag/" + image1_new;
            }

            String image2_default = request.getParameter("img2_default");
            Part part2 = request.getPart("img2Post");
            String image2_new = part.getSubmittedFileName();
            String img2Post;

            if (image2_new.equals("")) {
                img2Post = image2_default;
            } else {
                img2Post = "imag/" + image2_new;
            }

            String image3_default = request.getParameter("img3_default");
            Part part3 = request.getPart("img3Post");
            String image3_new = part.getSubmittedFileName();
            String img3Post;

            if (image3_new.equals("")) {
                img3Post = image3_default;
            } else {
                img3Post = "imag/" + image3_new;
            }

            blogPost posts = new blogPost(idBlogPost, username, nameAuthorPost, nameBlogPost, content1Post, img1Post, content2Post, img2Post, content3Post, img3Post, datePost);
            blogPost newBlogPost = podao.addBlogPost(posts);

            if (newBlogPost != null) {
                ndao.delete(idBlogPost);
                response.sendRedirect("/AdminController");
                System.out.println("ok DUOC");
            } else {
                response.sendRedirect("/BlogController/successBlog");
                System.out.println("CHUA DUOC");
            }
        }
        
        
        
        
        
        
         if (request.getParameter("btnRejectBlog") != null) {
            String idBlogPost = request.getParameter("idBlogPost");
            String username = request.getParameter("username");
            String nameAuthorPost = request.getParameter("nameAuthorPost");
            String nameBlogPost = request.getParameter("nameBlogPost");
            String content1Post = request.getParameter("content1Post");
            String content2Post = request.getParameter("content2Post");
            String content3Post = request.getParameter("content3Post");
            String datePost = request.getParameter("datePost");

            String image1_default = request.getParameter("img1_default");
            Part part = request.getPart("img1");
            String image1_new = part.getSubmittedFileName();
            String img1Post;

            if (image1_new.equals("")) {
                img1Post = image1_default;
            } else {
                img1Post = "imag/" + image1_new;
            }

            String image2_default = request.getParameter("img2_default");
            Part part2 = request.getPart("img2");
            String image2_new = part.getSubmittedFileName();
            String img2Post;

            if (image2_new.equals("")) {
                img2Post = image2_default;
            } else {
                img2Post = "imag/" + image2_new;
            }

            String image3_default = request.getParameter("img3_default");
            Part part3 = request.getPart("img3");
            String image3_new = part.getSubmittedFileName();
            String img3Post;

            if (image3_new.equals("")) {
                img3Post = image3_default;
            } else {
                img3Post = "imag/" + image3_new;
            }

            storage postss = new storage(idBlogPost, username, nameAuthorPost, nameBlogPost, content1Post, img1Post, content2Post, img2Post, content3Post, img3Post, datePost);
            storage newBlogPosts = sdao.addStorage(postss);

            if (newBlogPosts != null) {
                ndao.delete(idBlogPost);
                response.sendRedirect("/AdminController");
                System.out.println("ok DUOC");
            } else {
                response.sendRedirect("/BlogController/successBlog");
                System.out.println("CHUA DUOC");
            }
        }

        
        
        
        
        
        
        
        
        
        
        
        

//        if (request.getParameter("btnRejectBlog") != null) {
//            String idBlogStorage = request.getParameter("idBlogPost");
//            String username = request.getParameter("username");
//            String nameAuthorStorage = request.getParameter("nameAuthorPost");
//            String nameBlogStorage = request.getParameter("nameBlogPost");
//            String content1Storage = request.getParameter("content1Post");
//            String content2Storage = request.getParameter("content2Post");
//            String content3Storage = request.getParameter("content3Post");
//            String dateStorage = request.getParameter("datePost");
//            String image1_default = request.getParameter("img1_default");
//
//            storage sto = new storage(idBlogStorage, username, nameAuthorStorage, nameBlogStorage, content1Storage, content2Storage, content3Storage, dateStorage);
//            storage newBlogSto = sdao.addStorage(sto);
//
//            if (newBlogSto != null) {
//                ndao.delete(idBlogStorage);
//                response.sendRedirect("/AdminController");
//                System.out.println("ok DUOC");
//
//            } else {
//                response.sendRedirect("/BlogController/successBlog");
//                System.out.println("CHUA DUOC");
//            }
//        }
//
//        if (request.getParameter("btnDeleteBlog") != null) {
//            String idBlog = request.getParameter("idBlogPost");
//            try {
//                ndao.delete(idBlog);
//                response.sendRedirect("/AdminController");
//            } catch (Exception e) {
//                response.sendRedirect("/BlogController/successBlog");
//            }
//        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
