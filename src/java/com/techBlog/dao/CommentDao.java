package com.techBlog.dao;

import com.techBlog.entities.Comment;
import java.sql.*;

public class CommentDao {

    private Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }

    //method for save comment on post
    public boolean saveCommentOnPost(Comment c) {
        boolean f = false;
        try {
            PreparedStatement ps = con.prepareStatement("insert into comment(pid,urid,comment) values(?,?,?)");
            ps.setInt(1, c.getPid());
            ps.setInt(2, c.getUid());
            ps.setString(3, c.getComment());
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //method for fetch comment on post
    public Comment getCommentOnPost(int pid) {
        Comment cm = null;
        try {
            PreparedStatement ps = con.prepareStatement("Select * from comment where pid=?");
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cm=new Comment();
               rs.getInt("pid");
                rs.getInt("urid");
                rs.getString("comment");
                rs.getTimestamp("cmdate");
               cm.
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
