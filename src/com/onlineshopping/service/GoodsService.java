package com.onlineshopping.service;

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
		return goodsDao.getAllGoods();	
	}
	/**
	 * 通过对商品的上架时间进行排序得到最新的商品
	 * @return 返回一列表包括了8个数据
	 */
	public List<Goods> getNewGoods() {
		return goodsDao.getGoodsOrderByTime(8);
	}
	
	public List<Goods> getDiscountGoods() {
		return goodsDao.getGoodsOrderByDiscount(8);
	}
	
}
