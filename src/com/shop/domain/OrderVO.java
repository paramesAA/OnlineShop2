package com.shop.domain;

/**
 * JavaBean:VO，字段对应order表与user表，通过user_id获取/显示user的account
 * 
 *
 */
import java.util.Date;

public class OrderVO {
	private int orderId;
	private String account;//username
	private double orderTotal;
	private Date createdTime;
	private String state;
	private String address;
	
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrderId() {
		return orderId;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return address;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAccount() {
		return account;
	}
	
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public double getOrderTotal() {
		return orderTotal;
	}
	
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getCreatedTime() {
		return createdTime;
	}

	public void setState (String state){this.state = state;}
	public String getState(){return state;}

	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ",account=" + account + ",orderTotal=" + orderTotal + ",createdTime="
				+ createdTime + ",state="+state+",address="+address+"]";
	}
}
