package com.onlineshopping.entity;

import java.io.Serializable;
import java.util.Date;

public class UserLoginLog implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5509982442376166468L;
	private int logid;
	private int userid;
	private Date time;
	private String ip;
	
	
	public int getLogid() {
		return logid;
	}
	public void setLogid(int logid) {
		this.logid = logid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
}
