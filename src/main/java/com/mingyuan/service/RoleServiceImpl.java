package com.mingyuan.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mingyuan.dao.RoleMapper;
import com.mingyuan.entitys.Role;
import com.mingyuan.entitys.User;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleMapper roleMapper;
	
	@Override
	public Integer insertOneRole(String roleName) {
		Role role=new Role();
		role.setRoleName(roleName);
		role.setCreateTime(new Date());
		return roleMapper.insertOneRole(role);
	}

	@Override
	public PageInfo<Role> getRoles() {
		PageHelper.startPage(1,Integer.MAX_VALUE);
		List<Role> Users=roleMapper.getallRoles();
		//用PageInfo对结果进行包装
		return new PageInfo<Role>(Users,1);
	}

}
