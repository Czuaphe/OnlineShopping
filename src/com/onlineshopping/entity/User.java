package com.onlineshopping.entity;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7389516793090019333L;

	private int userid;

    private String name;

    private String pswd;

    private String email;

    private String phone;

    private String icon = "default.jpg";   // 用户头像，默认使用默认头像

    private double money = 0;  // 用户的余额，默认为0

    private int vipscore = 0;  // 用户的VIP积分，默认为0

    private int viplevel = 0;  // 表示用户的VIP等级，默认为0

    private int status = 0;    // 表示用户状态，默认为0表示正常

    
    
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getVipscore() {
		return vipscore;
	}

	public void setVipscore(int vipscore) {
		this.vipscore = vipscore;
	}

	public int getViplevel() {
		return viplevel;
	}

	public void setViplevel(int viplevel) {
		this.viplevel = viplevel;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", name=" + name + ", pswd=" + pswd + ", email=" + email + ", phone=" + phone
				+ ", icon=" + icon + ", money=" + money + ", vipscore=" + vipscore + ", viplevel=" + viplevel
				+ ", status=" + status + "]";
	}
	
	
	
    
    
}
