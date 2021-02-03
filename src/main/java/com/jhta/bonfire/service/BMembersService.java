package com.jhta.bonfire.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.bonfire.dao.BMembersDao;
import com.jhta.bonfire.security.CustomUserDetail;
import com.jhta.bonfire.vo.AuthVo;
import com.jhta.bonfire.vo.BMembersVo;

@Service
public class BMembersService {
	@Autowired 
	private PasswordEncoder encoder;
	@Autowired
	private BMembersDao dao;
	public CustomUserDetail userDetail(String id) {
		return dao.getAuthsList(id);
	}
	public int insert(BMembersVo vo) {
		String pwd=vo.getPwd();
		vo.setPwd(encoder.encode(pwd));
		dao.insert(vo);//회원테이블에 추가
		AuthVo avo=new AuthVo();
		avo.setId(vo.getId());
		if(vo.getId().equals("admin")) {
			avo.setAuthority("ROLE_ADMIN");
		}else {
			avo.setAuthority("ROLE_MEMBER");
		}
		dao.insert(avo);
		return 1;
	}
	public HashMap<String, Object> isMember(HashMap<String, String> map) {
		return dao.isMember(map);
	}
	public String searchId(HashMap<String, String> map) {
		return dao.searchId(map);
	}
	public String searchPwd(HashMap<String, String> map) {
		return dao.searchPwd(map);
	}
}
