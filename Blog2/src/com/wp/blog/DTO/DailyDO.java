package com.wp.blog.DTO;

import java.sql.Timestamp;

public class DailyDO {
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public Timestamp getModifydate() {
		return modifydate;
	}
	public void setModifydate(Timestamp modifydate) {
		this.modifydate = modifydate;
	}
   String title;
   String content;
   String status;
   String note;
   Timestamp writedate;
   Timestamp modifydate; 
   
   public DailyDO()
   {
	   
   }
   
   public DailyDO(String title, String content, String status, String note, Timestamp writedate, Timestamp modifydate)
   {
	   this.title = title;
	   this.content = content;
	   this.status = status;
	   this.note = note;
	   this.writedate = writedate;
	   this.modifydate = modifydate; 
   }
}
