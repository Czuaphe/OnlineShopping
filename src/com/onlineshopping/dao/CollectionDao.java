package com.onlineshopping.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Collection;

public class CollectionDao {
	QueryRunner runner = DBUtils.getQueryRunner();
	public List<Collection> getUserCollectionByUid(int uid) throws SQLException {
    	String sql="select cid,g.* from t_user_collect_goods ucg,t_goods g where ucg.gid=g.gid and ucg.userid=?";
    	return runner.query(sql, new ResultSetHandler<List<Collection>>() {
			@Override
			public List<Collection> handle(ResultSet rs) throws SQLException {
				List<Collection> colls=new ArrayList<Collection>();
				Collection c=null;
				while(rs.next()) {
					c=new Collection();
					c.setCid(rs.getInt("cid"));
					c.setGid(rs.getInt("gid"));
					c.setName(rs.getString("name"));
					c.setPrice(rs.getDouble("price"));
					String path=rs.getString("picpath");
					String[] paths=path.split(",");
					c.setPicpath(paths[0]);
					colls.add(c);
				}
				return colls;
			}
    		
		}, uid);
    }
}
