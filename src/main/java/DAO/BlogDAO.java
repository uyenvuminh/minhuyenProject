/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Models.blog;
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
public class BlogDAO {

    Connection conn;

    public BlogDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from blog");
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getTopBlog() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select top 3 * from blog");
//            rs = st.executeQuery("SELECT column FROM table ORDER BY RANDOM()LIMIT 3");
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public blog getBlog(String idBlog) {
        blog acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from blog where idBlog = ?");
            ps.setString(1, idBlog);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acc = new blog(rs.getString("idBlog"), rs.getString("nameAuthor"), rs.getString("username"), rs.getString("nameBlog"), rs.getString("content1"), rs.getString("img1"), rs.getString("content2"), rs.getString("img2"), rs.getString("content3"), rs.getString("img3"), rs.getString("dateW"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public ResultSet getAnotherBlog(String idBlog) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from blog where idBlog != ?");
            ps.setString(1, idBlog);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public blog addBlog(blog obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into blog values(?,?,?,?,?,?,?,?,?,?,?)");
            
            ps.setString(1, obj.getIdBlog());
            ps.setString(2, obj.getUsername());
            ps.setString(3, obj.getNameAuthor());
            ps.setString(4, obj.getNameBlog());
            ps.setString(5, obj.getContent1());
            ps.setString(6, obj.getImg1());
            ps.setString(7, obj.getContent2());
            ps.setString(8, obj.getImg2());
            ps.setString(9, obj.getContent3());
            ps.setString(10, obj.getImg3());
            ps.setString(11, obj.getDatew());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : obj;
    }

//    public blog update(String idNews, blog obj){
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
//    
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
