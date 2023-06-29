package com.wp.blog.DTO;

import java.sql.Timestamp;

public class SwitchDO {
   public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public String getEx() {
		return ex;
	}
	public void setEx(String ex) {
		this.ex = ex;
	}
   int num;
   String status;
   Timestamp savedate;
   String ex; 
   public SwitchDO()
   {
	   
   }
   public SwitchDO(int num, String status, Timestamp savedate, String ex)
   {
	   this.num = num;
	   this.status = status;
	   this.savedate = savedate;
	   this.ex = ex; 
   }
}
