
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class adminAccount {
    private String nameAdmin;
    private String passAdmin;
    private String emailAdmin;
    private String avatarAdmin;

    public adminAccount() {
    }

    public adminAccount(String nameAdmin, String passAdmin, String emailAdmin, String avatarAdmin) {
        this.nameAdmin = nameAdmin;
        this.passAdmin = passAdmin;
        this.emailAdmin = emailAdmin;
        this.avatarAdmin = avatarAdmin;
    }

    public String getEmailAdmin() {
        return emailAdmin;
    }

    public void setEmailAdmin(String emailAdmin) {
        this.emailAdmin = emailAdmin;
    }

    public String getAvatarAdmin() {
        return avatarAdmin;
    }

    public void setAvatarAdmin(String avatarAdmin) {
        this.avatarAdmin = avatarAdmin;
    }



    public String getNameAdmin() {
        return nameAdmin;
    }

    public void setNameAdmin(String nameAdmin) {
        this.nameAdmin = nameAdmin;
    }

    public String getPassAdmin() {
        return passAdmin;
    }

    public void setPassAdmin(String passAdmin) {
        this.passAdmin = passAdmin;
    }
    
}
