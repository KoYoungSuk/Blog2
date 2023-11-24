package com.wp.blog.DTO;

import java.sql.Timestamp;

public class SportDO {
     String title; 
     public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title; 
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
     
    public SportDO(String title, Timestamp savedate, int distance, int calories) {
    	this.title = title; 
    	this.savedate = savedate;
    	this.distance = distance;
    	this.calories = calories; 
    }
}
