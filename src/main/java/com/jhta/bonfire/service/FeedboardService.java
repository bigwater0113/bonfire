package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.FeedboardDao;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Service
public class FeedboardService {
	@Autowired private FeedboardDao dao;
	
	public int count(HashMap<String,Object> map) {
		return dao.count(map);
	}
	
	public List<Feedboard_fbjoinVo> selectAll(HashMap<String,Object> map){
		return dao.selectAll(map);
	}
	
	public Feedboard_fbjoinVo selectOne(int num) {
		return dao.selectOne(num);
	}
	
}
