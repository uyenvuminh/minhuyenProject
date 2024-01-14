/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Models.blog;
import Models.storage;
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
public class StorageDAO {
    Connection conn;

    public StorageDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from storage");
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getTopStorage() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select top 3 * from storage");
//            rs = st.executeQuery("SELECT column FROM table ORDER BY RANDOM()LIMIT 3");
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public storage getStorage(String idBlog) {
        storage acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from storage where idBlog = ?");
            ps.setString(1, idBlog);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acc = new storage(rs.getString("idBlogStorage"), rs.getString("username"), rs.getString("nameAuthorStorage"), rs.getString("nameBlogStorage"), rs.getString("content1Storage"),rs.getString("img1Storage"), rs.getString("content2Storage"),rs.getString("img2Storage"), rs.getString("content3Storage"),rs.getString("img3Storage"), rs.getString("dateStorage"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public ResultSet getAnotherStorage(String idBlog) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from storage where idBlog != ?");
            ps.setString(1, idBlog);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public storage addStorage(storage obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into storage values(?,?,?,?,?,?,?,?,?,?,?)");
            
            ps.setString(1, obj.getIdBlogStorage());
            ps.setString(2, obj.getUsername());
            ps.setString(3, obj.getNameAuthorStorage());
            ps.setString(4, obj.getNameBlogStorage());
            ps.setString(5, obj.getContent1Storage());
            ps.setString(6, obj.getImg1Storage());
            ps.setString(7, obj.getContent2Storage());
            ps.setString(8, obj.getImg2Storage());
            ps.setString(9, obj.getContent3Storage());
            ps.setString(10, obj.getImg3Storage());
            ps.setString(11, obj.getDateStorage());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            PreparedStatement ps = conn.prepareStatement("Delete from storage where idBlog = ?");
            ps.setString(1, idBlog);
            int count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StorageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
