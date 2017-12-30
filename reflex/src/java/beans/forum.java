/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author amyliaahamad
 */
public class forum {
    private String forumTopic;
    private String forumDetails;
    private String createby;

    public forum( String forumTopic, String forumDetails, String createby) { 
    
        this.forumTopic = forumTopic;
        this.forumDetails = forumDetails;
        this.createby = createby;
    }

    public forum() { }

   
    public String getForumTopic() {
        return forumTopic;
    }

    public void setForumTopic(String forumTopic) {
        this.forumTopic = forumTopic;
    }

    public String getForumDetails() {
        return forumDetails;
    }

    public void setForumDetails(String forumDetails) {
        this.forumDetails = forumDetails;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }
}
