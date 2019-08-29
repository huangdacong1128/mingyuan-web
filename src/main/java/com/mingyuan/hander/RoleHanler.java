package com.mingyuan.hander;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.mingyuan.bean.Msg;
import com.mingyuan.entitys.Permission;
import com.mingyuan.entitys.Role;
import com.mingyuan.service.RoleService;

@RequestMapping("role")
@Controller
public class RoleHanler {
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("addrole")
	public String addRole(Role role) {
		int num=roleService.insertOneRole(role);
		if(num==1) {
			return "role";
		}		
		return "addRole";	
	}
	
	
	
	@RequestMapping("/listRole")	
	@ResponseBody
	public Msg listRole() {	
		PageInfo<Role> pageinfo=roleService.getRoles();
		return Msg.success().addMap("PageInfo", pageinfo);
	}
	
	@RequestMapping("show_role_p")
	@ResponseBody
	public Msg showRolePermission(Integer roleId) {
		List<Permission> roleP=roleService.getRolePermission(roleId);
		List<Permission> outRoleP=roleService.getRoleOutPermission(roleId);	
		
		return Msg.success().addMap("inPermission", roleP)
													.addMap("outPermission", outRoleP);
	}
	
	@RequestMapping("assignPermission")
	public String showRoleP(Integer roleId,HttpServletRequest request) {
		request.setAttribute("roleId", roleId);
		return "assignPermission";
	}
	
	@RequestMapping("add_role_p")
	@ResponseBody
	public Msg addRolePermission(Integer[] pIds,Integer roleId) {
		
		roleService.insertRolePermission(roleId, pIds);
		return Msg.success();
	}
	
	@RequestMapping("delete_role_p")
	@ResponseBody
	public Msg deleteRolePermission(Integer[] pIds,Integer roleId) {
		
		roleService.deleteRolePermission(roleId, pIds);		
		return Msg.success();
	}

}
