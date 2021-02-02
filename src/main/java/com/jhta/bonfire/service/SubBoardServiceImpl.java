package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.dao.CatsDao;
import com.jhta.bonfire.dao.SubBoardDao;
import com.jhta.bonfire.vo.SubBoardVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SubBoardServiceImpl implements SubBoardService{
    @Autowired private SubBoardDao subBoardDao;
    @Autowired private CatsDao catsDao;
    
	@Override
	public int count(HashMap<String, Object> map) {return subBoardDao.count(map);}

	@Override
	public List<SubBoardVo> getList(HashMap<String, Object> map) {return subBoardDao.getList(map);}
    
	@Override
    public List<String> catList(String cwhichboard) {return catsDao.catList(cwhichboard);}
}
