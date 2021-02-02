package com.jhta.bonfire.vo;

import java.sql.Date;

public class SubBoardVo {
    private int num;
    private String id;
    private String title;
    private String content;
    private Date adddate;
    private int recommand;
    private int hits;
    private String cname;

    public SubBoardVo() {
    }

    public SubBoardVo(int num, String id, String title, String content, Date adddate, int recommand, int hits, String cname) {
        this.num = num;
        this.id = id;
        this.title = title;
        this.content = content;
        this.adddate = adddate;
        this.recommand = recommand;
        this.hits = hits;
        this.cname = cname;
    }

    public int getNum() {
        return this.num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAdddate() {
        return this.adddate;
    }

    public void setAdddate(Date adddate) {
        this.adddate = adddate;
    }

    public int getRecommand() {
        return this.recommand;
    }

    public void setRecommand(int recommand) {
        this.recommand = recommand;
    }

    public int getHits() {
        return this.hits;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public String getCname() {
        return this.cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "{" +
            " num='" + getNum() + "'" +
            ", id='" + getId() + "'" +
            ", title='" + getTitle() + "'" +
            ", content='" + getContent() + "'" +
            ", adddate='" + getAdddate() + "'" +
            ", recommand='" + getRecommand() + "'" +
            ", hits='" + getHits() + "'" +
            ", cname='" + getCname() + "'" +
            "}";
    }

}
