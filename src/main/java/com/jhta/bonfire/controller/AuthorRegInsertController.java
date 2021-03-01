package com.jhta.bonfire.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.jhta.bonfire.service.AuthorRegService;
import com.jhta.bonfire.service.FeedService;
import com.jhta.bonfire.service.MProfileService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.vo.AuthorRegVo;
import com.jhta.bonfire.vo.MProfileVo;

@Controller
public class AuthorRegInsertController {
	@Autowired AuthorRegService service;
	@Autowired MProfileService proVoService;
	@Autowired private ServletContext sc;
	
	public void setService(AuthorRegService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "authorReg/insert", method = RequestMethod.GET)
	public String insertForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		String idYes = service.exists(id);
		MProfileVo proVo = proVoService.select(id);
		if (service.exists(id) != null) {
			return "redirect:/@"+id;
		} else {
			session.setAttribute("proVo", proVo);
			session.setAttribute("feedId", id);
			return ".feed.mypage.authorRegInsert";
		}
	}
	
	@RequestMapping (value = "authorReg/insert", method = RequestMethod.POST)
	public String insert(HttpSession session, AuthorRegVo vo, @RequestParam(required = false) String... fileName) {
		vo.setIntro(CommonUtil.changePath(sc, vo.getIntro(), "authorreg", fileName));
		int n = 0;
		String id = vo.getId();
		try {
			n = service.insert(vo);
		} catch (Exception e) {
			return ".home.error";
		}
		System.out.println(id);
		
		if(n>0) {
			return "redirect:/feedboard_feed_selectAllbyId?id="+id;
		} else {
			return ".home.error";
		}
	}
}