package com.jhta.bonfire.vo;

import java.sql.Date;

public class FbrecommVo {

	private int idx;
	private int num;
	private int id;
	private int value;
	private Date adddate;
	
	public FbrecommVo() {}

	public FbrecommVo(int idx, int num, int id, int value, Date adddate) {
		super();
		this.idx = idx;
		this.num = num;
		this.id = id;
		this.value = value;
		this.adddate = adddate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

}
