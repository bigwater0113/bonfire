package com.jhta.bonfire;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.vo.SubBoardVo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
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
    
    
    @Test
    public void cname(){
        List<String> list = service.catList("자유");
        assertTrue(!list.isEmpty());
    }

    @Test
    public void test() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("startRow", 1);
        map.put("endRow", 10);
        List<SubBoardVo> list = service.getList(map);
        list.forEach(e->{
            logger.info(e.toString());
        });
        assertTrue(!list.isEmpty());
    }
}
