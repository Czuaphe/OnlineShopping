package com.onlineshopping.entity;

import java.io.Serializable;

public class UserCollectGoods implements Serializable {
	private int cid;
	private int userid;
	private int gid;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	
	
	
}
