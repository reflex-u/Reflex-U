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
public class Center {

    private String id;
    private String city;
    private String name;
    private String address;
    private String contactNo;
    private String rate;

    public Center() {
    }

    public Center(String city, String name, String address, String contactNo) {
        this.city = city;
        this.name = name;
        this.address = address;
        this.contactNo = contactNo;

    }

    public Center(String city, String name, String address, String contactNo, String rate) {
        this.city = city;
        this.name = name;
        this.address = address;
        this.contactNo = contactNo;
        this.rate = rate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

}
