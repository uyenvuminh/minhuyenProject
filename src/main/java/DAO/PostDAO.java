/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Models.blogPost;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class PostDAO {
        Connection conn;

    public PostDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from blogPost");
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getTopBlogPost() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select top 6 * from blogPost");
//            rs = st.executeQuery("SELECT column FROM table ORDER BY RANDOM()LIMIT 3");
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public blogPost getBlogPost(String idBlogPost) {
        blogPost acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from blogPost where idBlogPost = ?");
            ps.setString(1, idBlogPost);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acc = new blogPost(rs.getString("idBlogPost"), rs.getString("username"), rs.getString("nameAuthorPost"), rs.getString("nameBlogPost"), rs.getString("content1Post"),  rs.getString("img1Post"),rs.getString("content2Post"), rs.getString("img2Post"), rs.getString("content3Post"), rs.getString("img3Post"), rs.getString("datePost"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

//    public ResultSet getAnotherBlog(String idBlogPost) {
//        ResultSet rs = null;
//        try {
//            PreparedStatement ps = conn.prepareStatement("select * from blogPost where idBlogPost != ?");
//            ps.setString(1, idNews);
//            rs = ps.executeQuery();
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return rs;
//    }

    public blogPost addBlogPost(blogPost obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into blogPost values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, obj.getIdBlogPost());
            ps.setString(2, obj.getUsername());
            ps.setString(3, obj.getNameAuthorPost());
            ps.setString(4, obj.getNameBlogPost());
            ps.setString(5, obj.getContent1Post());
            ps.setString(6, obj.getImg1Post());
            ps.setString(7, obj.getContent2Post());
            ps.setString(8, obj.getImg2Post());
            ps.setString(9, obj.getContent3Post());
            ps.setString(10, obj.getImg3Post());
            ps.setString(11, obj.getDatePost());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : obj;
    }

//    public blog update(String idBlogPost, blog obj){
//        int count = 0;
//        try {
//            PreparedStatement ps = conn.prepareStatement("Update blog set nameAuthor = ?, nameBlog = ?, content1 = ?, content2 = ?, content3 = ? where idBlog = ?");
//            ps.setString(1, obj.getIdBlog());
//            ps.setString(2, obj.getnameAuthor());
//            ps.setString(3, obj.getNameBlog());
//            ps.setString(4, obj.getContent1());
//            ps.setString(5, obj.getContent2());
//            ps.setString(6, obj.getContent3());
//            count = ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return (count == 0) ? null : obj;
//    }
//}
    
    
      public void delete(String idBlog){
        try {
            PreparedStatement ps = conn.prepareStatement("Delete from blog where idBlog = ?");
            ps.setString(1, idBlog);
            int count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
