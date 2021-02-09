package com.jhta.bonfire.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.FeedboardDao;
import com.jhta.bonfire.vo.FbcommentVo;
import com.jhta.bonfire.vo.FbrecommVo;
import com.jhta.bonfire.vo.FeedboardVo;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Service
public class FeedboardService {
	@Autowired private FeedboardDao dao;
	
	public int count(HashMap<String,Object> map) {
		return dao.count(map);
	}
	
	public List<Feedboard_fbjoinVo> selectAll(HashMap<String,Object> map){
		return dao.selectAll(map);
	}
	
	public int countbyId(HashMap<String,Object> map) {
		return dao.countbyId(map);
	}
	
	public List<Feedboard_fbjoinVo> selectAllbyId(HashMap<String,Object> map){
		return dao.selectAllbyId(map);
	}
	
	public int deletePosting(int num) {
		dao.deletePostingA(num);
		dao.deletePostingB(num);
		dao.deletePostingC(num);
		dao.deletePostingD(num);
		dao.deletePostingE(num);
		int f=dao.deletePostingF(num);
		return f;
	}

	public FeedboardVo selectOne(int num) {
		return dao.selectOne(num);
	}
	
	public List<FbcommentVo> showComm(int num){
		return dao.showComm(num);
	}
	
	public int insertComm(FbcommentVo vo) {
		return dao.insertComm(vo);
	}
	
	public int deleteComm(int idx) {
		return dao.deleteComm(idx);
	}
	
	public int selectRecomm(int num,String id) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("id",id);
		return dao.selectRecomm(map);
	}
	
	public int selectRecommTot(int num) {
		return dao.selectRecommTot(num);
	}
	public int insertRecomm(FbrecommVo vo,int num) {
		int a=dao.insertRecomm(vo);
		int b=0;
		if(vo.getValue()==1) {
			System.out.println("서비스 추천 누름");
			b=dao.updateRecomm(num);
		}else {
			System.out.println("서비스 추천 취소");
			b=dao.cancelRecomm(num);
		}
		if(a>0 && b>0) {
			return b;
		}else {
			return -1;
		}
	}
	public int insertHits(String id, int num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", num);
		HashMap<String, Object> map1=dao.selectHits(map);
		if(map1==null) {
			int a=dao.insertHits(map);
			int b=dao.updateHits(num);
			if(a>0 && b>0) { 
				return b;
			}else {
				return -1;
			}
		}else {
			return -1;
		}
	}
}
