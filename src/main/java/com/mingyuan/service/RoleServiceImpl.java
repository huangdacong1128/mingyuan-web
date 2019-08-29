package com.mingyuan.service;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mingyuan.dao.RoleMapper;
import com.mingyuan.entitys.Permission;
import com.mingyuan.entitys.Role;
import com.mingyuan.service.ex.InsertException;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleMapper roleMapper;
	
	@Override
	public Integer insertOneRole(Role roleOb) {
		roleOb.setCreateTime(new Date());
		return roleMapper.insertOneRole(roleOb);
	}
	
	@Override
	public Integer insertRolePermission(Integer roleId, Integer[] pIds) {
		Date time=new Date();
		Integer row=roleMapper.addRolePermission(roleId, pIds, time);
		if(row!=pIds.length) {
			throw new InsertException("插入权限失败");
		}
		return row;
	}

	@Override
	public Integer deleteRolePermission(Integer roleId, Integer[] pIds) {
		Integer row=roleMapper.deleteRolePermisson(roleId, pIds);
		if(row!=pIds.length) {
			throw new InsertException("删除角色权限失败");
		}
		return row;
	}

	@Override
	public PageInfo<Role> getRoles() {
		PageHelper.startPage(1,Integer.MAX_VALUE);
		List<Role> Users=roleMapper.getallRoles();
		//用PageInfo对结果进行包装
		return new PageInfo<Role>(Users,1);
	}

	@Override
	
	public List<Permission> getRolePermission(Integer roleId) {
		
		return roleMapper.getRolePermission(roleId);
	}

	@Override
	public List<Permission> getRoleOutPermission(Integer roleId) {
		
		return roleMapper.getRoleOutPermission(roleId);
	}

	

}
