package com.jhta.bonfire.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * int value 댓글 작성자가 추천을 했는지 안했는지
 */
public class SCommDetail extends SCommentVo{
    private int idx;
    private int num;
    private String id;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date adddate;
    private int value;

    public int getIdx() {
        return this.idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
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

    public int getValue() {
        return this.value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public SCommDetail(int idx, int num, String id, String content, Date adddate, int value) {
        this.idx = idx;
        this.num = num;
        this.id = id;
        this.content = content;
        this.adddate = adddate;
        this.value = value;
    }

    public SCommDetail() {
    }

}
