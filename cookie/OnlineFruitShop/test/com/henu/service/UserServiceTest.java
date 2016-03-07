package com.henu.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.henu.model.User;

public class UserServiceTest {
	private  UserService us = (UserService) new FileSystemXmlApplicationContext("conf/applicationContext.xml").getBean("userService");
/*	@Test
	public void create() {
		User user = new User();
		user.setUsername("胡玉祺");
		user.setPassword("123");
		user.setAge(12);
		user.setGender("female");
		user.setUserId(002);
		user.setPhone("13838017640");
		user.setAddress("河南大学软件学院");
		us.register(user);
		Assert.assertEquals("123", user.getPassword());
	}*/
	@Test
	public void getByName() {
		User user = us.getByName("ricky");
		Assert.assertEquals("123", user.getPassword());
	}
	/*	
	@Test
	public void delete() {
		us.delete(3);
	}*/
	
/*	@Test
	public void update() {
		User user = new User();
		user.setUsername("混蛋");
		user.setPassword("123456");
		user.setPhone("13812321234");
		user.setAddress("北京中关村");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("id", 6);
		us.update(map);
	}*/
	
/*	@Test
	public void getTotalCount() {
		System.out.println(us.getTotalCount());
	}
	@Test
	public void getByName() {
		User user = us.getByName("tom");
		Assert.assertEquals("123", user.getPassword());
	}*/
	
/*	@Test
	public void getById() {
		User user = us.getById(4);
		Assert.assertEquals("123", user.getPassword());
	}
	@Test
	public void query() {
		Map<String, Object> map = new HashMap<String, Object>();

	    Pagination pagination = new Pagination();
	    pagination.setCurrentPage(1);

	    map.put("pagination", pagination);
	    map.put("keyword", "t");
	    List<User> users = us.query(map);
	    System.out.println("用户数量："+users.size());
	}*/

}
