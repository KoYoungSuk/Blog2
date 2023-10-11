package com.wp.blog.DTO;

import java.sql.Timestamp;

public class SportDO {
     int num;
     public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	Timestamp savedate;
     int distance;
     int calories; 
     
    public SportDO() {
    	
    }
     
    public SportDO(int num, Timestamp savedate, int distance, int calories) {
    	this.num = num;
    	this.savedate = savedate;
    	this.distance = distance;
    	this.calories = calories; 
    }
}
