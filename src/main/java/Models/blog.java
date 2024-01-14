/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class blog {

    private String idBlog;
    private String username;
    private String nameAuthor;
    private String nameBlog;
    private String content1;
    private String img1;
    private String content2;
    private String img2;
    private String content3;
    private String img3;
    private String datew;

    public blog() {
    }

    public blog(String idBlog, String username, String nameAuthor, String nameBlog, String content1, String img1, String content2, String img2, String content3, String img3, String datew) {
        this.idBlog = idBlog;
        this.username = username;
        this.nameAuthor = nameAuthor;
        this.nameBlog = nameBlog;
        this.content1 = content1;
        this.img1 = img1;
        this.content2 = content2;
        this.img2 = img2;
        this.content3 = content3;
        this.img3 = img3;
        this.datew = datew;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDatew() {
        return datew;
    }

    public void setDatew(String datew) {
        this.datew = datew;
    }

    public String getIdBlog() {
        return idBlog;
    }

    public void setIdBlog(String idBlog) {
        this.idBlog = idBlog;
    }

    public String getNameAuthor() {
        return nameAuthor;
    }

    public void setNameAuthor(String nameAuthor) {
        this.nameAuthor = nameAuthor;
    }

    public String getNameBlog() {
        return nameBlog;
    }

    public void setNameBlog(String nameBlog) {
        this.nameBlog = nameBlog;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getContent3() {
        return content3;
    }

    public void setContent3(String content3) {
        this.content3 = content3;
    }

}
