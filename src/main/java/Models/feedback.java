/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
public class feedback {
    private String idFeedback;
    private String username;
    private String emailFeedback;
    private String phoneFeedback;
    private String feedback;

    public feedback() {
    }

    public feedback(String idFeedback, String username, String emailFeedback, String phoneFeedback, String feedback) {
        this.idFeedback = idFeedback;
        this.username = username;
        this.emailFeedback = emailFeedback;
        this.phoneFeedback = phoneFeedback;
        this.feedback = feedback;
    }

    public String getIdFeedback() {
        return idFeedback;
    }

    public void setIdFeedback(String idFeedback) {
        this.idFeedback = idFeedback;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmailFeedback() {
        return emailFeedback;
    }

    public void setEmailFeedback(String emailFeedback) {
        this.emailFeedback = emailFeedback;
    }

    public String getPhoneFeedback() {
        return phoneFeedback;
    }

    public void setPhoneFeedback(String phoneFeedback) {
        this.phoneFeedback = phoneFeedback;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    
    
}
