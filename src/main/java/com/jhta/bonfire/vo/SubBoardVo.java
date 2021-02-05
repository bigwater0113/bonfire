package com.jhta.bonfire.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor
public class SubBoardVo {
    private int num;
    private String id;
    private String title;
    private String content;
    private Date adddate;
    private int recommand;
    private int hits;
    private String cname;

}
