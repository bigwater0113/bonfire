package com.jhta.bonfire.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.FbcommentVo;
import com.jhta.bonfire.vo.FeedboardVo;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Repository
public class FeedboardDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.bonfire.mapper.FeedboardMapper";
	
	public List<Feedboard_fbjoinVo> selectAll(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectAll",map);
	}
	
	public int count(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".count",map);
	}
	
	public List<Feedboard_fbjoinVo> selectAllbyId(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectAllbyId",map);
	}
	
	public int countbyId(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".countbyId",map);
	}
	
	public int delete(int num) {
		return session.delete(NAMESPACE+".deletePosting",num);
	}
	
	public FeedboardVo selectOne(int num) {
		return session.selectOne(NAMESPACE + ".selectOne", num);
	}
	
	public List<FbcommentVo> showComm(int num) {
		return session.selectList(NAMESPACE+".showComm",num);
	}
	
	public int insertComm(FbcommentVo vo) {
		return session.insert(NAMESPACE+".insertComm",vo);
	}
}
