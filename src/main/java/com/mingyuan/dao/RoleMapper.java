package com.mingyuan.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.mingyuan.entitys.Permission;
import com.mingyuan.entitys.Role;

public interface RoleMapper {

	Integer insertOneRole(Role role);
	
	@Select("select * from roles")
	List<Role> getallRoles();
	
	/**
	 * 给角色添加权限
	 * @param roleId 角色id
	 * @param pId 权限id数组
	 * @return 受影响的行数
	 */
	Integer addRolePermission(@Param("roleId")Integer roleId,
															@Param("pIds")Integer[] pIds,
															@Param("createTime") Date time);
	
	/**
	 * 删除角色的权限
	 * @param roleId
	 * @param pIds
	 * @return受影响的行数
	 */
	Integer deleteRolePermisson(@Param("roleId")Integer roleId,
																@Param("pIds")Integer[] pIds);
	
	/**
	 * 查询该角色用于的权限
	 * @param roleId 角色id
	 * @return 权限的集合
	 */
	List<Permission> getRolePermission(Integer roleId);
	
	/**
	 * 查询该角色未获得的权限
	 * @param roleId 角色id
	 * @return 权限的集合
	 */
	List<Permission> getRoleOutPermission(Integer roleId);

}
