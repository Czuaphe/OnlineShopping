package com.onlineshopping.service;

import java.sql.SQLException;
import java.util.List;

import com.onlineshopping.dao.MyorderDao;
import com.onlineshopping.entity.Record;

public class UserRecordService {
MyorderDao myorderdao = new MyorderDao();

	
	public List<Record> selctAll() throws SQLException {
		return myorderdao.recodeAll();
	}
		
	
	

}
