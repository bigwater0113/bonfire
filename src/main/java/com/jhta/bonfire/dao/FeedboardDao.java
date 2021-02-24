package com.jhta.bonfire.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.bonfire.vo.FbcommentVo;
import com.jhta.bonfire.vo.FbrecommVo;
import com.jhta.bonfire.vo.FeedboardJoinScrapboardVo;
import com.jhta.bonfire.vo.FeedboardVo;
import com.jhta.bonfire.vo.ScrapboardVo;

@Repository
public class FeedboardDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.bonfire.mapper.FeedboardMapper";
	
	//����� �۵��
	public int addPosting(FeedboardVo vo) {
		return session.insert(NAMESPACE+".addPosting",vo);
	}
	
	//�ٷ� ����
	public int postPosting(FeedboardVo vo) {
		return session.insert(NAMESPACE+".postPosting",vo);
	}

	//�� ���� (���>��� or ��>��)
	public int modifyA(FeedboardVo vo) {
		return session.update(NAMESPACE+".modifyA",vo);
	}
	
	//�� ����(���>��)
	public int modifyB(FeedboardVo vo) {
		return session.update(NAMESPACE+".modifyB",vo);
	}
	
	//���������� - �� ���
	public List<FeedboardVo> selectAll(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectAll",map);
	}
	
	public int count(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".count",map);
	}
	
	//�ǵ� - �۰� ��� ��(����)
	public List<FeedboardVo> selectAllbyId(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectAllbyId",map);
	}
	
	public int countbyId(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".countbyId",map);
	}
	
	//�ǵ� - �۰� ���� ��
	public List<FeedboardVo> selectAllbyId2(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectAllbyId2",map);
	}
	
	public int countbyId2(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".countbyId2",map);
	}
	
	//���������� - ������ ���
	public List<FeedboardVo> selectByRegion(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".selectByRegion",map);
	}
	
	public int count2(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE+".count2",map);
	}
	
	//������� - �����ϱ�
	public int updatePostingStatus(int num) {
		return session.update(NAMESPACE+".updatePostingStatus",num);
	}
	
	//�� ����
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
	
	//�� ��������
	public FeedboardVo selectOne(int num) {
		return session.selectOne(NAMESPACE + ".selectOne", num);
	}
	
	//���
	public List<FbcommentVo> showComm(int num) {
		return session.selectList(NAMESPACE+".showComm",num);
	}
	
	public int insertComm(FbcommentVo vo) {
		return session.insert(NAMESPACE+".insertComm",vo);
	}
	
	public int deleteComm(int idx) {
		return session.delete(NAMESPACE+".deleteComm",idx);
	}
	public int editComm(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".updateComm",map);
	}
	
	//��õ
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
	
	//��ȸ��
	public HashMap<String, Object> selectHits(HashMap<String, Object> map){
		return session.selectOne(NAMESPACE+".selectHits",map);
	}
	public int insertHits(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".insertHits",map);
	}
	public int updateHits(int num) {
		return session.update(NAMESPACE+".updateHits",num);
	}
	
	//��ũ��
	public int selectScrap(int num) {
		return session.selectOne(NAMESPACE+".selectScrap",num);
	}
	public int checkScrap(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".checkScrap", map);
	}
	public int updateScrap(int num) {
		return session.update(NAMESPACE+".updateScrap",num);
	}
	public int insertScrapboard(ScrapboardVo vo) {
		return session.insert(NAMESPACE+".insertScrapboard", vo);
	}
	public int countScrap(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".countScrap",map);
	}
	public List<FeedboardJoinScrapboardVo> showScrapList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".showScrapList", map);
	}
	public int deleteScrap(HashMap<String, Object> map) {
		return session.delete(NAMESPACE+".deleteScrap", map);
	}
}
