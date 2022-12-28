package com.wp.blog.DTO;

import java.sql.Timestamp;

public class VideoDO {
   public String getID() {
		return ID;
	}
	public void setID(String iD) {
		this.ID = iD;
	}
    public int getNumber() {
			return number;
    }
	public void setNumber(int number) {
		this.number = number; 
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVideoname() {
		return videoname;
	}
	public void setVideoname(String videoname) {
		this.videoname = videoname;
	}
	public String getThumbnailname() {
		return thumbnailname;
	}
	public void setThumbnailname(String thumbnailname) {
		this.thumbnailname = thumbnailname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
   public String ID;
   public String title;
   public String videoname;
   public String thumbnailname;
   public String description;
   public String author;
   public int number;
   
   public String getAuthor() {
	return author;
   }
public void setAuthor(String author) {
	this.author = author;
}

public Timestamp date;
   
   public VideoDO()
   {
	   
   }
   
   public VideoDO(int number, String ID, String title, String videoname, String thumbnailname, String description, String author, Timestamp date)
   {
	   this.number = number;
	   this.ID = ID;
	   this.title = title;
	   this.videoname = videoname; 
	   this.thumbnailname = thumbnailname; 
	   this.description = description;
	   this.author = author;
	   this.date = date; 
   }
}
