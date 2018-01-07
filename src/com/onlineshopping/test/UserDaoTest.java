package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.User;

public class UserDaoTest {

	private UserDao userDao = new UserDao();
	
	@Before
	public void setUp() throws Exception {
		
	}

	@Test
	public void getAllUserTest() {
		try {
			List<User> list = userDao.getAllUser();
			for (User user : list) {
				System.out.println(user.toString());
			}
			assertNotNull(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void saveUserTest() throws SQLException {
		User user = new User();
		user.setName("cuipp0101");
		user.setPswd("123123");
		user.setEmail("1462256657@qq.com");
		user.setPhone("18434362302");
		boolean flag = userDao.saveUser(user);
		assertEquals(flag, true);
	}
	

}
