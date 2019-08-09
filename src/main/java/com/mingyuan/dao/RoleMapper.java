package com.mingyuan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.mingyuan.entitys.Role;

public interface RoleMapper {

	public Integer insertOneRole(Role role);
	
	@Select("select * from roles")
	public List<Role> getallRoles();

}
