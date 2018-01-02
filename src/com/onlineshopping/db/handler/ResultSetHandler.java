package com.onlineshopping.db.handler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ServiceLoader;

import org.apache.commons.dbutils.ColumnHandler;

public interface ResultSetHandler<T> {
	
	public static final ServiceLoader<ColumnHandler> columnHandlers = ServiceLoader.load(ColumnHandler.class);

	<T> T handler(ResultSet rs) throws SQLException;
	
}
