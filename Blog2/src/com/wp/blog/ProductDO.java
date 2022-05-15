package com.wp.blog;

public class ProductDO {
   public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_date_used() {
		return buy_date_used;
	}
	public void setBuy_date_used(String buy_date_used) {
		this.buy_date_used = buy_date_used;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
   String product_no;
   public ProductDO(String product_no, String product_name, String buy_date, String buy_date_used, String purpose) {
	  super();
	  this.product_no = product_no;
	  this.product_name = product_name;
	  this.buy_date = buy_date;
	  this.buy_date_used = buy_date_used;
	  this.purpose = purpose;
    }
    public ProductDO() {
	   
   }
   String product_name;
   String buy_date;
   String buy_date_used;
   String purpose;
}
