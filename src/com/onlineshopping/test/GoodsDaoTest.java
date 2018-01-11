package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;

public class GoodsDaoTest {
	
	private GoodsDao goodsDao = new GoodsDao();
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void saveGoodsTest() throws SQLException {
		
		goodsDao.saveGoods(new Goods());
	}
	
	@Test
	public void getGoodsByGidTest() throws SQLException {
		
		Goods goods = goodsDao.getGoodsByGid(5155);
		System.out.println(goods.toString());
		assertNotNull(goods);
	}
	
	@Test
	public void getAllGoodsTest() {
		List<Goods> list = goodsDao.getAllGoods();
		System.out.println(list.size());
		for (Goods goods : list) {
			System.out.println(goods.toString());
		}
		assertNotNull(list);
	}
	
	@Test
	public void getGoodsOrderbyTime() {
		List<Goods> list = goodsDao.getGoodsOrderByTime(10);
		System.out.println(list.size());
		for (Goods goods : list) {
			System.out.println(goods.toString());
		}
		assertNotNull(list);
	}
	
	@Test
	public void getGoodsOrderByDiscount() {
		List<Goods> list = goodsDao.getGoodsOrderByDiscount(10);
		System.out.println(list.size());
		for (Goods goods : list) {
			System.out.println(goods.getDiscount());
		}
		assertNotNull(list);
	}
	
	@Test
	public void getGoodsLikeName() {
		List<Goods> list = goodsDao.getGoodsLikeName("BB", 1, 10);
		System.out.println(list.size());
		for (Goods goods : list) {
			System.out.println(goods.toString());
		}
		assertNotNull(list);
	}
	
	@Test
	public void getCountLikeName() {
		int num = goodsDao.getCountLikeName("霜");
		System.out.println(num);
		assertNotNull(num);
	}
	
	@Test
	public void getGoodsByRunner() throws SQLException {
		QueryRunner runner = DBUtils.getQueryRunner();
		
		String sql = "select * from t_goods";
		List<Goods> list = runner.query(sql, new BeanListHandler<>(Goods.class));
		System.out.println(list.size());
		assertNotNull(list);
		
	}
	

}
