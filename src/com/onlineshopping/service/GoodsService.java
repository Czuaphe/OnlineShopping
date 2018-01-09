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
	/**
	 * 对关键字进行模糊搜索，返回搜索结果
	 * @param key 要进行模糊搜索的关键字
	 * @param page 页数
	 * @param num 每一页的数量
	 * @return 返回商品列表
	 */
	public List<Goods> getSearchResult(String key, int page, int num) {
		return goodsDao.getGoodsLikeName(key, page, num);
	}
	
	public int getSearchCount(String key) {
		return goodsDao.getCountLikeName(key);
	}
	
}
