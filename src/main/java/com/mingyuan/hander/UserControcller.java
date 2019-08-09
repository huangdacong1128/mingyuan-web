package com.mingyuan.hander;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.mingyuan.bean.Msg;
import com.mingyuan.entitys.Role;
import com.mingyuan.entitys.User;
import com.mingyuan.service.UserService;




@RequestMapping("user")
@Controller
public class UserControcller extends BaseHandler {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("login")
	public String userLogin(@RequestParam("password") String password, 
														@RequestParam("username") String username,
														HttpServletRequest request) {
		if (username != null && password != null) {
			userService.login(username,password);
			Subject currentUser = SecurityUtils.getSubject();
			if (!currentUser.isAuthenticated()) {
				// 把用户名和密码封装为 UsernamePasswordToken 对象
				UsernamePasswordToken token = new UsernamePasswordToken(username, password);
				token.setRememberMe(true);
				try {
					// 执行登录.
					currentUser.login(token);
				}catch (AuthenticationException ae) {
					System.out.println("登录失败: " + ae.getMessage());
					return "redirect:index.jsp";
				}
			}
		}
		return "redirect:../showMain";
	}
	
	@RequestMapping("loginOut")
	public String userLoginOut() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}
	
	@RequestMapping("reg")
	public String userReg(@Valid User user,BindingResult res,HttpServletRequest request) {
		if(res.hasErrors()){
			return "error";
		}		
		if(userService.addUser(user)==1) {
			request.setAttribute("PageMax", Integer.MAX_VALUE);
			return "user";
		};
		return "error";
	}
	
	@RequestMapping("checkUserName")
	@ResponseBody
	public Msg checksName(String userName) {
		int num=userService.checkName(userName);
		Msg msg=null;
		if(num>=1) {
			msg=Msg.fail();
		}else {
			msg=Msg.success();
		}
		return msg;
	}
	
	@RequestMapping("showUser")
	public String showUser() {
		return "user";
	}
	
	@RequestMapping("/listUser")
	@ResponseBody
	public Msg listUsers(@RequestParam(value="pageNo",defaultValue="1",required=false) Integer pageNo,
														@RequestParam(value="name",required=false) String name) {	
		PageInfo<User> pageinfo=userService.getPageInfoByItem(pageNo, name);	
		return Msg.success().addMap("PageInfo", pageinfo);
	}
	
	@RequestMapping("/assignRole")
	public String showRoles(HttpServletRequest request) {
		String userId=request.getParameter("userId");
		request.setAttribute("userId", userId);
		return "assignRole";
	}
	
	@RequestMapping("/editUser")
	public String showEdit(Integer userId,ModelMap model) {
		User user=userService.findUserById(userId);		
		model.addAttribute("user", user);
		return "edit";
	}
	
	@RequestMapping("/showRole")
	public String showRole() {
		return "role";
	}
	
	@RequestMapping("/showAdd")
	public String showAdd() {
		return "addUser";
	}
	
	@RequestMapping("/showUserRole")
	@ResponseBody
	public Msg showUserRole(Integer userId) {
		List<Role> userRoles = userService.getUserRoles(userId);
		List<Role> outUseRoles=userService.getOutUserRoles(userId);
		return Msg.success().addMap("userRoles", userRoles)
												  .addMap("outUseRoles", outUseRoles);
	}
	/**
	 * 给用户添加角色
	 * @param roleId角色id
	 * @param userId用户id
	 * @return 返回执行信息
	 */
	@RequestMapping("/addUserRole")
	@ResponseBody
	public Msg addUserRole(Integer[] roleIds,Integer userId) {	
		System.err.println("roleIds======="+roleIds.length);
		for (Integer roleId : roleIds) {
			System.err.println("roleId==============="+roleId);
			userService.addUserRole(roleIds,userId);
		}				
		return Msg.success();		
	}
	
	/**
	 * 删除用户的角色
	 */
	@RequestMapping("/deleteUserRole")
	@ResponseBody
	public Msg deleteUserRole(Integer roleIds,Integer userId) {	
		
		userService.deleteUserRole(roleIds,userId);		
		return Msg.success();		
	}

}
