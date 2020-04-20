package com.techBlog.entities;
public class Category {
    private int cid;
    private String cname;
    private String cdesc;

    public Category() {
    }

    
    public Category(int cid, String cname, String cdesc) {
        this.cid = cid;
        this.cname = cname;
        this.cdesc = cdesc;
    }

    public Category(String cname, String cdesc) {
        this.cname = cname;
        this.cdesc = cdesc;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdesc() {
        return cdesc;
    }

    public void setCdesc(String cdesc) {
        this.cdesc = cdesc;
    }
    
    
    
}
