package com.onlineshopping.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import com.mchange.v2.c3p0.ComboPooledDataSource;
/**
 * 静态工具类，提供数据库连接和查询接口
 * @author admin
 *
 */
public class DBUtils {
	
//	private static String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
//	private static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
//	private static String USERNAME = "onlineshopping";
//	private static String PASSWORD = "0509";
	
	private static ComboPooledDataSource cpds = new ComboPooledDataSource();
	private static QueryRunner queryRunner = new QueryRunner(cpds);
	
	public static Connection getConnection() throws SQLException {
		return cpds.getConnection();
	}
	
	public static DataSource getDataSource() {
		return cpds;
	}
	
	public static QueryRunner getQueryRunner() {
		return queryRunner;
	}
	
	
	
	
//	public static boolean udpate(String sql, Object... objects) {
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet resultSet = null;
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			
//			if (objects != null) {
//				for(int i = 0; i < objects.length; i ++) {
//					pstmt.setObject(i + 1, objects[i]);
//				}
//			}
//			
//			return pstmt.executeUpdate() > 0;
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			closeAll(connection, pstmt, resultSet);
//		}
//		
//		return false;
//	}
//	
//	public static <T> T query(String sql, ResultSetHandler<T> rsh, Object... objects){
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet resultSet = null;
//		
//		try {
//			connection = getConnection();
//			pstmt =connection.prepareStatement(sql);
//			if (objects != null) {
//				for(int i = 0; i < objects.length; i ++) {
//					pstmt.setObject(i + 1, objects[i]);
//				}
//			}
//			resultSet = pstmt.executeQuery();
//			return rsh.handler(resultSet);
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			closeAll(connection, pstmt, resultSet);
//		}
//		
//		return null;
//		
//	}
//
//	public static void closeAll(Connection connection, PreparedStatement pstmt, ResultSet resultSet) {
//		
//		try {
//			if (connection != null) {
//				connection.close();
//			}
//			if (pstmt != null) {
//				connection.close();
//			}
//			if (resultSet != null) {
//				resultSet.close();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
	
	
	
}
