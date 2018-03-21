package com.onlineshopping.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Record;

public class RecordDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	
	public boolean save(Record record) {
		String IdSQL = "select SEQ_RID.nextval from dual";
		String sql = "insert into t_record values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Object idObject = runner.query(IdSQL, new ScalarHandler<>());
			record.setRid(Integer.parseInt(String.valueOf(idObject)));
			
			return runner.update(sql
					, record.getRid()
					, record.getRecnum()
					, record.getTime()
					, record.getUserid()
					, record.getTotal()
					, record.getAddscore()
					, record.getStatus()
					, record.getFreight()
					, record.getPayway()
					, record.getExpress()
					, record.getUaid()
					) > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
