package com.onlineshopping.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Record;

public class MyorderDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	

	public List<Record> recodeAll() throws SQLException{
		String sql = "SELECT * FROM T_RECORD;";
		List<Record> list=new ArrayList<Record>();
		return runner.query(sql, new BeanListHandler<>(Record.class));
	} 
	
	

}
