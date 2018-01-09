package com.onlineshopping.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;

public class GoodsDao extends BaseDao<Goods>{
	
	
	
	/**
	 * 保存商品
	 * @param goods
	 * @return boolean 
	 * @throws SQLException
	 */
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
	
	
	public List<Goods> getAllGoods() {
		String sql = "select * from t_goods";
		return query(sql).toBeanList(5);
	}
	
	public Goods getGoodsByGid(int gid) {
		String sql = "select * from t_goods where gid = ?";
		return (Goods) query(sql, gid).toBean();
	}

	public List<Goods> getGoodsOrderByTime(int num) {
		String sql = "select * from t_goods order by time desc";
		return query(sql).toBeanList(num);
	}
	
	public List<Goods> getGoodsOrderByDiscount(int num) {
		String sql = "select * from t_goods order by discount asc";
		return query(sql).toBeanList(num);
	}
	
	@Override
	protected Goods toBean() {
		
		Goods goods = null;
		
		try {
			goods =  produceBean();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		
		return goods;
		
	}

	@Override
	protected List<Goods> toBeanList() {
		
		List<Goods> list = new ArrayList<>();
		
		try {
			while(true) {
				Goods goods = produceBean();
				if (goods == null) {
					break;
				}
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		
		return list;
	}
	
	@Override
	protected List<Goods> toBeanList(int num) {
		List<Goods> list = new ArrayList<>();
		
		try {
			for(int i = 0; i < num; i ++) {
				Goods goods = produceBean();
				if (goods == null) {
					break;
				}
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, preparedStatement, resultSet);
		}
		
		return list;
	}
	
	private Goods produceBean() throws SQLException {
		
		Goods goods = null;
		
		if (resultSet.next()) {
			goods = new Goods();
			goods.setGid(resultSet.getInt("gid"));
			goods.setName(resultSet.getString("name"));
			goods.setDetails(resultSet.getString("details"));
			goods.setPrice(resultSet.getDouble("price"));
			goods.setNumbers(resultSet.getInt("numbers"));
			goods.setDiscount(resultSet.getDouble("discount"));
			goods.setTime(resultSet.getTimestamp("time"));
			goods.setType(resultSet.getInt("type"));
			goods.setPicpath(resultSet.getString("picpath"));
		}
		
		return goods;
	}
	
	
}
