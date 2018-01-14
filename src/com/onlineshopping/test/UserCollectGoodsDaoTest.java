package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.UserCollectGoodsDao;

public class UserCollectGoodsDaoTest {
	
	private UserCollectGoodsDao userCollectGoodsDao = new UserCollectGoodsDao();
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void isCollectGoodsTest() throws SQLException {
		boolean b = userCollectGoodsDao.isCollectGoods(1, 1);
		System.out.println(b);
		assertNotNull(b);
	}
	
	@Test
	public void collectGoodsTest() throws SQLException {
		boolean b = userCollectGoodsDao.collectGoods(1, 5155);
		System.out.println(b);
		assertNotNull(b);
	}

}
