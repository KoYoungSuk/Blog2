package com.wp.blog.DTO;

import java.sql.Timestamp;

public class BoardDO {
    String content1;
    String anonymous;
    public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	int clicks;
    public String getAnonymous() {
		return anonymous;
	}
	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}
	public int getSerialnumber() {
		return serialnumber;
	}
	public void setSerialnumber(int serialnumber) {
		this.serialnumber = serialnumber;
	}
	int serialnumber;
    public BoardDO() {
    	
    }
    public BoardDO(int serial, String title, String userid, String content, Timestamp savedate, Timestamp modifydate, String anonymous, int clicks)
    {
    	super();
    	this.serialnumber = serial;
    	this.title = title;
    	this.content1 = content;
    	this.userid = userid;
    	this.savedate = savedate;
    	this.modifydate = modifydate;
    	this.anonymous = anonymous;
    	this.clicks = clicks;
    }
    public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public Timestamp getModifydate() {
		return modifydate;
	}
	public void setModifydate(Timestamp modifydate) {
		this.modifydate = modifydate;
	}
	
	String title;
    String userid;
    Timestamp savedate;
    Timestamp modifydate;
    
    
}
