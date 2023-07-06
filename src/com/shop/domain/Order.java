package com.shop.domain;

import java.util.Date;

/**
 * JavaBean:PO，字段对应order表
 * 
 *
 */
public class Order {
	private int orderId;
	private int userId;
	private double orderTotal;
	private Date createdTime;
	private  String state;
	private String address;

	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public  int getOrderId() {
		return orderId;
	}

	public String getState() {return state;}
	public void setState(String state) {this.state = state;}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
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

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ",userId=" + userId + ",orderTotal=" + orderTotal + ",createdTime="
				+ createdTime + ",state="+state+"]";
	}
}
