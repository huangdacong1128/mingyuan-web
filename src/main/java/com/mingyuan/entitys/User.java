package com.mingyuan.entitys;

import java.util.Date;

import javax.validation.constraints.Pattern;

public class User {
	private Integer userId;
	@Pattern(regexp="^[\\w]{2,15}$",message="用户名不合法")
	private String userName;
	@Pattern(regexp="^[\\w\u2E80-\u9FFF]{2,10}$",message="姓名不合法")
	private String lastName;
	@Pattern(regexp="^[\\w]{6,15}$",message="密码不合法")
	private String password;
	@Pattern(regexp="^[1-9][\\d]{4,10}$",message="电话不合法")
	private String phone;
	private String address;
	private Date createTime;
	private Integer isDelete;
	@Pattern(regexp="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$",message="email不合法")
	private String email;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", lastName=" + lastName + ", password=" + password
				+ ", phone=" + phone + ", address=" + address + ", createTime=" + createTime + ", isDelete=" + isDelete
				+ ", email=" + email + "]";
	}
	
	
	
}
