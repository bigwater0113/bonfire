package com.jhta.bonfire.controller;

import java.util.HashMap;
import java.util.Optional;

import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.util.PageUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubBoardController {
    @Autowired
    private SubBoardService service;
    Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(value = "/board/{cname}")
    public String getList
    (
        @PathVariable String cname, 
        Model model, 
        @RequestParam(required = false, defaultValue = "10") int listSize, 
        @RequestParam(required = false, defaultValue = "10") int pageSize, 
        String keyword,
        String...field
    ) 
    {return getList(Optional.of(1), cname, model, listSize, pageSize, keyword, field);}
    
    // @RequestMapping(value = "/board/all")
    // public String getList
    // (
    //     Model model, 
    //     @RequestParam(required = false, defaultValue = "10") int listSize, 
    //     @RequestParam(required = false, defaultValue = "10") int pageSize, 
    //     String keyword,
    //     String...field
    // ) 
    // {return getList(Optional.of(1), null, model, listSize, pageSize, keyword, field);}


    // @RequestMapping(value="/board/all/{page}")
    // // public String getList(@PathVariable Optional<Integer> page, @PathVariable String cname, HashMap<String, Object> map, Model model) {
    // public String getList(
    //     @PathVariable Optional<Integer> page, 
    //     Model model, 
    //     @RequestParam(required = false, defaultValue = "10") int listSize, 
    //     @RequestParam(required = false, defaultValue = "10") int pageSize, 
    //     String keyword,
    //     String...field
    // ) 
    // {return getList(page, null, model, listSize, pageSize, keyword, field);}


    @RequestMapping(value="/board/{cname}/{page}")
    // public String getList(@PathVariable Optional<Integer> page, @PathVariable String cname, HashMap<String, Object> map, Model model) {
    public String getList(
        @PathVariable Optional<Integer> page, 
        @PathVariable String cname, 
        Model model, 
        @RequestParam(required = false, defaultValue = "10") int listSize, 
        @RequestParam(required = false, defaultValue = "10") int pageSize, 
        String keyword,
        String...field
        ) 
    {
        HashMap<String, Object> map = new HashMap<>();
                
        map.put("cname", cname.equals("all")? null : cname);
        map.put("fields", field);
        map.put("keyword", keyword);
        //---count용 검색 제한 설정---
        // map.put("startRow", pu.getStartRow());
        // map.put("endRow", pu.getEndRow());
        
        PageUtil pu = new PageUtil(page.orElse(1), listSize, pageSize, service.count(map));
        // PageUtil pu = new PageUtil(page.isPresent()?page.get():1, listSize, pageSize, service.count(map));
        map.put("startRow", pu.getStartRow());
        map.put("endRow", pu.getEndRow());
        logger.debug("keyword : "+keyword);
        
        
        model.addAttribute("page", page.orElse(1));
        model.addAttribute("fields", field);
        model.addAttribute("keyword", keyword);
        model.addAttribute("list", service.getList(map));
        model.addAttribute("pu", pu);
        String beforeparams="?";
        if (CommonUtil.isNotEmpty(field)){
            for (String string : field) {beforeparams+="field="+string+"&";}
        }
        beforeparams+="keyword="+keyword+"&listSize="+listSize+"&pageSize="+pageSize;
        model.addAttribute("beforeparams", beforeparams);
        return ".home.board.subboard";
    }
}
