package com.jhta.bonfire.vo;

public class PopularArticleHitsVo {
	private int num;
	private String id;
	private String nickname;
	private String title;
	private int hits;
	public PopularArticleHitsVo() {
		super();
	}
	public PopularArticleHitsVo(int num, String id, String nickname, String title, int hits) {
		super();
		this.num = num;
		this.id = id;
		this.nickname = nickname;
		this.title = title;
		this.hits = hits;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
