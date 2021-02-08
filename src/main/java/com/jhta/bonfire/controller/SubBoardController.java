package com.jhta.bonfire.controller;

import java.util.HashMap;
import java.util.Optional;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.util.PageUtil;
import com.jhta.bonfire.vo.SRecommVo;
import com.jhta.bonfire.vo.SbhitsVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class SubBoardController {
    @Autowired
    private SubBoardService service;
    Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(value={"/board/{cname}/list/{page}", "/board/{cname}/list/"})
    public String getList(
        @PathVariable Optional<Integer> page, 
        @PathVariable String cname, 
        Model model, 
        @RequestParam(required = false, defaultValue = "10") int listSize, 
        @RequestParam(required = false, defaultValue = "10") int pageSize, 
        String keyword,
        String...field
    ) {
        HashMap<String, Object> map = new HashMap<>();
                
        map.put("cname", cname.equals("all")? null : cname);
        map.put("fields", field);
        map.put("keyword", keyword);
        //---count용 검색 제한 설정---
        // map.put("startRow", pu.getStartRow());
        // map.put("endRow", pu.getEndRow());
        
        PageUtil pu = new PageUtil(page.orElse(1), listSize, pageSize, service.count(map));
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
    @RequestMapping(value={"/board/{cname}/article/{num}"})
    public String getData(
        Model model, 
        @PathVariable Optional<Integer> page, 
        @PathVariable String cname, 
        @PathVariable int num, 
        @AuthenticationPrincipal Authentication authentication
    ){
        /* 조회수 ++ */
        if (authentication!=null) {
            try{
                service.addHit(new SbhitsVo(num, authentication.getName()));
            } catch (DuplicateKeyException|NullPointerException e) {logger.info("sameuser: "+e);}
            
        }
        model.addAttribute("vo", service.getData(num));
        return ".home.board.subboardview";
    }



    @RequestMapping(value={"/board/{cname}/article/{num}/recomm"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public SRecommVo recomm(
        Model model
        , @PathVariable String cname
        , @PathVariable int num
        , @RequestParam(required = false) String tglrecomm
        , @AuthenticationPrincipal Authentication authentication
    ){
        SRecommVo vo = new SRecommVo(num, null, 0, null);
        if (authentication!=null) {
            vo.setId(authentication.getName());
            vo.setValue(service.isRecommed(vo));
            if (CommonUtil.isNotEmpty(tglrecomm)) {
                vo.setValue((vo.getValue()==1)?-1:1);
                service.setRecomm(vo);
            }
        }
        return vo;
    }

}
