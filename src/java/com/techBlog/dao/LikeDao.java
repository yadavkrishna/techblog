package com.techBlog.dao;

import com.techBlog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author krish
 */
public class LikeDao {

    private Connection con;

    //constructor
    public LikeDao(Connection con) {
        this.con = con;
    }

    //method for save number of Like On Post
    public boolean likeOnPost(int pid, int uid) {
        boolean f = false;

        try {
            String q = "insert into likedb(postid,usrid) values(?,?) ";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //method to count like on post  
    public int getLikeByPostId(int pid) {
        int count = 0;

        try {
            String q = "select count(*) from likedb where postid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
                /*
                //no of likes assign to count 
                we can do another way also like 
                count=rs.getInt("count(*)") ==this will also give no of count
                 */
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //method for get ispost is liked by user
    public boolean isPostLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement ps = con.prepareStatement("select * from likedb where postid=? and usrid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = true;  //means post is liked
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //method for delet like on post / disklike post
    public boolean deleteLikeOnPost(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement ps = con.prepareStatement("delete * from where postid=? and usrid=?");
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = true; //if post deleted number of row affected so f become true
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

 }
