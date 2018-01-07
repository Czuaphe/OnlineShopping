package com.onlineshopping.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;

public class GoodsDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	
	public boolean saveGoods(Goods goods) throws SQLException {
		
		String IdSQL = "select SEQ_GID.nextval from dual";
		String sql = "insert into t_goods(gid, name, details, price, numbers, discount, time, type, picpath) values(?, ?, ?, ?, ?, ?, to_timestamp(?, 'yyyy-mm-dd hh24:mi:ss'), ?, ?)";
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		// 得到下一个用户的ID的序列值
		Object idString = runner.query(IdSQL, new ScalarHandler<>());
		System.out.println(Integer.parseInt(String.valueOf(idString)));
		
		// 新建一个用户
		int goodsid = Integer.parseInt(String.valueOf(idString));
		goods.setGid(goodsid);
		
//		Goods goods = new Goods();
//		goods.setGid(goodsid);
//		goods.setName("这是一个商品");
//		goods.setDetails("这是一个商品的详情描述");
//		goods.setPrice(123.45);
//		goods.setNumbers(12312);
//		goods.setDiscount(0.98);
//		goods.setTime(new Date());
//		goods.setType(1);
//		goods.setPicpath("123131231.jpg");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		int nums = runner.update(sql
				,goods.getGid()
				,goods.getName()
				,goods.getDetails()
				,goods.getPrice()
				,goods.getNumbers()
				,goods.getDiscount()
				,dateFormat.format(goods.getTime())
				,goods.getType() 
				,goods.getPicpath()
				);
		
		return nums > 0;
//		System.out.println(nums);
	}
	
	public List<Goods> getAllGoods() throws SQLException {
		String sql = "select * from t_goods";
		return runner.query(sql, new BeanListHandler<>(Goods.class));
	}
	
}
