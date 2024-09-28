/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.self.care.entities;

import com.self.care.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PostData {

    Connection con;

    public PostData(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "Select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String cname = set.getString("cname");
                String desc = set.getString("description");
                Category c = new Category(cid, cname, desc);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Posts p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTitle,pContent,pPic,catid,userid) values(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, p.getpTitle());
            pst.setString(2, p.getpContent());
            pst.setString(3, p.getpPic());
            pst.setInt(4, p.getCatid());
            pst.setInt(5, p.getUserid());
            pst.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get all blog posts:-
    public List<Posts> getAllPosts() {
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement pst = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = pst.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");

                Posts p = new Posts(pid, pTitle, pContent, pPic, date, catid, userid);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get all blog post by category id:-
    public List<Posts> getPostsByCatid(int catid) {
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement pst = con.prepareStatement("select * from posts where catid=?");
            pst.setInt(1, catid);
            ResultSet set = pst.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userid = set.getInt("userid");

                Posts p = new Posts(pid, pTitle, pContent, pPic, date, catid, userid);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Posts getPostByPostId(int postId) {

        Posts post = null;
        String q = "select * from posts where pid=?";

        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userid = set.getInt("userid");

                post = new Posts(pid, pTitle, pContent, pPic, date, cid, userid);

                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

}
