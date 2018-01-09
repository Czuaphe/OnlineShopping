package com.onlineshopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.poi.ss.formula.functions.T;

import com.onlineshopping.db.DBUtils;

public abstract class BaseDao<T> {
	
	protected Connection connection = null; 
	
	protected PreparedStatement preparedStatement = null;
	
	protected ResultSet resultSet = null;
	
	public BaseDao query(String sql, Object... params) {
		
		try {
			
			connection = DBUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			if (params != null) {
				for(int i = 0; i < params.length; i ++) {
					preparedStatement.setObject(i + 1, params[i]);
				}
			}
			
			resultSet = preparedStatement.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return this;
	}
	
	protected int update(String sql, Object... params) {
		
		try {
			
			connection = DBUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			if (params != null) {
				for(int i = 0; i < params.length; i ++) {
					preparedStatement.setObject(i + 1, params[i]);
				}
			}
			
			return  preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		
		return 0;
	}
	
	protected abstract T toBean();
	
	protected abstract List<T> toBeanList();
	
	protected abstract List<T> toBeanList(int num);
	
	public void closeAll(Connection connection, PreparedStatement pstmt, ResultSet resultSet) {
		
		try {
			if (connection != null) {
				connection.close();
			}
			if (pstmt != null) {
				connection.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
