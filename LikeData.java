/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;

import java.sql.*;

public class LikeData {

    Connection con;

    public LikeData(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {

        boolean f = false;
        try {

            String q = "insert into postlike(pid,uid) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);

            p.setInt(1, pid);
            p.setInt(2, uid);

            p.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        String q = "select count(*) from postlike where pid=?";

        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);

            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    
    public boolean isLikedByUser(int pid, int uid){
        boolean f=false;
        
        try{
            PreparedStatement p=this.con.prepareStatement("select * from postlike where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2,uid);
            ResultSet set=p.executeQuery();
            if(set.next()){
                f=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean dislikePost(int pid,int uid){
      
       boolean f=false; 
        
        try{
            PreparedStatement p=this.con.prepareStatement("delete from postlike where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(1,uid);
            p.executeUpdate();
            
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }

}
