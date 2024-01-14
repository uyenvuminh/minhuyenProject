/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.AdminAccountDAO;
import Models.account;
import Models.adminAccount;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet rrr at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/AccountController/register")) {
            AccountDAO adao = new AccountDAO();
            ResultSet rs = adao.getInforLogin();
            request.setAttribute("arrUser", rs);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else if (path.endsWith("/AccountController/registerAdmin")) {
            AdminAccountDAO adao = new AdminAccountDAO();
            ResultSet rs = adao.getInforLogin();
            request.setAttribute("arrUser", rs);
            request.getRequestDispatcher("/registerAdmin.jsp").forward(request, response);
        } else if (path.endsWith("/AccountController/login")) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else if (path.endsWith("/AccountController/loginAdmin")) {
            request.getRequestDispatcher("/loginAdmin.jsp").forward(request, response);
        } else if (path.endsWith("/AccountController/basicCode")) {
            request.getRequestDispatcher("/basicCode.jsp").forward(request, response);
        } else if (path.endsWith("/AccountController/account")) {
            request.getRequestDispatcher("/account.jsp").forward(request, response);
//        } else if (path.endsWith("/AccountController/successLogin")) {
//            request.getRequestDispatcher("/successLogin.jsp").forward(request, response);
        }
//        else if (path.endsWith("/AccountController/confirm")) {
//            request.getRequestDispatcher("/confirm.jsp").forward(request, response);
//        }

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
//        ĐĂNG NHẬP
        if (request.getParameter("login") != null) {
            try {
                AccountDAO adao = new AccountDAO();

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String hashPass = adao.getHashPass(password);

                ResultSet setAccLogin = adao.getInforLogin();
                int countLogin = 0;
                if (setAccLogin != null) {
                    while (setAccLogin.next()) {
                        if (setAccLogin.getString("username").equals(username) && setAccLogin.getString("password").equalsIgnoreCase(hashPass)) {
                            Cookie cookie = new Cookie("cookieUS", username);

                            cookie.setMaxAge(60 * 60 * 24);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                            response.sendRedirect("/LoginController?user=" + username);
                            countLogin++;
                        }
                    }
                }
                //nếu countLogin = 0 thì ko có acc
                if (countLogin == 0) {
                    response.sendRedirect("/");
                    System.out.println("Minh Uyên");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("registerBtn") != null) {
            AccountDAO adao = new AccountDAO();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String hashPass = adao.getHashPass(password);
            String email = request.getParameter("email");
            String avatar = request.getParameter("avatar");

            account acc = new account(username, hashPass, email, avatar);
            account newAcc = adao.addnew(acc);

            if (newAcc != null) {
                response.sendRedirect("/");
            } else {
                response.sendRedirect("/AccountsController/register");
            }
        }
        if (request.getParameter("loginAdmin") != null) {
            try {
                AdminAccountDAO adao = new AdminAccountDAO();
                String nameAdmin = request.getParameter("nameAdmin");
                String passAdmin = request.getParameter("passAdmin");
                String hashPass = adao.getHashPass(passAdmin);

                ResultSet setAccLoginAdmin = adao.getInforLogin();
                int countLogin = 0;
                if (setAccLoginAdmin != null) {
                    while (setAccLoginAdmin.next()) {
                        if (setAccLoginAdmin.getString("nameAdmin").equals(nameAdmin) && setAccLoginAdmin.getString("passAdmin").equalsIgnoreCase(hashPass)) {
                            HttpSession sessiona = request.getSession();
                            sessiona.setAttribute("adminPassword", passAdmin);

                            Cookie cookie = new Cookie("cookieUS", nameAdmin);
                            cookie.setMaxAge(60 * 60 * 24);
                            cookie.setPath("/");
                            response.addCookie(cookie);

                            response.sendRedirect("/AdminController?user=" + nameAdmin);
                            countLogin++;
                        }
                    }
                }
                //nếu countLogin = 0 thì không có tài khoản
                if (countLogin == 0) {
                    response.sendRedirect("/");
                    System.out.println("Fail");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (request.getParameter("registerAdmin") != null) {
                AdminAccountDAO adao = new AdminAccountDAO();

                String nameAdmin = request.getParameter("usernameAd");
                String passAdmin = request.getParameter("passwordAd");
                String emailAdmin = request.getParameter("emailAd");
                String avatarAdmin = request.getParameter("avatarAd");
                String hashPass = adao.getHashPass(passAdmin);

                adminAccount accAd = new adminAccount(nameAdmin, hashPass, emailAdmin, avatarAdmin);
                adminAccount newAcc = adao.addAdmin(accAd);

                if (newAcc != null) {
                    response.sendRedirect("/");
                } else {
                    response.sendRedirect("/AccountsController/registerAdmin");
                }
            }}}

        

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
