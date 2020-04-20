package com.techBlog.dao;

import com.techBlog.entities.Category;
import com.techBlog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    //Fetch category from db Method
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<Category>();
        try {
            String q = "select * from category";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int id = set.getInt("id");
                String name = set.getString("cname");
                String desc = set.getString("cdesc");
                Category c = new Category(id, name, desc);
                list.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //method for save post in db
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into post (ptitle,pcontent,pprogram,ppic,plink,cid,uid) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, p.getPtitle());
            ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPprog());
            ps.setString(4, p.getPpic());
            ps.setString(5, p.getPlink());
            ps.setInt(6, p.getCid());
            ps.setInt(7, p.getPuid());
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //method for fetch all post
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<Post>();
        //code for fetch all post
        try {
            PreparedStatement ps = this.con.prepareStatement("select * from post");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //fetch data from Resultset and asssign to new variable 
                int pid = rs.getInt("pid");
                String title = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pprogram = rs.getString("pprogram");
                String ppic = rs.getString("ppic");
                String plink = rs.getString("plink");
                int cid = rs.getInt("cid");
                int uid = rs.getInt("uid");
                Timestamp pdate = rs.getTimestamp("puplddate");
                //all data fetched from DB now assign to Post Object to use this data
                Post p = new Post(pid, cid, uid, title, pcontent, pprogram, ppic, plink, pdate);

                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //method for get post by  category id 
    public List<Post> getAllPostByCid(int id) {
        List<Post> list = new ArrayList<Post>();
        //code for fetch all post by category id 
        try {
            PreparedStatement ps = this.con.prepareStatement("select * from post where cid=? order by pid desc");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                //fetch data from Resultset and asssign to new variable 
                int pid = rs.getInt("pid");
                String title = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pprogram = rs.getString("pprogram");
                String ppic = rs.getString("ppic");
                String plink = rs.getString("plink");
                int uid = rs.getInt("uid");
                Timestamp pdate = rs.getTimestamp("puplddate");
                //all data fetched from DB now assign to Post Object to use this data
                Post p = new Post(pid, uid, title, pcontent, pprogram, ppic, plink, pdate);

                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //method to get post by ppostid
    public Post getPostByPid(int pid) {
        Post post = null;
        try {
            PreparedStatement ps = this.con.prepareStatement("select * from post where pid=?");
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                //fetch data from Resultset and asssign to new variable 
                int cid = rs.getInt("cid");
                String title = rs.getString("ptitle");
                String pcontent = rs.getString("pcontent");
                String pprogram = rs.getString("pprogram");
                String ppic = rs.getString("ppic");
                String plink = rs.getString("plink");
                int uid = rs.getInt("uid");
                Timestamp pdate = rs.getTimestamp("puplddate");
                //all data fetched from DB now assign to Post Object to use this data
                post = new Post(pid, uid, title, pcontent, pprogram, ppic, plink, pdate);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

}
