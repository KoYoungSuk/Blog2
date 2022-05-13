package com.wp.blog;

public class DTO {
   public String getDbdriver() {
		return dbdriver;
	}
	public void setDbdriver(String dbdriver) {
		this.dbdriver = dbdriver;
	}
	public String getDburl() {
		return dburl;
	}
	public void setDburl(String dburl) {
		this.dburl = dburl;
	}
	public String getDbid() {
		return dbid;
	}
	public void setDbid(String dbid) {
		this.dbid = dbid;
	}
	public String getDbpw() {
		return dbpw;
	}
	public void setDbpw(String dbpw) {
		this.dbpw = dbpw;
	}
	public DTO() {
		
	}
   public String dbdriver;
   public String dburl;
   public String dbid;
   public String dbpw;
}
