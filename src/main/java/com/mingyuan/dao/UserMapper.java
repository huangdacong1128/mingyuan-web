package com.mingyuan.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.mingyuan.entitys.Role;
import com.mingyuan.entitys.User;

public interface UserMapper {
		public Integer addUser(User user);
		
		public User findUserByName(String name);
		
		public List<User> getUserbyTerm(String name);
		
		@Select("select Count(*) from user where user_name=#{name}")
		public int getCountByName(String name);
		
		@Select("select * from user where user_id=#{userId}")
		public User getUserById(Integer userId);

		public List<Role> getUserRoles(Integer userId);

		public List<Role> getOutUserRoles(Integer userId);
		/**
		 * 给用户添加角色
		 * @param roleIds 角色的id
		 * @param userId用户的id
		 * @return
		 */
		public Integer addUerRole(@Param("roleIds")Integer[] roleIds,
																@Param("userId")Integer userId,
																@Param("createTime") Date time);
		
		/**
		 * 删除用户的一个角色
		 * @param roleId 角色的id
		 * @param userId用户的id
		 * @return
		 */
		public Integer deleteUserRole(@Param("roleIds")Integer[] roleIds,
																		@Param("userId")Integer userId);
}
