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
public class blogPost {

    private String idBlogPost;
    private String username;
    private String nameAuthorPost;
    private String nameBlogPost;
    private String content1Post;
    private String img1Post;
    private String content2Post;
    private String img2Post;
    private String content3Post;
    private String img3Post;
    private String datePost;

    public blogPost() {
    }

    public blogPost(String idBlogPost, String username, String nameAuthorPost, String nameBlogPost, String content1Post, String img1Post, String content2Post, String img2Post, String content3Post, String img3Post, String datePost) {
        this.idBlogPost = idBlogPost;
        this.username = username;
        this.nameAuthorPost = nameAuthorPost;
        this.nameBlogPost = nameBlogPost;
        this.content1Post = content1Post;
        this.img1Post = img1Post;
        this.content2Post = content2Post;
        this.img2Post = img2Post;
        this.content3Post = content3Post;
        this.img3Post = img3Post;
        this.datePost = datePost;
    }

    public String getImg1Post() {
        return img1Post;
    }

    public void setImg1Post(String img1Post) {
        this.img1Post = img1Post;
    }

    public String getImg2Post() {
        return img2Post;
    }

    public void setImg2Post(String img2Post) {
        this.img2Post = img2Post;
    }

    public String getImg3Post() {
        return img3Post;
    }

    public void setImg3Post(String img3Post) {
        this.img3Post = img3Post;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIdBlogPost() {
        return idBlogPost;
    }

    public void setIdBlogPost(String idBlogPost) {
        this.idBlogPost = idBlogPost;
    }

    public String getNameAuthorPost() {
        return nameAuthorPost;
    }

    public void setNameAuthorPost(String nameAuthorPost) {
        this.nameAuthorPost = nameAuthorPost;
    }

    public String getNameBlogPost() {
        return nameBlogPost;
    }

    public void setNameBlogPost(String nameBlogPost) {
        this.nameBlogPost = nameBlogPost;
    }

    public String getContent1Post() {
        return content1Post;
    }

    public void setContent1Post(String content1Post) {
        this.content1Post = content1Post;
    }

    public String getContent2Post() {
        return content2Post;
    }

    public void setContent2Post(String content2Post) {
        this.content2Post = content2Post;
    }

    public String getContent3Post() {
        return content3Post;
    }

    public void setContent3Post(String content3Post) {
        this.content3Post = content3Post;
    }

    public String getDatePost() {
        return datePost;
    }

    public void setDatePost(String datePost) {
        this.datePost = datePost;
    }

}
