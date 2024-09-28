/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;


import java.sql.*;

/**
 *
 * @author kavit
 */
public class Database {
   
    public static Connection con;
    
    public static Connection getConnection(){
       try{
           if(con==null){
                //driver class load:-
                Class.forName("com.mysql.jdbc.Driver");
           
                //create a connection:-
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                
            }
           
           
       }catch(Exception e){
           e.printStackTrace();
       }
        
        return con;
    }
    
 //   private Connection con;

    public Database(Connection con) {
        Database.con = con;
    }
    
 
    //method to insert user to database:-
    public boolean saveUser(User user){
        boolean f=false;
        try{
            //user-->databases
            String query="insert into user1(name,contact,password) values(?,?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,user.getName());
            pst.setInt(2,user.getContact());
            pst.setString(3,user.getPassword());
            
            pst.executeUpdate();
            f=true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return f;
    }
    
    //get user by user contact and password:-
     public User getUserByNameAndPassword(String name,String password){
        User user=null;
        
       try{
            String query="select * from user1 where name=? and password=?";
           PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,name);
           pst.setString(2,password);
           ResultSet set=pst.executeQuery();
           
            if(set.next()){
              user=new User();
              int id=set.getInt("id");
              user.setId(id);
               
               user.setName(set.getString("name"));
               user.setContact(set.getInt("contact"));
               user.setPassword(set.getString("password"));
               user.setRdate(set.getTimestamp("rdate"));
               user.setProfile(set.getString("profile"));
               user.setAbout(set.getString("about")); 
            }else{
               
            }
            
        }catch(Exception e){
            e.printStackTrace();
       }
        
        return user;
   }
    
     public boolean updateUser(User user){
         boolean f=false;
         try{
             
             String query="update user1 set name=?, profile=?, about=? where id=?";
             PreparedStatement p=con.prepareStatement(query);
             p.setString(1,user.getName());
             p.setString(2,user.getProfile());
              p.setString(3, user.getAbout());
             p.setInt(4,user.getId());
             
             p.executeUpdate();
             f=true;
             
         }catch(SQLException e){
         }
         return f;
     }
     
     public User getUserByUserId(int userId){
         
        User user=null;
        try{
        String q="select * from user1 where id=?";
        PreparedStatement ps=this.con.prepareStatement(q);
        ps.setInt(1,userId);
        ResultSet set=ps.executeQuery();
        
        if(set.next()){
             user=new User();
             String  name=set.getString("name");
              user.setName(name);
               
               user.setId(set.getInt("id"));
               user.setContact(set.getInt("contact"));
               user.setPassword(set.getString("password"));
               user.setRdate(set.getTimestamp("rdate"));
               user.setProfile(set.getString("profile"));
               user.setAbout(set.getString("about")); 
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
     }
     
     public boolean saveRoutine(Routine routine){
        boolean f=false;
        try{
            //user-->databases
            String query="insert into routine(routine_text) values(?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1,routine.getRoutine_text());
            
            pst.executeUpdate();
            f=true;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return f;
    }
}
     
     
     

