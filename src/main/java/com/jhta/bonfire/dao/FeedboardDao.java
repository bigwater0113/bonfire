package com.jhta.bonfire.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.FbcommentVo;
import com.jhta.bonfire.vo.FbrecommVo;
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
	
	public int deletePostingA(int num) {
		return session.delete(NAMESPACE+".deletePostingA",num);
	}
	public int deletePostingB(int num) {
		return session.delete(NAMESPACE+".deletePostingB",num);
	}
	public int deletePostingC(int num) {
		return session.delete(NAMESPACE+".deletePostingC",num);
	}
	public int deletePostingD(int num) {
		return session.delete(NAMESPACE+".deletePostingD",num);
	}
	public int deletePostingE(int num) {
		return session.delete(NAMESPACE+".deletePostingE",num);
	}
	public int deletePostingF(int num) {
		return session.delete(NAMESPACE+".deletePostingF",num);
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
	
	public int deleteComm(int idx) {
		return session.delete(NAMESPACE+".deleteComm",idx);
	}
	
	public int insertRecomm(FbrecommVo vo) {
		return session.insert(NAMESPACE+".insertRecomm",vo);
	}
	public int updateRecomm(int num) {
		return session.update(NAMESPACE+".updateRecomm",num);
	}
	public int cancelRecomm(int num) {
		return session.update(NAMESPACE+".cancelRecomm",num);
	}
	public int selectRecomm(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".selectRecomm",map);
	}
	public int selectRecommTot(int num) {
		return session.selectOne(NAMESPACE+".selectRecommTot",num);
	}
}
