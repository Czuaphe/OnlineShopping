package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.User;

public class DBUtilsTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() throws SQLException {
		Connection connection = DBUtils.getConnection();
		System.out.println(connection);
		assertNotNull(connection);
	}
	@Test
	public void queryTest() throws SQLException {
		String sql = "select * from t_user";
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		User user = runner.query(sql, new BeanHandler<>(User.class));
		System.out.println(user);
		assertNotNull(user);
		
	}
	
	
}
