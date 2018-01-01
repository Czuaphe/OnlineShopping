package com.onlineshopping.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.onlineshopping.db.handler.ResultSetHandler;
/**
 * 静态工具类，提供数据库连接和查询接口
 * @author admin
 *
 */
public class DBUtils {
	
	private static String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static String USERNAME = "onlineshopping";
	private static String PASSWORD = "0509";
	
	public static Connection getConnection() {
		
		Connection connection = null;
		
		try {
			Class.forName(ORACLE_DRIVER);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public static boolean udpate(String sql, Object... objects) {
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(sql);
			
			if (objects != null) {
				for(int i = 0; i < objects.length; i ++) {
					pstmt.setObject(i + 1, objects[i]);
				}
			}
			
			return pstmt.executeUpdate() > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, resultSet);
		}
		
		return false;
	}
	
	public static <T> T query(String sql, ResultSetHandler<T> rsh, Object... objects){
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			pstmt =connection.prepareStatement(sql);
			if (objects != null) {
				for(int i = 0; i < objects.length; i ++) {
					pstmt.setObject(i + 1, objects[i]);
				}
			}
			resultSet = pstmt.executeQuery();
			return rsh.handler(resultSet);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, resultSet);
		}
		
		return null;
		
	}

	public static void closeAll(Connection connection, PreparedStatement pstmt, ResultSet resultSet) {
		
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
