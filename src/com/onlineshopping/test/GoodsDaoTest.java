package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;

public class GoodsDaoTest {
	
	private GoodsDao GoodsDao = new GoodsDao();
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void saveGoodsTest() throws SQLException {
		
		GoodsDao.saveGoods(new Goods());
		
		
	}

}
