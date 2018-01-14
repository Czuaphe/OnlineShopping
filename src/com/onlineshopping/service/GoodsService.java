package com.onlineshopping.service;

import java.sql.SQLException;
import java.util.List;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.UserCollectGoodsDao;
import com.onlineshopping.entity.Goods;

public class GoodsService {
	
	private GoodsDao goodsDao = new GoodsDao();
	private UserCollectGoodsDao userCollectGoodsDao = new UserCollectGoodsDao();
	
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
	/**
	 * 得到打折商品数据
	 * @return
	 */
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
	/**
	 * 得到关键字搜索的结果的数量
	 * @param key 关键字
	 * @return
	 */
	public int getSearchCount(String key) {
		return goodsDao.getCountLikeName(key);
	}
	/**
	 * 根据id找到商品的信息
	 * @param gid 商品的ID
	 * @return 返回商品的对象数据
	 */
	public Goods getGoodsByGid(int gid) {
		return goodsDao.getGoodsByGid(gid);
	}
	/**
	 * 判断某个用户是否收藏某个商品
	 * @param userid 用户ID
	 * @param gid 商品ID
	 * @return 返回是否已经收藏
	 */
	public boolean isCollectGoods(int userid, int gid) {
		
		try {
			return userCollectGoodsDao.isCollectGoods(userid, gid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
