package com.jhta.bonfire.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.HomeDao;
import com.jhta.bonfire.vo.RecommAuthorVo;

@Service
public class HomeService {
	@Autowired
	private HomeDao dao;
	
	public int authorCnt() {
		return dao.authorCnt();
	}
	public RecommAuthorVo select(int selectAutor){
		return dao.select(selectAutor);
	}
}
