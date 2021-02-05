package com.jhta.bonfire.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.QnaBoardVo;

@Repository
public class QnaBoardDao {
	@Autowired private SqlSession sqlSession;
	private static String NAMESPACE="com.jhta.bonfire.mapper.QnaBoardMapper";
	public int insert(QnaBoardVo vo) {
		return sqlSession.insert(NAMESPACE +".insert",vo);
	}
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".count",map);
	}
	public List<QnaBoardVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
}
