package com.jhta.bonfire.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.BMembersVo;

@Repository
public class BMembersDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.bonfire.mapper.BMembersMapper";
	public int insert(BMembersVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
}
