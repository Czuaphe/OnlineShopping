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
	
	public boolean saveUser(User user) throws SQLException {
		
		String IdSQL = "select SEQ_USERID.nextval from dual";
		String sql = "insert into t_user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// 寰楀埌涓嬩竴涓敤鎴风殑ID鐨勫簭鍒楀��
		Object idString = runner.query(IdSQL, new ScalarHandler<>());
//		System.out.println(Integer.parseInt(String.valueOf(idString)));
		
		// 璁剧疆鐢ㄦ埛鐨刄SERID
		int userid = Integer.parseInt(String.valueOf(idString));
		user.setUserid(userid);
		// 淇濆瓨浜涚敤鎴风殑淇℃伅鍒版暟鎹簱涓�
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
	}

	/**
	 * 閫氳繃ID寰楀埌涓�涓敤鎴�
	 * @param userid
	 * @return
	 */
	public User queryByUserID(int userid) {
		String sql = "select * from t_user where userid = ?";
		try {
			return runner.query(sql, new BeanHandler<>(User.class), userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 更新用户的邮箱，电话和头像路径
	 * @param user 要更新的用户
	 * @return 返回更新的结果
	 */
	public boolean updateInfo(User user) {
		
		String sql = "update t_user set email = ?, phone = ?, icon = ? where userid = ? ";
		
		try {
			return runner.update(sql, user.getEmail(), user.getPhone(), user.getIcon(), user.getUserid()) > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
    public boolean updateInfoWithoutIcon(User user) {
		
		String sql = "update t_user set email = ?, phone = ? where userid = ? ";
		
		try {
			return runner.update(sql, user.getEmail(), user.getPhone(), user.getUserid()) > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
