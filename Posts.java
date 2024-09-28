/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;

import java.sql.*;
import javax.servlet.http.Part;


/**
 *
 * @author kavit
 */
public class Posts {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pPic;
    private Timestamp pDate;
    private int catid;
    private int userid;
   

    public Posts(int pid, String pTitle, String pContent, String pPic, Timestamp pDate, int catid, int userid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userid=userid;
       
    }

    public Posts(int catid, String pTitle, String pContent, String pPic, Timestamp pDate, int userid) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userid=userid;
       
    }

   
    
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
   
    
}
