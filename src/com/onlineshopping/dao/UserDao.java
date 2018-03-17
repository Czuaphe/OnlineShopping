package com.onlineshopping.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.User;

public class UserDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	
	public List<User> getAllUser() throws SQLException {
		String sql = "select * from t_user";
		return runner.query(sql, new BeanListHandler<>(User.class));
	}
	
	public boolean saveUser(User user) {
		
		String IdSQL = "select SEQ_USERID.nextval from dual";
		String sql = "insert into t_user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// 得到下一个用户的ID的序列值
		
		try {
			Object idString = runner.query(IdSQL, new ScalarHandler<>());
			
			// 设置用户的USERID
			int userid = Integer.parseInt(String.valueOf(idString));
			user.setUserid(userid);
			// 保存些用户的信息到数据库中
			int nums = runner.update(sql
					,user.getUserid()
					,user.getName()
					,user.getPswd()
					,user.getEmail() 
					,user.getPhone() 
					,user.getIcon() 
					,user.getMoney() 
					,user.getVipscore() 
					,user.getViplevel() 
					,user.getStatus()
					);
			return nums > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return false;
		
	}
	public User getName(String name){
		String sql="select * from t_user where name=?";
		try {
			return runner.query(sql,new BeanHandler<>(User.class),name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
