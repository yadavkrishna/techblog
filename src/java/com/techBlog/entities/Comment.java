
package com.techBlog.entities;

//pojo class
import java.sql.Timestamp;

public class Comment {
    private int cmid,pid,uid;
    private String comment;
    private Timestamp cmdate;

    public Comment(int cmid, int pid, int uid, String comment, Timestamp cmdate) {
        this.cmid = cmid;
        this.pid = pid;
        this.uid = uid;
        this.comment = comment;
        this.cmdate = cmdate;
    }

    public Comment(int pid, int uid, String comment) {
        this.pid = pid;
        this.uid = uid;
        this.comment = comment;
    }

    public Comment() {
    }


    public int getCmid() {
        return cmid;
    }

    public void setCmid(int cmid) {
        this.cmid = cmid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCmdate() {
        return cmdate;
    }

    public void setCmdate(Timestamp cmdate) {
        this.cmdate = cmdate;
    }
    
}
