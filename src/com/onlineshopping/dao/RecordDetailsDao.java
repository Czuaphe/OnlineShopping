package com.onlineshopping.dao;

import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.RecordDetails;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

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


}
