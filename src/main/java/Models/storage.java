/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class storage {

    private String idBlogStorage;
    private String username;
    private String nameAuthorStorage;
    private String nameBlogStorage;
    private String content1Storage;
    private String img1Storage;
    private String content2Storage;
    private String img2Storage;
    private String content3Storage;
    private String img3Storage;
    private String dateStorage;

    public storage() {
    }

    public storage(String idBlogStorage, String username, String nameAuthorStorage, String nameBlogStorage, String content1Storage, String img1Storage, String content2Storage, String img2Storage, String content3Storage, String img3Storage, String dateStorage) {
        this.idBlogStorage = idBlogStorage;
        this.username = username;
        this.nameAuthorStorage = nameAuthorStorage;
        this.nameBlogStorage = nameBlogStorage;
        this.content1Storage = content1Storage;
        this.img1Storage = img1Storage;
        this.content2Storage = content2Storage;
        this.img2Storage = img2Storage;
        this.content3Storage = content3Storage;
        this.img3Storage = img3Storage;
        this.dateStorage = dateStorage;
    }

    public String getImg1Storage() {
        return img1Storage;
    }

    public void setImg1Storage(String img1Storage) {
        this.img1Storage = img1Storage;
    }

    public String getImg2Storage() {
        return img2Storage;
    }

    public void setImg2Storage(String img2Storage) {
        this.img2Storage = img2Storage;
    }

    public String getImg3Storage() {
        return img3Storage;
    }

    public void setImg3Storage(String img3Storage) {
        this.img3Storage = img3Storage;
    }

   
    

    public String getIdBlogStorage() {
        return idBlogStorage;
    }

    public void setIdBlogStorage(String idBlogStorage) {
        this.idBlogStorage = idBlogStorage;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNameAuthorStorage() {
        return nameAuthorStorage;
    }

    public void setNameAuthorStorage(String nameAuthorStorage) {
        this.nameAuthorStorage = nameAuthorStorage;
    }

    public String getNameBlogStorage() {
        return nameBlogStorage;
    }

    public void setNameBlogStorage(String nameBlogStorage) {
        this.nameBlogStorage = nameBlogStorage;
    }

    public String getContent1Storage() {
        return content1Storage;
    }

    public void setContent1Storage(String content1Storage) {
        this.content1Storage = content1Storage;
    }

    public String getContent2Storage() {
        return content2Storage;
    }

    public void setContent2Storage(String content2Storage) {
        this.content2Storage = content2Storage;
    }

    public String getContent3Storage() {
        return content3Storage;
    }

    public void setContent3Storage(String content3Storage) {
        this.content3Storage = content3Storage;
    }

    public String getDateStorage() {
        return dateStorage;
    }

    public void setDateStorage(String dateStorage) {
        this.dateStorage = dateStorage;
    }

}
