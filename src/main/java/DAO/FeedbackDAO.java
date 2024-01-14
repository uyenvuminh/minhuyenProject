/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Models.blog;
import Models.feedback;
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
public class FeedbackDAO {

    Connection conn;

    public FeedbackDAO (){
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from feedback");
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ResultSet getTopFeed() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select top 3 * from feedback");
//            rs = st.executeQuery("SELECT column FROM table ORDER BY RANDOM()LIMIT 3");
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public feedback getFeed(String idFeedback) {
        feedback acc = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from feedback where idFeedback = ?");
            ps.setString(1, idFeedback);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                acc = new feedback(rs.getString("idFeedback"),rs.getString("username"), rs.getString("emailFeedback"), rs.getString("content1"), rs.getString("img1"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public ResultSet getAnotherFeed(String idFeedback) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from feedback where idFeedback != ?");
            ps.setString(1, idFeedback);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public feedback addFeed(feedback obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into feedback values(?,?,?,?,?)");

            ps.setString(1, obj.getIdFeedback());
            ps.setString(2, obj.getUsername());
            ps.setString(3, obj.getEmailFeedback());
            ps.setString(4, obj.getPhoneFeedback());
            ps.setString(5, obj.getFeedback());
         
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public void delete(String idFeedback) {
        try {
            PreparedStatement ps = conn.prepareStatement("Delete from feedback where idFeedback = ?");
            ps.setString(1, idFeedback);
            int count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
