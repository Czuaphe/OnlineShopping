package com.onlineshopping.db.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetHandler<T> {
	
	public T handler(ResultSet rs) throws SQLException;
	
}
