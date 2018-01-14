package com.onlineshopping.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;

public class MyorderDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	

	public List<Record> recodeAll() throws SQLException{
		String sql = "SELECT * FROM T_RECORD";
		
		return runner.query(sql, new BeanListHandler<>(Record.class));
	} 
	
	
	public List<Goods> goodsAll() throws SQLException{
		String sql = "SELECT PICPATH,NAME,T_RECORD_DETAILS.NUMBERS,PRICE*DISCOUNT \r\n" + 
				"FROM T_RECORD_DETAILS ,T_GOODS\r\n" + 
				"WHERE T_RECORD_DETAILS.GID=T_GOODS.GID";
		return runner.query(sql, new BeanListHandler<>(Goods.class));
	}
	
	

}
