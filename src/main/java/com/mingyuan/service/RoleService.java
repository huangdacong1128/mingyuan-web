package com.mingyuan.service;

import com.github.pagehelper.PageInfo;
import com.mingyuan.entitys.Role;

public interface RoleService {

	Integer insertOneRole(String roleName);

	PageInfo<Role> getRoles();

}
