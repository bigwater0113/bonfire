package com.jhta.bonfire.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.security.CustomUserDetail;
import com.jhta.bonfire.vo.AuthVo;
import com.jhta.bonfire.vo.BMembersVo;

@Repository
public class BMembersDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.bonfire.mapper.BMembersMapper";
	public CustomUserDetail getAuthsList(String userid){
		return sqlSession.selectOne(NAMESPACE+".getAuths",userid);
	}
	public int insert(BMembersVo vo) {
		return sqlSession.insert(NAMESPACE+".b_insert",vo);
	}
	public int insert(AuthVo vo) {
		return sqlSession.insert(NAMESPACE+".a_insert",vo);
	}
	public HashMap<String, Object> isMember(HashMap<String, String> map){
		return sqlSession.selectOne(NAMESPACE+".isMember", map);
	}
	public String searchId(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+".searchId",map);
	}
	public String searchPwd(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+".searchPwd",map);
	}
}
