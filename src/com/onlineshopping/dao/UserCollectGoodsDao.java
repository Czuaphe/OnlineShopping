package com.onlineshopping.dao;

import java.math.BigDecimal;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineshopping.db.DBUtils;
/**
 * 鎻愪氦鍟嗗搧鏀惰棌鐨勫熀纭�鍔熻兘锛岀敱浜庡晢鍝佹敹钘忓彧鑳藉锛屽垹锛屾煡锛屾墍浠ヤ笉鎻愪緵鏇存敼鍔熻兘銆�
 * @author admin
 *
 */
public class UserCollectGoodsDao {
	
	private QueryRunner runner = DBUtils.getQueryRunner();
	/**
	 * 鏌ユ壘鏌愪釜鐢ㄦ埛鏄惁鏀惰棌鏌愪釜鍟嗗搧
	 * @param userid
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public boolean isCollectGoods(int userid, int gid) throws SQLException {
		String sql = "select * from t_user_collect_goods where userid = ? and gid = ?";
		// 浣跨敤Lambda琛ㄨ揪寮忓疄鐜颁竴涓猂esultSetHandler鐨勫尶鍚嶅疄鐜扮被
		return runner.query(sql, (rs) -> rs.next() ? true : false, userid, gid);
	}
	/**
	 * 鏍规嵁鐢ㄦ埛ID鍜屽晢鍝両D鏀惰棌璇ュ晢鍝�
	 * @param userid 鐢ㄦ埛ID
	 * @param gid 鍟嗗搧ID
	 * @return 杩斿洖鏀惰棌鏄惁鎴愬姛
	 * @throws SQLException
	 */
	public boolean collectGoods(int userid, int gid) throws SQLException {
		String CIDsql = "select seq_cid.nextval from dual";
		BigDecimal cid = runner.query(CIDsql, new ScalarHandler<BigDecimal>());
		String sql = "insert into t_user_collect_goods(cid, userid, gid) values(?, ?, ?)";
		return runner.update(sql, Integer.parseInt(String.valueOf(cid)), userid, gid) > 0;
	}
	
	public boolean deleteCollectGoods(int uid,int gid) {
		int result=0;
		String sql="delete from t_user_collect_goods where userid=? and gid=?";
		try {
			result = runner.update(sql, uid, gid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result>0;
	}

}
