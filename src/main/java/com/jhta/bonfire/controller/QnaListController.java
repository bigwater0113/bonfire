package com.jhta.bonfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaListController {
		@GetMapping("/qna/main")
		public String qnalist() {
			return ".home.qna.main";
	}
}
