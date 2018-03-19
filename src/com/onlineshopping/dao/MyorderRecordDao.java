package com.onlineshopping.dao;



import java.sql.SQLException;

import java.util.List;

import org.apache.bcel.generic.NEW;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;
import com.onlineshopping.entity.User;


public class MyorderRecordDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	

	/**
	 * 订单查询
	 * 查询订单编号  订单时间 以及订单总价 ,
	 * @return  返回所有订单信息
	 * @throws SQLException
	 */
	public List<Record> recodeAll() throws SQLException{
		String sql = "SELECT * FROM T_RECORD";
		return runner.query(sql, new BeanListHandler<>(Record.class));
	}

	

	/**
	 * 
	 * @param rid  订单ID   
	 * @return   订单记录表的所有信息
	 * @throws SQLException   抛出异常
	 */
	public List<Record> recod(int rid) throws SQLException {
		String sql = "SELECT * FROM T_RECORD WHERE RID = ?";
		return runner.query(sql, new BeanListHandler<>(Record.class),rid);
	}
	
	/**
	 *  通过订单rid 查询商品 gid 
	 * @return
	 * @throws SQLException
	 */
	public List<RecordDetails> reDtaislId (int rid) throws SQLException {
		String sql = "SELECT * FROM T_RECORD_DETAILS WHERE RID = ?";
		return runner.query(sql, new BeanListHandler<>(RecordDetails.class),rid );
	}
	
	/**
	 * 
	 * 订单记录
	 * @param rid
	 * @return
	 * @throws SQLException
	 */
	public Record recordsOne(int rid) throws SQLException{
		String sql = "select * from t_record where rid = ?";
		return runner.query(sql, new BeanHandler<>(Record.class),rid);
	}
	
	
	
}
