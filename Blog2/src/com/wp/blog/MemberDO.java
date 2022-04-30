package com.wp.blog;

import java.sql.Timestamp;

public class MemberDO {
  public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	
   public MemberDO()
   {
	
   }
   public MemberDO(String id, String password, String firstname, String lastname, String birthday, Timestamp joindate)
   {
	   super();
	   this.id = id;
	   this.password = password;
	   this.firstname = firstname;
	   this.lastname = lastname;
	   this.birthday = birthday; 
	   this.joindate = joindate;
   }
  
  private String id;
  private String password;
  private String firstname;
  private String lastname;
  private String birthday;
  private Timestamp joindate;
}
