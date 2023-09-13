package com.wp.blog.DTO;

import java.sql.Timestamp;

public class InfoDO {
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
   String content;
   Timestamp savedate;
   Timestamp modifydate; 
   public InfoDO()
   {
	   
   }
   public InfoDO(String title, String content, Timestamp savedate, Timestamp modifydate)
   {
	   this.title = title;
	   this.content = content;
	   this.savedate = savedate;
	   this.modifydate = modifydate; 
   }
}
