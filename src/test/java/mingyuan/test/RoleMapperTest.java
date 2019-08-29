package mingyuan.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mingyuan.dao.RoleMapper;
import com.mingyuan.entitys.Permission;

public class RoleMapperTest {
	
	ClassPathXmlApplicationContext cat;
	RoleMapper rm;
	{
		cat=new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
		rm=cat.getBean(RoleMapper.class);
	}
	
	@Test
	public void addRolePermissionTest() {
		Integer[] pIds= {2,3,5,6};
		Integer roleId=1;
		Date time=new Date();
		
		int num=rm.addRolePermission(roleId, pIds, time);
		if(num>0) {
			System.out.println("角色添加权限成功");
		}
	}
	
	@Test
	public void deleteRolePermissionTest() {
		Integer[] pIds= {2,3};
		Integer roleId=1;	
		int num=rm.deleteRolePermisson(roleId, pIds);
		if(num>0) {
			System.out.println("角色添加权限成功");
		}
	}
	
	@Test
	public void getRolePermissionTest() {
		Integer roleId=1;	
		List<Permission> permissions=rm.getRolePermission(roleId);
		System.out.println(permissions);
	}
	@Test
	public void getRoleOutPermissionTest() {
		Integer roleId=1;	
		List<Permission> permissions=rm.getRoleOutPermission(roleId);
		System.out.println(permissions);
	}

}
