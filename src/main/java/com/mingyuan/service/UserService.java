package com.mingyuan.service;

import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mingyuan.dao.UserMapper;
import com.mingyuan.entitys.Role;
import com.mingyuan.entitys.User;
import com.mingyuan.service.ex.DeleteException;
import com.mingyuan.service.ex.InsertException;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public Integer addUser(User user) {
		user.setIsDelete(0);
		user.setCreateTime(new Date());
		String hashAlgorithmName = "MD5";
		Object credentials = user.getPassword();
		Object salt = ByteSource.Util.bytes(user.getUserName());;
		int hashIterations = 1024;		
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		user.setPassword(result.toString());
		return userMapper.addUser(user);
	}
	
	public User findUserByName(String name) {
		return userMapper.findUserByName(name);
	}

	public PageInfo<User> getPageInfoByItem(Integer pageNo, String name) {
		PageHelper.startPage(pageNo,3);
		List<User> Users=userMapper.getUserbyTerm(name);
		//用PageInfo对结果进行包装
		return new PageInfo<User>(Users,5);
	}

	public int checkName(String name) {		
		return userMapper.getCountByName(name);
	}

	public User findUserById(Integer userId) {
		
		return userMapper.getUserById(userId);
	}

	public List<Role> getUserRoles(Integer userId) {
		
		return userMapper.getUserRoles(userId);
	}

	public List<Role> getOutUserRoles(Integer userId) {
		
		return userMapper.getOutUserRoles(userId);
	}

	public void addUserRole(Integer[] roleIds, Integer userId) {
		
		Integer num=userMapper.addUerRole(roleIds,userId,new Date());
		if(num!=1) {
			throw new InsertException("角色添加异常请联系管理员");
		}
	}

	public void login(String username, String password) {
		
	}
	/**
	 * 删除用户的一个角色
	 * @param roleId角色id
	 * @param userId用户id
	 */

	public void deleteUserRole(Integer roleId, Integer userId) {
		Integer num=userMapper.deleteUserRole(roleId,userId);
		if(num!=1) {
			throw new DeleteException("角色添加异常请联系管理员");
		}
	}
	
	
	

}
