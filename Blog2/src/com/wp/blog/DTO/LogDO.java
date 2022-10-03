package com.wp.blog.DTO;

import java.sql.Timestamp;

public class LogDO {
	public int getLogno() {
		return logno;
	}
	public void setLogno(int logno) {
		this.logno = logno;
	}
	public Timestamp getLtime() {
		return ltime;
	}
	public void setLtime(Timestamp ltime) {
		this.ltime = ltime;
	}
	public String getComip() {
		return comip;
	}
	public void setComip(String comip) {
		this.comip = comip;
	}
	public String getComnm() {
		return comnm;
	}
	public void setComnm(String comnm) {
		this.comnm = comnm;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getExenm() {
		return exenm;
	}
	public void setExenm(String exenm) {
		this.exenm = exenm;
	}
	public int logno;
	public Timestamp ltime;
	public String comip;
	public String comnm;
	public String os;
	public String exenm; 
    public LogDO()
    {
	  
    }
    public LogDO(int logno, Timestamp ltime, String comip, String comnm, String os, String exenm)
    {
    	this.logno = logno;
    	this.ltime = ltime;
    	this.comip = comip;
    	this.comnm = comnm;
    	this.os = os;
    	this.exenm = exenm; 
    }
}
