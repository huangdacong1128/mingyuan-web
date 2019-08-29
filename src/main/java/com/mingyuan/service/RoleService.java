package com.mingyuan.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.mingyuan.entitys.Permission;
import com.mingyuan.entitys.Role;

public interface RoleService {

	Integer insertOneRole(Role role);
	
	/**
	 * 给角色添加权限
	 * @param roleId 角色id
	 * @param pId 权限id数组
	 * @return 受影响的行数
	 */
	Integer insertRolePermission(Integer roleId,Integer[] pIds);
	
	/**
	 * 删除角色的权限
	 * @param roleId
	 * @param pIds
	 * @return 受影响的行数
	 */	
	Integer deleteRolePermission(Integer roleId,Integer[] pIds);

	PageInfo<Role> getRoles();
	
	/**
	 * 获取角色拥有的权限
	 * @param roleId角色的id
	 * @return 权限的集合
	 */	
	List<Permission> getRolePermission(Integer roleId);
	
	
	/**
	 * 获取角色不拥有的权限
	 * @param roleId角色的id
	 * @return 权限的集合
	 */
	List<Permission> getRoleOutPermission(Integer roleId);
	
	
}
