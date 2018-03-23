package com.onlineshopping.dao;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class RecordDetailsDao {

    private QueryRunner runner = DBUtils.getQueryRunner();

    public boolean save(RecordDetails recordDetails) {
        String IdSQL = "select SEQ_RDID.nextval from dual";
        String sql = "insert into t_record_details values(?, ?, ?, ?, ?)";
        try {
            Object idObject = runner.query(IdSQL, new ScalarHandler<>());
            recordDetails.setRdid(Integer.parseInt(String.valueOf(idObject)));

            return runner.update(sql
                    , recordDetails.getRdid()
                    , recordDetails.getRid()
                    , recordDetails.getGid()
                    , recordDetails.getNumbers()
                    , recordDetails.getBuyprice()
            ) > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<RecordDetails> queryByRid(int rid) {
        String sql = "select * from t_record_details where rid = ?";

        try {
            return runner.query(sql, new BeanListHandler<>(RecordDetails.class), rid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


}
