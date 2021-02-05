package com.jhta.bonfire.dao;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.vo.SubBoardVo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubBoardDao {
    @Autowired private SqlSession sqlSession;
    private static final String NAMESPACE = "com.jhta.bonfire.mapper.SubBoardMapper";
    
    public int count(HashMap<String, Object> map) {return sqlSession.selectOne(NAMESPACE+".count", map);}
    public List<SubBoardVo> getList(HashMap<String, Object> map) {return sqlSession.selectList(NAMESPACE + ".getList", map);}
    public SubBoardVo getData(int num) {return sqlSession.selectOne(NAMESPACE+".getData", num);}
    public int hitPlus(int num) {return sqlSession.update(NAMESPACE+".hitplus", num);}
}
 