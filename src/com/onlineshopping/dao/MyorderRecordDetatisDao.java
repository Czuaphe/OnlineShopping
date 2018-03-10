package com.onlineshopping.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.RecordDetails;

public class MyorderRecordDetatisDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner(); 
	
	
	
	
	/**
	 *  通过订单rid 查询商品 gid 
	 * @return
	 * @throws SQLException
	 */
	public List<RecordDetails> reDtaislId (int rid) throws SQLException {
		String sql = "SELECT * FROM T_Record_Details WHERE RID = ?";
		return runner.query(sql, new BeanListHandler<>(RecordDetails.class),rid );
	}
	 
	
	/**
	 * 
	 * @param rdid  商品订单记录id 
	 * @return   返回订单所记录的具体事件
	 * @throws SQLException
	 */
	
	public RecordDetails reDtails(int rdid) throws SQLException{
		String sql = "SELECT * FROM T_RecordDetails WHERE RDID = ?";
		return runner.query(sql, new BeanHandler<>(RecordDetails.class),rdid);
	}
	

}
