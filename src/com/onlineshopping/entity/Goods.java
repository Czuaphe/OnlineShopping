package com.onlineshopping.entity;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable {
	
	private int gid;
	private String name;
	private String details;
	private double price;
	private int numbers;
	private double discount;
	private Date time;
	private int type;
	private String picpath;
	
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getPicpath() {
		return picpath;
	}
	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", name=" + name + ", details=" + details + ", price=" + price + ", numbers="
				+ numbers + ", discount=" + discount + ", time=" + time + ", type=" + type + ", picpath=" + picpath
				+ "]";
	}
	
	
	
	
}
