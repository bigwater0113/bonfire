package com.jhta.bonfire.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.bonfire.service.HomeService;
import com.jhta.bonfire.vo.PopularArticleHitsVo;
import com.jhta.bonfire.vo.PopularArticleRecommVo;
import com.jhta.bonfire.vo.RecommAuthorVo;

@Controller
public class HomeController {
	@Autowired
	private HomeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
//		String cp=req.getContextPath();
//		req.getSession().getServletContext().setAttribute("cp", cp);
		return ".home";
	}
	
	@GetMapping(value="/recommAuthor",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public List<RecommAuthorVo> recommAuthor(){
		List<RecommAuthorVo> list=new ArrayList<RecommAuthorVo>();
		int Cnt=service.authorCnt();
		int viewCnt=12;
		if(Cnt<12) {
			viewCnt=1;
		}
		boolean matchCnt=false;
		int[] selectAuthors=new int[viewCnt];
		for(int i=0;i<viewCnt;i++) {
			matchCnt=false;
			int num=(int)(Math.random()*Cnt)+1;
			for(int j=0;j<viewCnt;j++) {
				if(selectAuthors[j]==num) matchCnt=true;
			}
			if(matchCnt) {
				i--;
				continue;
			}
			selectAuthors[i]=num;
		}
		for(int selectAuthor:selectAuthors) {
			list.add(service.select(selectAuthor));
		}
		return list;
	}
	@GetMapping(value="/popularArticle_hits",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public List<PopularArticleHitsVo> popularArticle_hits(){
		List<PopularArticleHitsVo> list=service.popularArticle_hits();
		return list;
	}
	@GetMapping(value="/popularArticle_recomm",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public List<PopularArticleRecommVo> popularArticle_recomm(){
		List<PopularArticleRecommVo> list=service.popularArticle_recomm();
		return list;
	}
}
