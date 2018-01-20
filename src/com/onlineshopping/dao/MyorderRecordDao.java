package com.onlineshopping.dao;



import java.sql.SQLException;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Record;


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

		/*public List<Goods> goodsAll() throws SQLException{
			String sql = "SELECT PICPATH,NAME,T_RECORD_DETAILS.NUMBERS,PRICE*DISCOUNT \r\n" + 
					"FROM T_RECORD_DETAILS ,T_GOODS\r\n" + 
					"WHERE T_RECORD_DETAILS.GID=T_GOODS.GID";
			return runner.query(sql, new BeanListHandler<>(Goods.class));
		}
	*//**
	 * 查询商品部分详情
	 * @return 
	 * @throws SQLException
	 *//*
	public List<RecordDetails> reDtailsAll() throws SQLException{
		String sql = "SELECT PICPATH,NAME,T_RECORD_DETAILS.NUMBERS,PRICE*DISCOUNT \\r\\n\" + \r\n" + 
				"				\"FROM T_RECORD_DETAILS ,T_GOODS\\r\\n\" + \r\n" + 
				"				\"WHERE T_RECORD_DETAILS.GID=T_GOODS.GID\"";
		return runner.query(sql, new BeanListHandler<>(RecordDetails.class));
	}*/
	
	
	
	/**
	 * 查询单一订单的数据
	 * @param rdid  订单号
	 * @return   根据订单号返回一次订单数据
	 * @throws SQLException
	 *//*
	public Record recodeone(int rdid) throws SQLException{
		String sql = "SELECT RECNUM,PAYWAY,EXPRESS,UID,FREIGHT,TOTAL,\r\n" + 
				"E3.NAME,PRICE*DISCOUNT FIAPRICE,E3.GID,\r\n" + 
				"E4.NAME,PHONE,PROVINCE,CITY,BLOCK,E4.DETAILS\r\n" + 
				"FROM T_RECORD_DETAILS E1,T_RECORD E2,T_GOODS E3,T_USER_ADDRESS E4\r\n" + 
				"WHERE E1.RID=E2.RID\r\n" + 
				"AND  E3.GID=E1.GID\r\n" + 
				"AND E2.UAID=E4.UAID\r\n" + 
				"AND RDID = ? ";
		return runner.query(sql, new BeanHandler<>(Record.class),rdid);
	} 
	*/
	

}
