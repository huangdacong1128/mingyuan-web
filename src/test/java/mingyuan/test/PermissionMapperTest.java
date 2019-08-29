package mingyuan.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mingyuan.dao.PermissionMapper;
import com.mingyuan.entitys.Permission;

public class PermissionMapperTest {
	ClassPathXmlApplicationContext cat;
	PermissionMapper pm;
	{
		cat=new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
		pm=cat.getBean(PermissionMapper.class);
	}
	
	
	
	
	@Test
	public void addPermissionTest() {
		Permission p=new Permission();
		p.setPName("学生管理");
		p.setCreateTime(new Date());
		Integer num=pm.addPermission(p);
		if(num==1) {
			System.out.println("添加权限成功");
		}		
	}
	
	@Test
	public void getPermissionsTest() {
		
		List<Permission> permissions=pm.getAllPermission();
		System.out.println(permissions);
			
	}
	

}
