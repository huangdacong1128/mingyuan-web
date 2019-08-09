package mingyuan.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mingyuan.entitys.Role;
import com.mingyuan.service.UserService;

public class UserTest {
	
	ClassPathXmlApplicationContext cat;
	UserService userService;
	{
		cat=new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
		userService=cat.getBean(UserService.class);
		
	}
	

	@Test
	public void testUserRole() {
		List<Role> roles=userService.getOutUserRoles(1);
		System.out.println(roles);
		List<Role> roles2=userService.getUserRoles(1);
		System.out.println(roles2);
		
	}
}
