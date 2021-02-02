package com.jhta.bonfire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.FeedboardDao;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Service
public class FeedboardService {
	@Autowired private FeedboardDao dao;
	
	public List<Feedboard_fbjoinVo> selectAll(){
		return dao.selectAll();
	}
	
}
