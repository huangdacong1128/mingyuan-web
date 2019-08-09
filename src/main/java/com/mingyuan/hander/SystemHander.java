package com.mingyuan.hander;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemHander {
 
	@RequestMapping("showLogin")
	public String showLogin() {
		return "login";
	}
	@RequestMapping("showReg")
	public String showReg() {
		return "reg";
	}
	@RequestMapping("showMain")
	@RequiresAuthentication
	public String showMain() {
		return "main";
	}
	@RequestMapping("addRole")
	@RequiresAuthentication
	public String showAddRole() {
		return "addRole";
	}
}
