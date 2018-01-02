package com.onlineshopping.db.handler;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.ServiceLoader;

import org.apache.commons.dbutils.ColumnHandler;

public class BeanHandler<T> implements ResultSetHandler<T> {
	
	private Class<T> clazz;

	public BeanHandler(Class<T> clazz) {
		this.clazz = clazz;
	}
	
	@Override
	public T handler(ResultSet rs) throws SQLException {
		
		try {
			
			System.out.println(clazz.getName());
			
			// 得到Java对象的属性名的数组
			BeanInfo beanInfo = Introspector.getBeanInfo(clazz);
			PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
			// 映射数组，默认为-1
			int[] columnToProperty = new int[pds.length];
			Arrays.fill(columnToProperty, -1);
			// 得到数据库的列名
			ResultSetMetaData rsmd = rs.getMetaData();
			
			// 将数据库列名与对象的属性名的映射顺序保存到数组中  
			for(int col = 1; col <= rsmd.getColumnCount(); col ++) {
				String colLabel = rsmd.getColumnLabel(col);
				for(int i = 0; i < pds.length; i ++) {
					if (pds[i].getName().equalsIgnoreCase(colLabel)) {
						columnToProperty[col] = i;
						break;
					}
				}
//				System.out.println(rsmd.getColumnLabel(col));
			}
			
//			for(int i = 0; i <= rsmd.getColumnCount(); i ++) {
//				
//				System.out.print(pds[i].getName() + "\t");
//				if (i != 0) {
//					System.out.print(rsmd.getColumnLabel(i) + "\t");
//				}
//				System.out.println(columnToProperty[i]);
//			}
			// 自动生成Bean
			if (rs.next()) {
				T t = clazz.newInstance();
				
				// 取出一行数据的每一列,映射到对应属性中去
				for(int col = 1; col <= rsmd.getColumnCount(); col ++) {
					Object object = null;
					Method setter = pds[columnToProperty[col]].getWriteMethod();
					// 还需要得到属性的类型
					Class<?> firstParam = setter.getParameterTypes()[0];
					// 得到对应类型的数据
					for (ColumnHandler handler : columnHandlers) {
			            if (handler.match(firstParam)) {
			                object = handler.apply(rs, col);
			                break;
			            }
			        }
					
					setter.invoke(t, object);
				}
				
				return t;
				
			}
			
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
}
