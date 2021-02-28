package com.jhta.bonfire.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.bonfire.service.FeedboardService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.util.PageUtil;
import com.jhta.bonfire.vo.FbcommentVo;
import com.jhta.bonfire.vo.FbrecommVo;
import com.jhta.bonfire.vo.FeedboardVo;
import com.jhta.bonfire.vo.ScrapboardVo;

@Controller
public class FeedBoardController {
	@Autowired private FeedboardService service;
	@Autowired private ServletContext sc;
	
	//���ۼ� ��������
	@GetMapping("/member/feedboard_Towrite")
	public String gofeedboard_write() {
		return ".home.travelersboard.feedboardwrite";
	}
	
	//�� �ۼ�(��������)
	@PostMapping(value = "/member/feedboard_add")
    public String add(String content, String id, String title, String cname, @RequestParam(value = "ispost1", defaultValue = "0") int ispost, @RequestParam(required = false) String... fileName){
        content=CommonUtil.changePath(sc, content, "feedboard", fileName);
        String thumbnail="";
		if(fileName!=null) {
			thumbnail=fileName[0];
		}
        FeedboardVo vo=new FeedboardVo(0, id, title, content,thumbnail, 0, 0, 0, ispost, null, null, cname);
        int a=service.insertPosting(vo, ispost);
        if(a>0) {
        	return "redirect:/feedboard_feed_selectAllbyId";
        }else {
        	return ".home.travelersboard.feedboardwrite";
        }
    }
	
	//�� �ۼ�(����)
	@PostMapping(value = "/member/feedboard_post")
	public String post(String content, String id, String title, String cname, @RequestParam(value = "ispost2", defaultValue = "0") int ispost, @RequestParam(required = false) String... fileName){
		content=CommonUtil.changePath(sc, content, "feedboard", fileName);
		String thumbnail="";
		if(fileName!=null) {
			thumbnail=fileName[0];
		}
		FeedboardVo vo=new FeedboardVo(0, id, title, content,thumbnail, 0, 0, 0, ispost, null, null, cname);
		int a=service.insertPosting(vo, ispost);
		if(a>0) {
			return "redirect:/feedboard_feed_selectAllbyId";
		}else {
			return ".home.travelersboard.feedboardwrite";
		}
	}
	
	//���������� �۰� ��ü �۸��
	@RequestMapping("/feedboard_main_selectAll")
	public String selectAll(@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,Model model,HttpSession session) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		
		int listCount=service.count(map);
		PageUtil pu=new PageUtil(page, 10, 10, listCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<FeedboardVo> list=service.selectAll(map);
		session.setAttribute("feedId", "");
		session.setAttribute("feedRole", "");
		session.setAttribute("proVo","");
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword",keyword);
		return ".feed.travelersboard.side.list_main";
	}
	
	//Ư�� feedId �۸��
	@RequestMapping("/feedboard_feed_selectAllbyId")
	public String selectAllbyId(@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,Model model,HttpSession session) {
			HashMap<String,Object> map=new HashMap<String, Object>();
			String id=(String)session.getAttribute("id");
			String feedId=(String)session.getAttribute("feedId");
			map.put("id", feedId);
			map.put("field", field);
			map.put("keyword",keyword);
			
			if(id.equals(feedId)) { //�� �ǵ� ���
				int listCount=service.countbyId(map);
				PageUtil pu=new PageUtil(page, 10, 10, listCount);
				int startRow=pu.getStartRow();
				int endRow=pu.getEndRow();
				map.put("startRow",startRow);
				map.put("endRow",endRow);
				List<FeedboardVo> list=service.selectAllbyId(map);
				model.addAttribute("list",list);
				model.addAttribute("pu",pu);
				model.addAttribute("field", field);
				model.addAttribute("keyword",keyword);
				return ".feed.travelersboard.list_feed";
			}else { // Ÿ���� �� �۰��ǵ� ���
				int listCount=service.countbyId2(map);
				PageUtil pu=new PageUtil(page, 10, 10, listCount);
				int startRow=pu.getStartRow();
				int endRow=pu.getEndRow();
				map.put("startRow",startRow);
				map.put("endRow",endRow);
				List<FeedboardVo> list=service.selectAllbyId2(map);
				model.addAttribute("list",list);
				model.addAttribute("pu",pu);
				model.addAttribute("field", field);
				model.addAttribute("keyword",keyword);
				return ".feed.travelersboard.list_feed";
			}
	}
	
	//���������� - ������ ���
	@GetMapping("/feedboard_selectByRegion")
	public String selectByRegion(String cname,@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		map.put("cname",cname);
		int listCount=service.count2(map);
		PageUtil pu=new PageUtil(page, 10, 10, listCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<FeedboardVo> list=service.selectByRegion(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("cname",cname);
		model.addAttribute("field", field);
		model.addAttribute("keyword",keyword);
		return ".feed.travelersboard.side.list_main";
	}
	
	//�������� (+��ȸ��)
	@GetMapping("/feedboard_detail")
	public String selectOne(HttpSession session,int num,Model model,String recentpage) {
		String id=(String)session.getAttribute("id");
		service.insertHits(id,num);
		FeedboardVo vo=service.selectOne(num);
		model.addAttribute("vo",vo);
		if(recentpage!=null) {
			if(recentpage.equals("feed")) {
				return ".home.travelersboard.detail_feed";
			}else {
				return ".home.travelersboard.detail_main";
			}
		}else {
			return ".home.travelersboard.detail_main";
		}
	}
	
	//����������
	@GetMapping("/feedboard_goupdate")
	public String gotoUpdatePage(int num,String recentpage,Model model) {
		FeedboardVo vo=service.selectOne(num);
		model.addAttribute("vo",vo);
		model.addAttribute("recentpage",recentpage);
		return ".home.travelersboard.feedboardupdate";
	}
	
	//����(���>���)
	@PostMapping("/feedboard_mod_add")
	  public String modify_add(String recentpage,int num,String content, String id, String title, String cname, @RequestParam(value = "ispost1", defaultValue = "0") int ispost, @RequestParam(required = false) String... fileName){
        content=CommonUtil.changePath(sc, content, "feedboard", fileName);
        FeedboardVo vv=service.selectOne(num);
        String thumbnail=vv.getThumbnail();
        int rec=vv.getRecommend();
        int hits=vv.getHits();
        int scrap=vv.getScrap();
        Date adddate=vv.getAdddate();
        int judge=-1;
       	FeedboardVo vo=new FeedboardVo(num, id, title, content,thumbnail, rec, hits, scrap, ispost, adddate, null, cname);
        service.modify(vo,judge);
        System.out.println(recentpage);
        if(recentpage.equals("feed")) {
        	return "redirect:/feedboard_feed_selectAllbyId";
        }else {
        	return "redirect:/feedboard_main_selectAll";
        }
    }
	
	//����(��>��)
	@PostMapping("/feedboard_mod_postA")
	public String modify_postA(String recentpage,int num,String content, String id, String title, String cname, @RequestParam(value = "ispost2", defaultValue = "0") int ispost, @RequestParam(required = false) String... fileName){
		content=CommonUtil.changePath(sc, content, "feedboard", fileName);
		FeedboardVo vv=service.selectOne(num);
		String thumbnail=vv.getThumbnail();
		int rec=vv.getRecommend();
		int hits=vv.getHits();
		int scrap=vv.getScrap();
		Date adddate=vv.getAdddate();
		int judge=1;
		FeedboardVo vo=new FeedboardVo(num, id, title, content,thumbnail, rec, hits, scrap, ispost, adddate, null, cname);
		service.modify(vo,judge);
		 System.out.println(recentpage);
		 if(recentpage.trim().equals("feed")) {
	        	return "redirect:/feedboard_feed_selectAllbyId";
	        }else {
	        	return "redirect:/feedboard_main_selectAll";
	        }
	}
	
	//����(���>��)
	@PostMapping("/feedboard_mod_postB")
	public String modify_postB(String recentpage,int num,String content, String id, String title, String cname, @RequestParam(value = "ispost2", defaultValue = "0") int ispost, @RequestParam(required = false) String... fileName){
		content=CommonUtil.changePath(sc, content, "feedboard", fileName);
		FeedboardVo vv=service.selectOne(num);
		String thumbnail=vv.getThumbnail();
		int rec=vv.getRecommend();
		int hits=vv.getHits();
		int scrap=vv.getScrap();
		Date adddate=vv.getAdddate();
		Date postdate=vv.getPostdate();
		int judge=-1;
		FeedboardVo vo=new FeedboardVo(num, id, title, content,thumbnail, rec, hits, scrap, ispost, adddate, postdate, cname);
		service.modify(vo,judge);
		 System.out.println(recentpage);
		 if(recentpage.equals("feed")) {
	        	return "redirect:/feedboard_feed_selectAllbyId";
	        }else {
	        	return "redirect:/feedboard_main_selectAll";
	        }
	}
	
	// ispost�� ����(�� ������pg���� ���� Ŭ����)
	@GetMapping("/feedboard_changeStatus")
	public String updatePostingStatus(int num) {
		service.updatePostingStatus(num);
		return "redirect:/feedboard_feed_selectAllbyId";
	}
	
	
	//������ - ���߼��� ����
	@PostMapping("/feedboard_deleteList")
	public String delete(Model model, HttpServletRequest req) {
		String[] params=req.getParameterValues("checkk");
		int n=0;
		for(String i : params) {
			n=service.deletePosting(Integer.parseInt(i));
		}
		if(n>0) {
			return "redirect:/feedboard_main_selectAll";
		}else {
			return ".home.error";
		}
	}
	
	//�ۼ��� - ���߼��� ����
	@PostMapping("/feedboard_deleteMyList")
	public String deleteMine(Model model, HttpServletRequest req) {
		String[] params=req.getParameterValues("checkk");
		int n=0;
		for(String i : params) {
			n=service.deletePosting(Integer.parseInt(i));
		}
		if(n>0) {
			return "redirect:/feedboard_feed_selectAllbyId";
		}else {
			return ".home.error";
		}
	}
	
	//��� ǥ��
	@GetMapping(value = "/feedboard_showComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> showComm(int num,Model model) {
		List<FbcommentVo> list=service.showComm(num);
		model.addAttribute("list",list);
		return list;
	}
	
	//��� �ۼ�
	@GetMapping(value="/feedboard_insertComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> insertComm(int num, String id, String content) {
		FbcommentVo vo=new FbcommentVo(0, num, id, content, null);
		service.insertComm(vo);
		List<FbcommentVo> list=service.showComm(num);
		return list;
	}
	
	//��� ����
	@GetMapping(value="/feedboard_deleteComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> deleteComm(int num,int idx) {
		service.deleteComm(idx);
		List<FbcommentVo> list=service.showComm(num);
		return list;
	}
	//��� ����
	@GetMapping(value="/feedboard_editComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> editComm(int num,int idx,String content) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("content", content);
		service.editComm(map);
		List<FbcommentVo> list=service.showComm(num);
		return list;
	}
	
	//�� ��õ ��
	@GetMapping(value="/feedboard_showRecommTot",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> showRecommTot(int num) {
		int r=service.selectRecommTot(num);
		HashMap<String, Integer>map=new HashMap<String, Integer>();
		map.put("r",r);
		return map;
	}
	
	//��õ ���ϱ�&���
	@GetMapping(value="/feedboard_insertRecomm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> insertRecomm(int num,String id) {
		System.out.println("num:" + num);
		System.out.println("id:" + id);
		int v=service.selectRecomm(num, id);
		if(v==1) {
			FbrecommVo vo=new FbrecommVo(num, id, -1, null);
			service.insertRecomm(vo,num);
			System.out.println("��Ʈ�ѷ� ��õ ���");
		}else {
			FbrecommVo vo=new FbrecommVo(num, id, 1, null);
			service.insertRecomm(vo,num);
			System.out.println("��Ʈ�ѷ� ��õ ����");
		}
		int r=service.selectRecommTot(num);
		HashMap<String, Integer>map=new HashMap<String, Integer>();
		map.put("r",r);
		return map;
	}
	
	//�� ��ũ�� ��
		@GetMapping(value="/feedboard_selectScrap",produces = "application/xml;charset=utf-8")
		@ResponseBody
		public HashMap<String, Integer> selectScrap(int num) {
			int s=service.selectScrap(num);
			HashMap<String, Integer>map=new HashMap<String, Integer>();
			map.put("s",s);
			return map;
		}
	//��ũ�� �ϱ�
		@GetMapping(value="/feedboard_insertScrapboard",produces = "application/xml;charset=utf-8")
		@ResponseBody
		public HashMap<String, Object> insertScrapboard(int num,String id) {
			int checkScrap=service.checkScrap(num,id);
			if(checkScrap == 0) {
				service.updateScrap(num);
				ScrapboardVo vo=new ScrapboardVo(id, num, null);
				service.insertScrapboard(vo);
				int s=service.selectScrap(num);
				HashMap<String, Object>map=new HashMap<String, Object>();
				map.put("msg","success");
				map.put("s",s);
				return map;
			}else {
				int s=service.selectScrap(num);
				HashMap<String, Object>map=new HashMap<String, Object>();
				map.put("msg","fail");
				map.put("s",s);
				return  map;
			}
		}
}
