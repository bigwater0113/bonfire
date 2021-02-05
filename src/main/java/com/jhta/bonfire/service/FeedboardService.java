package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.FeedboardDao;
import com.jhta.bonfire.vo.FbcommentVo;
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
	
	public int countbyId(HashMap<String,Object> map) {
		return dao.countbyId(map);
	}
	
	public List<Feedboard_fbjoinVo> selectAllbyId(HashMap<String,Object> map){
		return dao.selectAllbyId(map);
	}
	
	public int delete(int num) {
		return dao.delete(num);
	}

	public Feedboard_fbjoinVo selectOne(int num) {
		return dao.selectOne(num);
	}
	
	public List<FbcommentVo> showComm(int num){
		return dao.showComm(num);
	}
	
}
