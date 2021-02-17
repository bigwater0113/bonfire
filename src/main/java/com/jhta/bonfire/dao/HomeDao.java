package com.jhta.bonfire.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.RecommAuthorVo;


@Repository
public class HomeDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.bonfire.mapper.HomeMapper";
	
	public int authorCnt() {
		return sqlSession.selectOne(NAMESPACE+".authorCnt");
	}
	public RecommAuthorVo select(int selectAutor){
		return sqlSession.selectOne(NAMESPACE+".select",selectAutor);
	}
}
