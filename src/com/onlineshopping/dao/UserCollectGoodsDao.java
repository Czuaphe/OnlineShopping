package com.onlineshopping.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
/**
 * 提交商品收藏的基础功能，由于商品收藏只能增，删，查，所以不提供更改功能。
 * @author admin
 *
 */
public class UserCollectGoodsDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	/**
	 * 查找某个用户是否收藏某个商品
	 * @param userid
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public boolean isCollectGoods(int userid, int gid) throws SQLException {
		String sql = "select * from t_user_collect_goods where userid = ? and gid = ?";
		// 使用Lambda表达式实现一个ResultSetHandler的匿名实现类
		return runner.query(sql, (rs) -> rs.next() ? true : false, userid, gid);
	}
	/**
	 * 根据用户ID和商品ID收藏该商品
	 * @param userid 用户ID
	 * @param gid 商品ID
	 * @return 返回收藏是否成功
	 * @throws SQLException
	 */
	public boolean collectGoods(int userid, int gid) throws SQLException {
		String CIDsql = "select seq_cid.nextval from dual";
		int cid = runner.query(CIDsql, new ScalarHandler<Integer>());
		String sql = "insert into t_user_collect_goods(cid, userid, gid) values(?, ?, ?)";
		return runner.update(sql, cid, userid, gid) > 0;
	}

}
