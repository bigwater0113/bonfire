package com.jhta.bonfire.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.jhta.bonfire.vo.AuthVo;


public class CustomUserDetail implements UserDetails{ //������ü
	private String id;
	private String pwd;
	private String enabled;
	private List<AuthVo> authoList;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {	//�ش� ȸ���� ���ѵ��� �ҷ��´�.
		ArrayList<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();	//collection �� �ڽ� arraylist�� return
		for(AuthVo vo:authoList) {										//���� for������ ���ѵ��� vo��ü���� �����ͼ� auths arraylist�� �����
			auths.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		return auths;
	}

	@Override
	public String getPassword() {//password = pwd �츮���� �÷���
		return pwd;
	}

	@Override
	public String getUsername() {	//username = id �츮���� �÷���
		return id;
	}

	@Override
	public boolean isAccountNonExpired() { //������ ����Ǿ����� ��������ʾҴ���
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { // ������ ����ִ���
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	} 
	
}
