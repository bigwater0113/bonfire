package com.jhta.bonfire.controller;

import java.util.HashMap;
import java.util.OptionalInt;

import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.util.PageUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SubBoardController {
    @Autowired private SubBoardService service;
    @RequestMapping(value="/board/{cname}/{page}")
    public String getList(@PathVariable OptionalInt page, @PathVariable String cname, HashMap<String, Object> map, Model model) {
        int listSize=(map.get("listSize")!=null)? (int) map.get("listSize") :10;
        int pageSize=(map.get("pageSize")!=null)? (int) map.get("pageSize") :10;
       
        PageUtil pu = new PageUtil(page.isPresent()?page.getAsInt():1, listSize, pageSize, service.count(map));
        map.put("startRow", pu.getStartRow());
        map.put("endRow", pu.getEndRow());
        model.addAttribute("field", map.get("field"));
        model.addAttribute("keyword", map.get("keyword"));
        model.addAttribute("list", service.getList(map));
        model.addAttribute("pu", pu);
        return ".home.board.subboard";
    }
}
