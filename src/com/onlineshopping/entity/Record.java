package com.onlineshopping.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Record implements Serializable {
	
	private int rid;
	private String recnum;
	private Timestamp time;
	private int userid;
	private double total;
	private int addscore;
	private int status;
	private double freight;
	private int payway;
	private int express;
	private int uaid;
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRecnum() {
		return recnum;
	}
	public void setRecnum(String recnum) {
		this.recnum = recnum;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getAddscore() {
		return addscore;
	}
	public void setAddscore(int addscore) {
		this.addscore = addscore;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public double getFreight() {
		return freight;
	}
	public void setFreight(double freight) {
		this.freight = freight;
	}
	public int getPayway() {
		return payway;
	}
	public void setPayway(int payway) {
		this.payway = payway;
	}
	public int getExpress() {
		return express;
	}
	public void setExpress(int express) {
		this.express = express;
	}
	public int getUaid() {
		return uaid;
	}
	public void setUaid(int uaid) {
		this.uaid = uaid;
	}
	@Override
	public String toString() {
		return "Record [rid=" + rid + ", recnum=" + recnum + ", time=" + time + ", userid=" + userid + ", total="
				+ total + ", addscore=" + addscore + ", status=" + status + ", freight=" + freight + ", payway="
				+ payway + ", express=" + express + ", uaid=" + uaid + "]";
	}
	
	
	
}
