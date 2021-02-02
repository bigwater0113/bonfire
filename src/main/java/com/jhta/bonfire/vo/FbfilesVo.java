package com.jhta.bonfire.vo;

public class FbfilesVo {

	private int fidx;
	private int fnum;
	private String savefilename;
	private String orgfilename;
	public FbfilesVo() {}
	public FbfilesVo(int fidx, int fnum, String savefilename, String orgfilename) {
		super();
		this.fidx = fidx;
		this.fnum = fnum;
		this.savefilename = savefilename;
		this.orgfilename = orgfilename;
	}
	public int getFidx() {
		return fidx;
	}
	public void setFidx(int fidx) {
		this.fidx = fidx;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public String getSavefilename() {
		return savefilename;
	}
	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}
	
}
