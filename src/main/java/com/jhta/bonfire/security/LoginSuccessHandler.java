package com.jhta.bonfire.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//사용자의 id session에 넣기
		String username=request.getParameter("username");
		request.getSession().setAttribute("id",username);
		//사용자 등급? 권한?! 받아와서 넣기!
		
		
		
		//request에 무엇이 들어있을까요~?
//		
//		Map<String, String[]> map= request.getParameterMap();
//		StringBuilder sb = new StringBuilder();
//		sb.append("testfilter");
//		for(String key : map.keySet()) {
//		    sb.append("\nrequest param: "+ key);
//		    for(String value : map.get(key)) {
//		        sb.append("\tvalue: "+ value);
//		    }
//		}
//		Cookie[] cookies = request.getCookies();
//		if (cookies!=null) {
//		    for (Cookie cookie : cookies) {
//		        sb.append("\ncookie: "+cookie.getName());
//		        sb.append("\tvalue: "+cookie.getValue());
//		    }
//		}
//		Enumeration<String> attrs = request.getAttributeNames();
//		while(attrs.hasMoreElements()) {
//		    String attr = attrs.nextElement();
//		    sb.append("\nrequest Attribute : "+attr);
//		    sb.append("\tvalue: "+request.getAttribute(attr));
//		}
//		HttpSession session = request.getSession();
//		Enumeration<String> sattrs = session.getAttributeNames();
//		while(sattrs.hasMoreElements()) {
//		    String attr = sattrs.nextElement();
//		    sb.append("\nsession Attribute : "+attr);
//		    sb.append("\tvalue: "+session.getAttribute(attr));
//		}
//		System.out.println(sb.toString());
//		
		List<String> roleNames=new ArrayList<String>();	//권한이름들 담을 arraylist 그릇
		for(GrantedAuthority auth:authentication.getAuthorities()) {
			roleNames.add(auth.getAuthority());	//해당 회원 아이디의 권한 가져오기
		}
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect(request.getContextPath()+"/admin");
//		}else if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect(request.getContextPath()+"/member/main");
//		}else {
//			response.sendRedirect(request.getContextPath()+"/");
//		}
		response.sendRedirect(request.getContextPath()+"/");
	}

}
