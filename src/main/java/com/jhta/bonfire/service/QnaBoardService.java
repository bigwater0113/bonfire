package com.jhta.bonfire.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.QnaBoardDao;
import com.jhta.bonfire.vo.QnaBoardVo;


@Service
public class QnaBoardService {
	@Autowired private QnaBoardDao dao;
	public int insert(QnaBoardVo vo) {
		return dao.insert(vo);
	}
}
