package com.onlineshopping.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.UserAddress;

public class UserAddressDao {
    QueryRunner runner = DBUtils.getQueryRunner();
    
    public List<UserAddress> getUserAddressByUid(int uid) {
    	String sql="select * from t_user_address where userid=?";
		try {
			return runner.query(sql, new BeanListHandler<>(UserAddress.class), uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public boolean delete(int uaid) throws SQLException{
    	String sql="delete from t_user_address where uaid=?";
    	return runner.update(sql,uaid) > 0;
    }
    
    public int insert(UserAddress a) throws SQLException{
    	String sql0="select seq_uaid.nextval from dual";
    	Object uaid=runner.query(sql0, new ScalarHandler<>());
    	a.setUaid(Integer.parseInt(String.valueOf(uaid)));
    	String sql="insert into t_user_address values(?,?,?,?,?,?,?,?)";
    	return runner.update(sql,a.getUaid(),a.getUserid(),a.getName(),a.getPhone(),a.getProvince(),a.getCity(),a.getBlock(),a.getDetails());
    }
    
    public UserAddress getAddress(int uaid){
    	String sql="select * from t_user_address where uaid=?";
		try {
			return runner.query(sql, new BeanHandler<>(UserAddress.class), uaid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public int updateAddress(UserAddress a) throws SQLException{
    	String sql="update t_user_address set userid=?,name=?,phone=?,province=?,city=?,block=?,details=? where uaid=?";
    	return runner.update(sql,a.getUserid(),a.getName(),a.getPhone(),a.getProvince(),a.getCity(),a.getBlock(),a.getDetails(),a.getUaid());
    }
}
