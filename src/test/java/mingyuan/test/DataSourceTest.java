package mingyuan.test;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DataSourceTest {
	
	ClassPathXmlApplicationContext cat;
	{
		cat=new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
	}
	@Test
	public void dataSource() throws SQLException {
		DataSource  dataSource=cat.getBean(DataSource.class);
		System.out.println(dataSource.getConnection());
	}

}
