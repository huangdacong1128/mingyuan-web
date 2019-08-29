package com.mingyuan.dao;

import java.util.List;

import com.mingyuan.entitys.Permission;

public interface PermissionMapper {
	
	/**
	 * 增加一个权限
	 * @param pm一个权限对象
	 * @return返回受影响的行数
	 */
	Integer addPermission(Permission pm);
	
	/**
	 * 根据权限id删除一个权限
	 * @param pId 权限id
	 * @return 受影响的行数
	 */
	Integer deletePermissionById(Integer pId);
	
	/**
	 * 更新权限的信息
	 * @param permission
	 * @return
	 */
	Integer updatePermission(Permission permission);
	
	/**
	 * 得到所有的权限信息
	 * @return
	 */
	List<Permission>  getAllPermission();
	/**
	 * 根据权限名得到的到一个权限对象
	 * @param pName  权限名
	 * @return 权限对象
	 */
	Permission getPermissionByName(String pName);
	
	
}
