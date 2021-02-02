package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.vo.SubBoardVo;

public interface SubBoardService {
    public int count(HashMap<String, Object> map);
    public List<SubBoardVo> getList(HashMap<String, Object> map);
    

    public List<String> catList(String cwhichboard);
}
