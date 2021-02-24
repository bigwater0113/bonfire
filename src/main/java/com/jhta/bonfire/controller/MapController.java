package com.jhta.bonfire.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.service.LocalMapService;
import com.jhta.bonfire.service.TripPlanService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.vo.TripPlanVo;
import com.jhta.bonfire.vo.geoJsonVo;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {
    @Autowired private LocalMapService mapService;
    @Autowired private TripPlanService planService;
    Logger logger = LoggerFactory.getLogger(getClass());
    
    // private static HashMap<String, String> mapCategory = new HashMap<>();
    // static{
    //     mapCategory.put("MT1","대형마트");
    //     mapCategory.put("CS2","편의점");
    //     mapCategory.put("PS3","어린이집, 유치원");
    //     mapCategory.put("SC4","학교");
    //     mapCategory.put("AC5","학원");
    //     mapCategory.put("PK6","주차장");
    //     mapCategory.put("OL7","주유소, 충전소");
    //     mapCategory.put("SW8","지하철역");
    //     mapCategory.put("BK9","은행");
    //     mapCategory.put("CT1","문화시설");
    //     mapCategory.put("AG2","중개업소");
    //     mapCategory.put("PO3","공공기관");
    //     mapCategory.put("AT4","관광명소");
    //     mapCategory.put("AD5","숙박");
    //     mapCategory.put("FD6","음식점");
    //     mapCategory.put("CE7","카페");
    //     mapCategory.put("HP8","병원");
    //     mapCategory.put("PM9","약국");
    // }
    
    @RequestMapping(value = {"/map"})
    public String tourData(
        Model model
    ){

        return ".home.map.map";
    }

    @RequestMapping(value = {"/map/addmap"})
    @ResponseBody
    public String addmap(
        @RequestBody geoJsonVo vo
    ) {
        logger.info("vo", vo);
        HashMap<String, Object> map = new HashMap<>();
        boolean result=true;
        try{
            mapService.addMap(vo);
            logger.info("saved : ", vo);
        } catch (DuplicateKeyException|NullPointerException e) {
            logger.info("samemap, skip "+e);
            result=!result;
        }
        map.put("success", result);
        return new JSONObject(map).toJSONString();
    }

    @RequestMapping(value={"/map/addroutes"})
    @ResponseBody
    public String addroutes(
        @RequestBody List<geoJsonVo> addedMarkers
        , @AuthenticationPrincipal Authentication authentication
    ) {
        HashMap<String, Object> map = new HashMap<>();
        if (authentication==null) {
            map.put("success", false);
            map.put("reason", "user not found");
            map.put("idx", null);
        } else {
            String id = authentication.getName();
            List<TripPlanVo> plans = new ArrayList<>();
            if (CommonUtil.isNotEmpty(addedMarkers)) {
                for (int i = 0; i < addedMarkers.size(); i++) {
                    String placeid = (String) addedMarkers.get(i).getProperties().get("id");
                    plans.add(new TripPlanVo("", id, placeid, i+""));
                }
                int idx = planService.addPlan(plans);
                map.put("success", true);
                map.put("idx", idx);
                map.put("reason", "green");
            } else {
                map.put("success", false);
                map.put("reason", "plan is empty");
                map.put("idx", null);
            }
        }
        return new JSONObject(map).toJSONString();
    }

    @RequestMapping(value = {"/map/routes/{idx}"})
    @ResponseBody
    public String getroutes(
        @PathVariable int idx
    ) {
        List<geoJsonVo> savedlist = planService.getPlanMapByIdx(idx);
        JSONArray json = new JSONArray();
        json.addAll(savedlist);
        return json.toJSONString();
    }
}
