package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.dao.CatsDao;
import com.jhta.bonfire.dao.SbhitsDao;
import com.jhta.bonfire.dao.SubBoardDao;
import com.jhta.bonfire.vo.SbhitsVo;
import com.jhta.bonfire.vo.SubBoardVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class SubBoardServiceImpl implements SubBoardService{
    @Autowired private SubBoardDao subBoardDao;
	@Autowired private CatsDao catsDao;
	@Autowired private SbhitsDao sbhitsDao;
    
	@Override
	public int count(HashMap<String, Object> map) {return subBoardDao.count(map);}

	@Override
	public List<SubBoardVo> getList(HashMap<String, Object> map) {return subBoardDao.getList(map);}
    
	@Override
	public List<String> catList(String cwhichboard) {return catsDao.catList(cwhichboard);}

	@Transactional
	@Override
	public int addHit(SbhitsVo vo) {
		Logger logger = LoggerFactory.getLogger(getClass());

		logger.info("hits:"+sbhitsDao.addHit(vo));
		
		logger.info("board:"+subBoardDao.hitPlus(vo.getNum()));
		
		return 1;
	}
	@Override
	public SubBoardVo getData(int num) {
		return subBoardDao.getData(num);
	}
}
