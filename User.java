/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;
import java.sql.*;
public class User {
    private int id;
    private String name;
    private int contact;
    
    private String password;
    private Timestamp rdate;
    private String profile;
    private String about;

    public User(int id, String name, int contact, String password, Timestamp rdate,String profile,String about) {
        this.id = id;
        this.name = name;
        this.contact = contact;
      
        this.password = password;
        this.rdate = rdate;
        this.profile=profile;
      
        this.about=about;
    }

    public User() {
    }

    public User(String name, int contact, String password) {
        this.name = name;
        this.contact = contact;
        
        this.password = password;
    }

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

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }
    
   

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
     public String getAbout(){
        return about;
    }
     
    public void setAbout(String about){
        this.about=about;
    }
    
}
