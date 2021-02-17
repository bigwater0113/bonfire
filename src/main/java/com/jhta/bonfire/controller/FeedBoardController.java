package com.jhta.bonfire.controller;

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
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Controller
public class FeedBoardController {
	@Autowired private FeedboardService service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/member/feedboard_Towrite")
	public String gofeedboard_write() {
		return ".home.travelersboard.feedboardwrite";
	}
	
	@PostMapping(value = "/member/feedboard_write")
    public String write(String content, @RequestParam(value="writer") String id, String title, String cname, @RequestParam(value = "ispost1", defaultValue = "0") int ispost1,@RequestParam(value = "ispost1", defaultValue = "0") int ispost2, @RequestParam(required = false) String... fileName){
        int ispost=0;
        if(ispost1!=0) {
        	ispost = ispost1;
        }else if(ispost2!=0) {
        	ispost = ispost2;
        }
        content=CommonUtil.changePath(sc, content, "feedboard", fileName);
        FeedboardVo vo=new FeedboardVo(0, id, title, content, 0, 0, 0, ispost, null, null, cname);
        int a=service.insertPosting(vo, ispost);
        if(a>0) {
        	return "redirect:/feedboard_feed_selectAllbyId";
        }else {
        	return ".home.travelersboard.feedboardwrite";
        }
    }
	
	@RequestMapping("/feedboard_main_selectAll")
	public String selectAll(@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		int listCount=service.count(map);
		PageUtil pu=new PageUtil(page, 10, 10, listCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<Feedboard_fbjoinVo> list=service.selectAll(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword",keyword);
		return ".feed.travelersboard.side.list_main";
	}
	
	//특정 feedId 글목록
	@RequestMapping("/feedboard_feed_selectAllbyId")
	public String selectAllbyId(@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,String id,Model model,HttpSession session) {
			HashMap<String,Object> map=new HashMap<String, Object>();
			map.put("id", id);
			map.put("field", field);
			map.put("keyword",keyword);
			int listCount=service.countbyId(map);
			PageUtil pu=new PageUtil(page, 10, 10, listCount);
			int startRow=pu.getStartRow();
			int endRow=pu.getEndRow();
			map.put("startRow",startRow);
			map.put("endRow",endRow);
			
			List<Feedboard_fbjoinVo> list=service.selectAllbyId(map);
			model.addAttribute("list",list);
			model.addAttribute("pu",pu);
			model.addAttribute("field", field);
			model.addAttribute("keyword",keyword);
			return ".feed.travelersboard.list_feed";
	}
	
	@GetMapping("/feedboard_detail")
	public String selectOne(String id,int num,Model model) {
		service.insertHits(id,num);
		FeedboardVo vo=service.selectOne(num);
		model.addAttribute("vo",vo);
		return ".home.travelersboard.detail_main";
	}
	
	
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
	
	@GetMapping(value = "/feedboard_showComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> showComm(int num,Model model) {
		List<FbcommentVo> list=service.showComm(num);
		model.addAttribute("list",list);
		return list;
	}
	
	@GetMapping(value="/feedboard_insertComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> insertComm(int num, String id, String content) {
		FbcommentVo vo=new FbcommentVo(0, num, id, content, null);
		service.insertComm(vo);
		List<FbcommentVo> list=service.showComm(num);
		return list;
	}
	@GetMapping(value="/feedboard_deleteComm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public List<FbcommentVo> deleteComm(int num,int idx) {
		service.deleteComm(idx);
		List<FbcommentVo> list=service.showComm(num);
		return list;
	}
	
	@GetMapping(value="/feedboard_showRecommTot",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> showRecommTot(int num) {
		int r=service.selectRecommTot(num);
		HashMap<String, Integer>map=new HashMap<String, Integer>();
		map.put("r",r);
		return map;
	}
	
	@GetMapping(value="/feedboard_insertRecomm",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> insertRecomm(int num,String id) {
		System.out.println("num:" + num);
		System.out.println("id:" + id);
		int v=service.selectRecomm(num, id);
		if(v==1) {
			FbrecommVo vo=new FbrecommVo(num, id, -1, null);
			service.insertRecomm(vo,num);
			System.out.println("컨트롤러 추천 취소");
		}else {
			FbrecommVo vo=new FbrecommVo(num, id, 1, null);
			service.insertRecomm(vo,num);
			System.out.println("컨트롤러 추천 누름");
		}
		int r=service.selectRecommTot(num);
		HashMap<String, Integer>map=new HashMap<String, Integer>();
		map.put("r",r);
		return map;
	}
}
