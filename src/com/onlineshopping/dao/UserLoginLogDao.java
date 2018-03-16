package com.onlineshopping.dao;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.UserLoginLog;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class UserLoginLogDao {

    private QueryRunner runner = DBUtils.getQueryRunner();

    public boolean save(UserLoginLog userLoginLog) {
        String IdSQL = "select SEQ_LOGID.nextval from dual";
        String sql = "insert into t_user_login_log values(?, ?, ?, ?)";

        try {
            Object idString = runner.query(IdSQL, new ScalarHandler<>());
            int loginlogid = Integer.parseInt(String.valueOf(idString));
            userLoginLog.setLogid(loginlogid);
            return runner.update(sql
                    , userLoginLog.getLogid()
                    , userLoginLog.getUserid()
                    , userLoginLog.getTime()
                    , userLoginLog.getIp()
            ) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 鏌ヨ鏈�鏂扮殑涓�鏉＄櫥褰曡褰�
     * @param userid
     * @return
     */
    public UserLoginLog queryRecentLogin(int userid) {
        String sql = "select * from t_user_login_log where userid = ? order by logtime asc";
        try {
            return runner.query(sql, new BeanHandler<>(UserLoginLog.class), userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 鏌ヨ鐢ㄦ埛鐨勭櫥褰曟鏁�
     * @param userid
     * @return
     */
    public int queryCountByUserID(int userid) {
        String sql = "select count(1) from t_user_login_log where userid = ?";
        try {
            Object numberObject = runner.query(sql, new ScalarHandler<>(), userid);
            return Integer.parseInt(String.valueOf(numberObject));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

}
