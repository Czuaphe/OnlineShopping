package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.MyorderDao;
import com.onlineshopping.dao.MyorderRecordDao;
import com.onlineshopping.entity.Record;
import com.onlineshopping.servlet.MyorderRedatileRecoleServlet;

public class Myorder {
MyorderRecordDao MyorderRecordDao = null;
MyorderDao Myorder = null;
	@Before
	public void setUp() throws Exception {
		MyorderRecordDao = new  MyorderRecordDao();
		Myorder =new MyorderDao();
	}

	@Test
	public void test() throws SQLException {
		 
		List<Record> list = MyorderRecordDao.recodeAll();
		for (Record record : list) {
			System.out.println(list);
		}
		
		
	}

}
