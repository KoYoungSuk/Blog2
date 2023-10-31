package com.wp.blog.DTO;

import java.sql.Timestamp;

public class PDFDTO {
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
   String filename;
   Timestamp savedate;
   Timestamp modifydate;
   
   public PDFDTO() {
	   
   }
   public PDFDTO(String filename, Timestamp savedate, Timestamp modifydate) {
	   this.filename = filename;
	   this.savedate = savedate;
	   this.modifydate = modifydate; 
   }
}
