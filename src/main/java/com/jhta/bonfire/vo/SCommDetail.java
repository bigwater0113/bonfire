package com.jhta.bonfire.vo;

public class SCommDetail {
    private SCommentVo scommentVo;
    private int value;

    public SCommDetail(SCommentVo scommentVo, int value) {
        this.scommentVo = scommentVo;
        this.value = value;
    }

    public SCommDetail() {
    }

    public SCommentVo getScommentVo() {
        return this.scommentVo;
    }

    public void setScommentVo(SCommentVo scommentVo) {
        this.scommentVo = scommentVo;
    }

    public int getValue() {
        return this.value;
    }

    public void setValue(int value) {
        this.value = value;
    }

}
