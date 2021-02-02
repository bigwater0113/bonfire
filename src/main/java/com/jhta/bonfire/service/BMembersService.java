package com.jhta.bonfire.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.BMembersDao;
import com.jhta.bonfire.vo.BMembersVo;

@Service
public class BMembersService {
	@Autowired
	private BMembersDao dao;
	public int insert(BMembersVo vo) {
		return dao.insert(vo);
	}
	public HashMap<String, Object> isMember(HashMap<String, String> map) {
		return dao.isMember(map);
	}
}
