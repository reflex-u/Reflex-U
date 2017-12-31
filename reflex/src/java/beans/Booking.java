/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Shameera
 */
public class Booking {
    
    private String date;
    private String startTime;
    private String duration;
    private String name;
    private String phoneNo;
    private String email;
    private String centerName;
    

    public Booking() {
    }

    public Booking(String date, String startTime, String duration, String name, String phoneNo, String email, String centerName) {
        this.date = date;
        this.startTime = startTime;
        this.duration = duration;
        this.name = name;
        this.phoneNo = phoneNo;
        this.email = email;
        this.centerName = centerName;
     
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }

 
    
    
}
