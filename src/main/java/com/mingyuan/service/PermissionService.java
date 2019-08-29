package com.mingyuan.service;

import java.util.List;

import com.mingyuan.entitys.Permission;

public interface PermissionService {
	
	/**
	 * 添加一个权限
	 * @param permission 权限对象
	 * @return 返回受影响的行数
	 */
	void insertPermission(Permission permission);
	/**
	 *	获取所有的权限
	 * @return 取所有的权限集合
	 */
	List<Permission> getAllPermission();
	
	/**
	 * 更改权限信息
	 * @param permission
	 * @return 返回受影响的行数
	 */
	void changePermission(Permission permission);
	
	/**
	 * 根据权限id删除权限
	 * @param pId
	 */
	void deletePermission(Integer pId); 

}
