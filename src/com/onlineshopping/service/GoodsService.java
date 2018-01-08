package com.onlineshopping.service;

import java.sql.SQLException;
import java.util.List;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.entity.Goods;

public class GoodsService {
	
	private GoodsDao goodsDao = new GoodsDao();
	
	
	/**
	 * 通过个人提交的订单计算出的热卖商品
	 * @return
	 */
	public List<Goods> getHotGoods() {
		
		try {
			return goodsDao.getAllGoods();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
}
