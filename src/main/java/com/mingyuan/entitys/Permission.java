package com.mingyuan.entitys;

import java.util.Date;

/**
 * 权限对应的实体类
 * @author soft01
 *
 */
public class Permission {
	private Integer pId;
	private String PName;
	private String permission;
	private Date createTime;
	
	
	
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Permission [pId=" + pId + ", PName=" + PName + ", permission=" + permission + ", createTime="
				+ createTime + "]";
	}
	
	
	
}
