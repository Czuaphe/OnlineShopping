package com.onlineshopping.entity;

import java.io.Serializable;

public class RecordDetails implements Serializable {
	
	private int rdid;
	private int rid;
	private int gid;
	private int numbers;
	private double buyprice;
	
	
	
	public int getRdid() {
		return rdid;
	}
	public void setRdid(int rdid) {
		this.rdid = rdid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public double getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(double buyprice) {
		this.buyprice = buyprice;
	}
	@Override
	public String toString() {
		return "RecordDetails [rdid=" + rdid + ", rid=" + rid + ", gid=" + gid + ", numbers=" + numbers + ", buyprice="
				+ buyprice + "]";
	}
	
	
	
}
