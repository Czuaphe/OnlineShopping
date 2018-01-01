package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.db.handler.BeanHandler;
import com.onlineshopping.entity.User;

public class DBUtilsTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		Connection connection = DBUtils.getConnection();
		System.out.println(connection);
		assertNotNull(connection);
		
	}
	@Test
	public void queryTest() {
		String sql = "select * from t_user";
		User user = DBUtils.query(sql, new BeanHandler<>(User.class));
		System.out.println(user.toString());
		assertNotNull(user);
		
	}
	
	
}
