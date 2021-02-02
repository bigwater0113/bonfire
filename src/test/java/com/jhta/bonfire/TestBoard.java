package com.jhta.bonfire;

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jhta.bonfire.service.SubBoardService;
import com.jhta.bonfire.vo.SubBoardVo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestBoard {
    @Autowired
    private SubBoardService service;
    Logger logger = LoggerFactory.getLogger(getClass());

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
