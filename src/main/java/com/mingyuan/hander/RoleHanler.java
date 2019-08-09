package com.mingyuan.hander;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.mingyuan.bean.Msg;
import com.mingyuan.entitys.Role;
import com.mingyuan.service.RoleService;

@RequestMapping("role")
@Controller
public class RoleHanler {
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("addrole")
	public String addRole(String roleName) {
		int num=roleService.insertOneRole(roleName);
		if(num==1) {
			return "role";
		}		
		return "addRole";	
	}
	
	@RequestMapping("/listRole")
	@ResponseBody
	public Msg listUsers() {	
		PageInfo<Role> pageinfo=roleService.getRoles();
		return Msg.success().addMap("PageInfo", pageinfo);
	}

}
