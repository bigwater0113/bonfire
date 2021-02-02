package com.jhta.bonfire.dao;

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
}
