package com.techBlog.entities;

import java.sql.Timestamp;

public class Post {

    private int pid, cid, puid;
    private String ptitle, pcontent, ppic, plink, pprogram;
    private Timestamp puploaddate;

    public Post() {
    }
    //const without post id,puploaddate

    public Post(int cid, int puid, String ptitle, String pcontent,String pprogram ,String ppic, String plink) {
        this.cid = cid;
        this.puid = puid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.plink = plink;
        this.pprogram = pprogram;
    }
    
    //const without cid
    
    public Post(int pid, int puid, String ptitle, String pcontent,String pprogram, String ppic, String plink,Timestamp puploaddate) {
        this.pid = pid;
        this.puid = puid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.plink = plink;
        this.pprogram = pprogram;
        this.puploaddate = puploaddate;
    }

    //const with all attribute
    public Post(int pid, int cid, int puid, String ptitle, String pcontent, String pprogram, String ppic, String plink, Timestamp puploaddate) {
        this.pid = pid;
        this.cid = cid;
        this.puid = puid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.plink = plink;
        this.pprogram = pprogram;
        this.puploaddate = puploaddate;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getPuid() {
        return puid;
    }

    public void setPuid(int puid) {
        this.puid = puid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public String getPlink() {
        return plink;
    }

    public void setPlink(String plink) {
        this.plink = plink;
    }

    public String getPprog() {
        return pprogram;
    }

    public void setPprog(String pprogram) {
        this.pprogram = pprogram;
    }

    public Timestamp getPuploaddate() {
        return puploaddate;
    }

    public void setPuploaddate(Timestamp puploaddate) {
        this.puploaddate = puploaddate;
    }
}
