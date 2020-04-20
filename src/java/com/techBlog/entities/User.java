package com.techBlog.entities;
import java.sql.Timestamp;

public class User {
    private int id;
    private String name,email,password,gender;
    private String mobile,profile,regdate;

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public User() {
    }


  

    public User(String name, String email, String password, String gender, String mobile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.mobile = mobile;
       
    }

    public User(int id, String name, String email, String password, String gender, String mobile,String profile, String regdate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.mobile = mobile;
        this.profile = profile;
        this.regdate = regdate;
      
    }
     
    //getter setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
     public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
