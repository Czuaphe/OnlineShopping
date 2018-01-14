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
	public void test() throws SQLException {
		boolean b = userCollectGoodsDao.isCollectGoods(1, 1);
		System.out.println(b);
		assertNotNull(b);
	}

}
