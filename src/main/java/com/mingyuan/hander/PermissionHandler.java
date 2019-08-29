package com.mingyuan.hander;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mingyuan.bean.Msg;
import com.mingyuan.entitys.Permission;
import com.mingyuan.service.PermissionService;

@RequestMapping("pm")
@Controller
public class PermissionHandler {
	
	@Autowired
	PermissionService pmService;
	
	@RequestMapping("show_all_p")
	@ResponseBody
	public Msg getAllPermission() {
		List<Permission> permissions=pmService.getAllPermission();
		return Msg.success().addMap("permission", permissions);
	}
	
	@RequestMapping("show_permission")
	public String showAllPermission() {
		return "permission";
	}
	
	@RequestMapping("add_permission")
	@ResponseBody
	public Msg addPermission(Permission permission) {
		pmService.insertPermission(permission);
		return Msg.success();
	}
	
	@RequestMapping("delete_permission")
	@ResponseBody
	public Msg deletePermission(Integer pId) {
		pmService.deletePermission(pId);
		return Msg.success();	
	}
	
	@RequestMapping("update_permission")
	@ResponseBody
	public Msg updatePermission(Permission permission) {
		pmService.changePermission(permission);
		return Msg.success();
	}
}
