package com.jhta.bonfire.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.HomeDao;
import com.jhta.bonfire.vo.PopularArticleHitsVo;
import com.jhta.bonfire.vo.PopularArticleRecommVo;
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
	public List<PopularArticleHitsVo> popularArticle_hits(){
		return dao.popularArticle_hits();
	}
	public List<PopularArticleRecommVo> popularArticle_recomm(){
		return dao.popularArticle_recomm();
	}
}
