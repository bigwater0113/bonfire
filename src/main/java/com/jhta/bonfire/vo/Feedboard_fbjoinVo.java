package com.jhta.bonfire.vo;

import java.sql.Date;

public class Feedboard_fbjoinVo {
  // feedboard_fbcomment_fbfiles_fbhits_fbrecommVo 
		private int num;
		private String id;
		private String title;
		private String content;
		private int recommend;
		private int hits;
		private int scrap;
		private int ispost;
		private Date postdate;
		private Date adddate;
		private String cname;
		
		private int comidx;
		private int comnum;
		private String comid;
		private String comcontent;
		private Date comadddate;
		
		private int fidx;
		private int fnum;
		private String savefilename;
		private String orgfilename;
		
		private int hnum;
		private String hid;
		
		private int ridx;
		private int rnum;
		private int rid;
		private int value;
		private Date radddate;
		
		public Feedboard_fbjoinVo() {}

		public Feedboard_fbjoinVo(int num, String id, String title, String content, int recommend, int hits, int scrap,
				int ispost, Date postdate, Date adddate, String cname, int comidx, int comnum, String comid,
				String comcontent, Date comadddate, int fidx, int fnum, String savefilename, String orgfilename,
				int hnum, String hid, int ridx, int rnum, int rid, int value, Date radddate) {
			super();
			this.num = num;
			this.id = id;
			this.title = title;
			this.content = content;
			this.recommend = recommend;
			this.hits = hits;
			this.scrap = scrap;
			this.ispost = ispost;
			this.postdate = postdate;
			this.adddate = adddate;
			this.cname = cname;
			this.comidx = comidx;
			this.comnum = comnum;
			this.comid = comid;
			this.comcontent = comcontent;
			this.comadddate = comadddate;
			this.fidx = fidx;
			this.fnum = fnum;
			this.savefilename = savefilename;
			this.orgfilename = orgfilename;
			this.hnum = hnum;
			this.hid = hid;
			this.ridx = ridx;
			this.rnum = rnum;
			this.rid = rid;
			this.value = value;
			this.radddate = radddate;
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

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public int getRecommend() {
			return recommend;
		}

		public void setRecommend(int recommend) {
			this.recommend = recommend;
		}

		public int getHits() {
			return hits;
		}

		public void setHits(int hits) {
			this.hits = hits;
		}

		public int getScrap() {
			return scrap;
		}

		public void setScrap(int scrap) {
			this.scrap = scrap;
		}

		public int getIspost() {
			return ispost;
		}

		public void setIspost(int ispost) {
			this.ispost = ispost;
		}

		public Date getPostdate() {
			return postdate;
		}

		public void setPostdate(Date postdate) {
			this.postdate = postdate;
		}

		public Date getAdddate() {
			return adddate;
		}

		public void setAdddate(Date adddate) {
			this.adddate = adddate;
		}

		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}

		public int getComidx() {
			return comidx;
		}

		public void setComidx(int comidx) {
			this.comidx = comidx;
		}

		public int getComnum() {
			return comnum;
		}

		public void setComnum(int comnum) {
			this.comnum = comnum;
		}

		public String getComid() {
			return comid;
		}

		public void setComid(String comid) {
			this.comid = comid;
		}

		public String getComcontent() {
			return comcontent;
		}

		public void setComcontent(String comcontent) {
			this.comcontent = comcontent;
		}

		public Date getComadddate() {
			return comadddate;
		}

		public void setComadddate(Date comadddate) {
			this.comadddate = comadddate;
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

		public int getHnum() {
			return hnum;
		}

		public void setHnum(int hnum) {
			this.hnum = hnum;
		}

		public String getHid() {
			return hid;
		}

		public void setHid(String hid) {
			this.hid = hid;
		}

		public int getRidx() {
			return ridx;
		}

		public void setRidx(int ridx) {
			this.ridx = ridx;
		}

		public int getRnum() {
			return rnum;
		}

		public void setRnum(int rnum) {
			this.rnum = rnum;
		}

		public int getRid() {
			return rid;
		}

		public void setRid(int rid) {
			this.rid = rid;
		}

		public int getValue() {
			return value;
		}

		public void setValue(int value) {
			this.value = value;
		}

		public Date getRadddate() {
			return radddate;
		}

		public void setRadddate(Date radddate) {
			this.radddate = radddate;
		}
		
}
