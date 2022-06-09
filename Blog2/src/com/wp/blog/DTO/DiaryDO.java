package com.wp.blog.DTO;

import java.sql.Timestamp;

public class DiaryDO {
   public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
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
   
   public DiaryDO(String title, String context, Timestamp savedate, Timestamp modifydate) {
	super();
	this.title = title;
	this.context = context;
	this.savedate = savedate;
	this.modifydate = modifydate;
   }
   public DiaryDO() {
	   
   }
   String title;
   String context;
   Timestamp savedate;
   Timestamp modifydate;
   
}
