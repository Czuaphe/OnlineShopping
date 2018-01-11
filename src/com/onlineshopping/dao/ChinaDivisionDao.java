package com.onlineshopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;

public class ChinaDivisionDao {

	protected Connection connection = null; 
	
	protected PreparedStatement preparedStatement = null;
	
	protected ResultSet resultSet = null;
	
	public ChinaDivisionDao query(String sql, Object... params) {
		
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
	/**
	 * 得到全国所有的省
	 * @return 返回全国所有的省的列表
	 */
	public Map<Integer, String> getAllProvinces() {
		String sql = "select pid ,name from t_china_division where pid <> 0 and cid = 0 and bid = 0 order by pid";
		return query(sql).toMap("pid");
	}
	/**
	 * 获得某个省的所有市
	 * @param pid 省的ID
	 * @return 返回所在省的所有的市的列表
	 */
	public Map<Integer, String> getAllCities(int pid) {
		String sql = "select cid,name from t_china_division where pid = ? and cid <> 0 and bid = 0 order by cid";
		return query(sql, pid).toMap("cid");
	}
	/**
	 * 获得某个省的某个市的所有区或县
	 * @param pid 省ID
	 * @param cid 市ID
	 * @return 返回所在省的所在市的所有区或县的列表
	 */
	public Map<Integer, String> getAllBlock(int pid, int cid) {
		String sql = "select bid, name from t_china_division where pid = ? and cid = ? and bid <> 0 order by bid";
		return query(sql, pid, cid).toMap("bid");
	}
	
	protected Map<Integer, String> toMap(String key) {
		Map<Integer, String> map = new HashMap<>();
		
		try {
			while(true) {
				if (!resultSet.next()) {
					break;
				}
				map.put(resultSet.getInt(key), resultSet.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		
		return map;
	}
	
//	protected List<String> toStringList() {
//		
//		List<String> list = new ArrayList<>();
//		
//		try {
//			while(true) {
//				if (!resultSet.next()) {
//					break;
//				}
//				list.add(resultSet.getString("name"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			closeAll(connection, preparedStatement, resultSet);
//		}
//		
//		return list;
//	}
	
}
