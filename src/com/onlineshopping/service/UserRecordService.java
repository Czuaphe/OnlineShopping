package com.onlineshopping.service;

import java.sql.SQLException;
import java.util.List;

import com.onlineshopping.dao.MyorderDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;

public class UserRecordService {
MyorderDao myorderdao = new MyorderDao();

	
	public List<Record> selctAll() throws SQLException {
		return myorderdao.recodeAll();
	}
		
	
	public List<Goods> goodsSelect() throws SQLException{
		return myorderdao.goodsAll();
	}
	
	public List<RecordDetails> reDtailsAll() throws SQLException{
		return myorderdao.reDtailsAll();
	}
	
	 


	
	
	
	

}
