package com.wp.blog.DTO;

import java.sql.Timestamp;

public class DownloadDO { 
	  public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	  int num;
	  String title;
	  String content;
	  String filename;
	  Timestamp savedate;
	  Timestamp modifydate; 
	public DownloadDO() {
		
	}
	public DownloadDO(int num, String title, String content, String filename, Timestamp savedate, Timestamp modifydate) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.savedate = savedate;
		this.modifydate = modifydate; 
	}
}
