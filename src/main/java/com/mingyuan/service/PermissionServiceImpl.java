package com.mingyuan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mingyuan.dao.PermissionMapper;
import com.mingyuan.entitys.Permission;
import com.mingyuan.service.ex.DeleteException;
import com.mingyuan.service.ex.InsertException;
import com.mingyuan.service.ex.NameConflictException;
import com.mingyuan.service.ex.UpdateException;

@Service
public class PermissionServiceImpl implements PermissionService {
	
	@Autowired
	PermissionMapper permissionMapper;

	@Override
	public void insertPermission(Permission permission) {
		Permission result=permissionMapper.getPermissionByName(permission.getPName());
		if(result!=null) {
			throw new NameConflictException("权限名称已经存在");
		}
		Integer row=permissionMapper.addPermission(permission);
		if(row!=1) {
			throw new InsertException("插入权限异常");
		}
	}
	
	@Override
	public void changePermission(Permission permission) {
		
		Integer rows=permissionMapper.updatePermission(permission);
		if(rows!=1) {
			throw new UpdateException("更新权限异常");
		}
	}

	@Override
	public void deletePermission(Integer pId) {
		Integer rows=permissionMapper.deletePermissionById(pId);
		if(rows!=1) {
			throw new DeleteException("删除权限异常");
		}
		
	}

	@Override
	public List<Permission> getAllPermission() {	
		return permissionMapper.getAllPermission();
	}

	

}
