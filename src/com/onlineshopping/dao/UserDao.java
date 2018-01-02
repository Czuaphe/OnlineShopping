package com.onlineshopping.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.User;

public class UserDao {
	
	private QueryRunner queryRunner = DBUtils.getQueryRunner();
	
	public List<User> getAllUser() throws SQLException {
		String sql = "select * from t_user";
		return queryRunner.query(sql, new BeanListHandler<>(User.class));
	}
	
	
	
}
