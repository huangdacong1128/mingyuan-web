package com.mingyuan.realms;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.mingyuan.entitys.Permission;
import com.mingyuan.entitys.Role;
import com.mingyuan.entitys.User;
import com.mingyuan.service.RoleService;
import com.mingyuan.service.UserService;


public class OneRealms extends AuthorizingRealm {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("权限配置-->OneRealms.doGetAuthorizationInfo()");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        String username  = (String) principals.getPrimaryPrincipal();
        System.err.println("username----------------->"+username);
        User userInfo=userService.findUserByName(username);
        List<Role> roles=userService.getUserRoles(userInfo.getUserId());
        System.err.println("roles----------------->"+roles);
        		
        for(Role role:roles){
            authorizationInfo.addRole(role.getRole());
            List<Permission> permissions=roleService.getRolePermission(role.getRoleId());
            System.err.println("permissions----------------->"+permissions);
            for(Permission p:permissions){
                authorizationInfo.addStringPermission(p.getPermission());
            }
        }
        return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		System.out.println("doGetAuthenticationInfo" + upToken.getUsername());
		String username = upToken.getUsername();

		// 3. 调用数据库的方法, 从数据库中查询 username 对应的用户记录
		User user=userService.findUserByName(username);
		System.out.println(user);

		// 4. 若用户不存在, 则可以抛出 UnknownAccountException 异常
		if (user==null) {
			throw new UnknownAccountException("用户不存在!");
		}

		// 5. 根据用户信息的情况, 决定是否需要抛出其他的 AuthenticationException 异常.
		if ("monster".equals(username)) {
			throw new LockedAccountException("用户被锁定");
		}

		// 6. 根据用户的情况, 来构建 AuthenticationInfo 对象并返回. 通常使用的实现类为: SimpleAuthenticationInfo
		// 以下信息是从数据库中获取的.
		// 1). principal: 认证的实体信息. 可以是 username, 也可以是数据表对应的用户的实体类对象.
		Object principal = username;
		// 2). credentials: 密码.
		Object credentials = user.getPassword();
		// 3). realmName: 当前 realm 对象的 name. 调用父类的 getName() 方法即可
		String realmName = getName();
		// 4). 盐值.
		ByteSource credentialsSalt = ByteSource.Util.bytes(username);

		SimpleAuthenticationInfo info = null; // new SimpleAuthenticationInfo(principal, credentials, realmName);
		info = new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
		return info;	
	}

}
