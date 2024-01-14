/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB.DBConnection;
import Models.account;
import Models.adminAccount;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class AdminAccountDAO {

    Connection conn;
    private String hashPass = "";

    public AdminAccountDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Lay tat ca thong tin khach hang trong csdl
     *
     * @return resultset: chua thong tin khach hang
     */
    public ResultSet getAll() {
        try {
            //Tao doi tuong truy van
            Statement st = conn.createStatement();
            //Thuc thi truy van 
            ResultSet rs = st.executeQuery("select * from adminAccount");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getHashPass(String pass) {
        try {
            String plainText = pass;
            MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
            mdAlgorithm.update(plainText.getBytes());

            byte[] digest = mdAlgorithm.digest();
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < digest.length; i++) {
                plainText = Integer.toHexString(0xFF & digest[i]);
                if (plainText.length() < 2) {
                    plainText = "0" + plainText;
                }
                hexString.append(plainText);
            }
            hashPass = hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hashPass;
    }

    public ResultSet getInforLogin() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select nameAdmin, passAdmin,emailAdmin, avatarAdmin from adminAccount");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public adminAccount getAdmin(String nameAdmin) {
        adminAccount ah = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from adminAccount where nameAdmin=?");
            ps.setString(1, nameAdmin);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ah = new adminAccount(rs.getString("nameAdmin"), rs.getString("passAdmin"), rs.getString("emailAdmin"), rs.getString("avatarAdmin"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ah;
    }

    public adminAccount addAdmin(adminAccount obj) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into adminAccount values(?,?,?,?)");
            ps.setString(1, obj.getNameAdmin());
            ps.setString(2, obj.getPassAdmin());
            ps.setString(3, obj.getEmailAdmin());
            ps.setString(4, obj.getAvatarAdmin());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : obj;
    }
}
