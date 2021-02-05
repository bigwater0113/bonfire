package com.jhta.bonfire;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.vo.SbhitsVo;
import com.jhta.bonfire.vo.SubBoardVo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
// @WebAppConfiguration
public class TestBoard {
    // @Autowired WebApplicationContext ctx;
    @Autowired private SubBoardService service;
    Logger logger = LoggerFactory.getLogger(getClass());
    // private MockMvc mockMVC;
    // @Before
	// public void setUp() {
	// 	mockMVC = MockMvcBuilders.webAppContextSetup(ctx).build();
	// }
    HashMap<String, Object> map = new HashMap<>();
    @Before
    public void setup(){
        map.put("startRow", 1);
        map.put("endRow", 10);
        List<String> fields = new ArrayList<String>();
        fields.add("id");
        fields.add("content");

        map.put("cname", "ㅁ");
        map.put("fields",fields);
        // map.put("field", "content");
        map.put("keyword", "id");
    }
    
    @Test public void cname(){
        List<String> list = service.catList("subscriberboard");
        list.forEach(e->{
            logger.info(e.toString());
        });
        assertTrue(!list.isEmpty());
    }

    @Test public void counttest() {
        int n = service.count(map);
        logger.info("----->"+n);
        assertTrue(n==2);
    }

    @Test public void listtest(){
        List<SubBoardVo> list = service.getList(map);
        for (SubBoardVo subBoardVo : list) {
            logger.info("INFO : "+subBoardVo.toString());
        }
        logger.info("size:"+list.size());
        assertNotNull(list);
    }

    @Test public void addhittest(){
        SbhitsVo vo = new SbhitsVo(10000024, "id");
        logger.info("aaaaaa"+vo.toString());
        int n = service.addHit(vo);
        assertSame(0, n);
    }
}
