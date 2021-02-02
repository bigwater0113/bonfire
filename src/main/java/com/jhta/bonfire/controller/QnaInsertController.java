package com.jhta.bonfire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.bonfire.service.QnaBoardService;
import com.jhta.bonfire.vo.QnaBoardVo;

@Controller
public class QnaInsertController {
	@Autowired private QnaBoardService service;
	public void setService(QnaBoardService service) {
		this.service = service;
	}
	@RequestMapping(value = "qna/insert",method = RequestMethod.GET)
	public String insertForm() {
		return ".home.qna.insert";
	}
	@RequestMapping(value = "qna/insert",method = RequestMethod.POST)
	public String insert(QnaBoardVo vo,Model model) {
		service.insert(vo);
		return ".home.qna.main";
	}
}
