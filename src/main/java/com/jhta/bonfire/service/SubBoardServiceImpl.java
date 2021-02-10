package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.dao.CatsDao;
import com.jhta.bonfire.dao.SRecommDao;
import com.jhta.bonfire.dao.SbhitsDao;
import com.jhta.bonfire.dao.SubBoardDao;
import com.jhta.bonfire.vo.SRecommVo;
import com.jhta.bonfire.vo.SbhitsVo;
import com.jhta.bonfire.vo.SubBoardVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class SubBoardServiceImpl implements SubBoardService{
    @Autowired private SubBoardDao subBoardDao;
	@Autowired private CatsDao catsDao;
	@Autowired private SbhitsDao sbhitsDao;
	@Autowired private SRecommDao srecommDao;
    
	@Override
	public int count(HashMap<String, Object> map) {return subBoardDao.count(map);}

	@Override
	public List<SubBoardVo> getList(HashMap<String, Object> map) {return subBoardDao.getList(map);}
    
	@Override
	public List<String> catList(String cwhichboard) {return catsDao.catList(cwhichboard);}

	@Transactional
	@Override
	public int addHit(SbhitsVo vo) {
		sbhitsDao.addHit(vo);
		return subBoardDao.addHit(vo.getNum());
	}
	@Transactional
	@Override
	public int setRecomm(SRecommVo vo) {
		srecommDao.setRecomm(vo);
		return subBoardDao.recomm(vo);
	}

	@Override
	public SubBoardVo getData(int num) {
		return subBoardDao.getData(num);
	}
	@Override
	public int isRecommed(SRecommVo vo) {
		return srecommDao.isRecommed(vo);
	}
	@Override
	public int write(SubBoardVo vo) {
		return subBoardDao.write(vo);
	}
	
}
