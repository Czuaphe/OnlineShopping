package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.dbutils.handlers.columns.StringColumnHandler;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.db.DBUtils;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.User;

public class DBUtilsTest {

	@Before
	public void setUp() throws Exception {
	}
	/**
	 * 测试是否可以连接上数据库
	 * @throws SQLException
	 */
	
	@Test
	public void test() throws SQLException {
		Connection connection = DBUtils.getConnection();
		System.out.println(connection);
		assertNotNull(connection);
	}
	/**
	 * 测试DBUtils类中的QueryRunner变量的查询功能
	 */
	@Test
	public void queryTest() throws SQLException {
		String sql = "select * from t_user";
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		User user = runner.query(sql, new BeanHandler<>(User.class));
		System.out.println(user);
		assertNotNull(user);
	}
	/**
	 * 保存用户功能测试
	 * @throws SQLException
	 */
	@Test
	public void saveUserTest() throws SQLException {
		// UserDao中的保存用户的功能
		// 怎么查询序列的值？
		String IdSQL = "select SEQ_USERID.nextval from dual";
		String sql = "insert into t_user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		// 得到下一个用户的ID的序列值
		Object idString = runner.query(IdSQL, new ScalarHandler<>());
		System.out.println(Integer.parseInt(String.valueOf(idString)));
		
		// 新建一个用户
		int userid = Integer.parseInt(String.valueOf(idString));
		User user = new User();
		user.setUserid(userid);
		user.setName("cuipp");
		user.setPswd("123123");
		user.setEmail("1462256657@qq.com");
		user.setPhone("18434362302");
		
		int nums = runner.update(sql
				,user.getUserid()
				,user.getName()
				,user.getPswd()
				,user.getEmail() 
				,user.getPhone() 
				,user.getIcon() 
				,user.getMoney() 
				,user.getVipscore() 
				,user.getViplevel() 
				,user.getStatus()
				);
		
		System.out.println(nums);
		
	}
	/**
	 * 保存商品功能测试
	 * @throws SQLException
	 */
	@Test
	public void saveGoodsTest() throws SQLException {
		// UserDao中的保存用户的功能
		// 怎么查询序列的值？
		String IdSQL = "select SEQ_GID.nextval from dual";
		String sql = "insert into t_goods(gid, name, details, price, numbers, discount, time, type, picpath) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
		// 得到下一个用户的ID的序列值
		Object idString = runner.query(IdSQL, new ScalarHandler<>());
		System.out.println(Integer.parseInt(String.valueOf(idString)));
		
		// 新建一个用户
		int goodsid = Integer.parseInt(String.valueOf(idString));
		Goods goods = new Goods();
		goods.setGid(goodsid);
		goods.setName("这是一个商品");
		goods.setDetails("这是一个商品的详情描述");
		goods.setPrice(123.45);
		goods.setNumbers(12312);
		goods.setDiscount(0.98);
		goods.setTime(new Date());
		goods.setType(1);
		goods.setPicpath("123131231.jpg");
		
		int nums = runner.update(sql
				,goods.getGid()
				,goods.getName()
				,goods.getDetails()
				,goods.getPrice()
				,goods.getNumbers()
				,goods.getDiscount()
				,goods.getTime()
				,goods.getType() 
				,goods.getPicpath()
				);
				
		System.out.println(nums);
	}
	
//	/**
//	 * 向商品表中添加数据
//	 * @throws SQLException
//	 */
//	@Test
//	public void GoodsDateInputTest() throws SQLException {
//		String path = "E:\\商品表.xlsx";
//		
//		List<Goods> goodsList = new ArrayList<>();
//		
//		// 
//		
//		try {
//            InputStream is = new FileInputStream(path);
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
//            Sheet sheet = xssfWorkbook.getSheet("sheet");
//            Random random = new Random(10);
//            for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum ++) {
//                Row row = sheet.getRow(rowNum);
//                Cell imgString = row.getCell(0);
//                Cell nameString = row.getCell(1);
//                Cell detailsString = row.getCell(2);
//                Cell priceString = row.getCell(3);
//
//                Goods goods = new Goods();
//                goods.setName(nameString.getStringCellValue());
//                goods.setDetails(detailsString.getStringCellValue());
//                goods.setPrice(Double.parseDouble(priceString.getStringCellValue()));
//                goods.setPicpath(imgString.getStringCellValue());
//                // 对商品的其它属性进行随机设置
//                goods.setDiscount(random.nextDouble());
//                goods.setType(random.nextInt(10));
//                goods.setNumbers(random.nextInt(1000));
//                goods.setTime(new Date());
//                goodsList.add(goods);
//
//                System.out.println( rowNum + "\t" + imgString.getStringCellValue()
//                        + "\t" + nameString.getStringCellValue()
//                        + "\t" + detailsString.getStringCellValue()
//                        + "\t" + priceString.getStringCellValue());
//
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//		
//		// 保存商品到表中
//		GoodsDao goodsDao = new GoodsDao();
//		for (Goods goods : goodsList) {
//			goodsDao.saveGoods(goods);
//		}
//		
//		
//		
//	}
	
//	@Test
//	public void timeTest() {
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
//		Date date = new Date();
//		System.out.println(dateFormat.format(date));
//		
//	}
//	
//	
//	/**
//	 * 向中国行政区划表中添加数据
//	 * @throws SQLException
//	 */
//	@Test
//	public void ChinaDivisionDataInputTest() throws SQLException{
//		
//		QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
//		
//		String path = "E:\\全国行政区划表.xlsx";
//		
//		try {
//            InputStream is = new FileInputStream(path);
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
//            Sheet sheet = xssfWorkbook.getSheetAt(0);
//            
////            System.out.println(sheet.getLastRowNum());
////            String string = sheet.getRow(sheet.getLastRowNum()).getCell(0).getStringCellValue();
////            String[] strings = string.split(" ");
////            System.out.println(sheet.getRow(sheet.getLastRowNum()).getCell(0).getStringCellValue());
////            System.out.println(strings.length);
////            for (String string2 : strings) {
////				System.out.println(string2);
////			}
////            System.out.println(sheet.getRow(0).getCell(0).getStringCellValue());
//            
//            for (int rowNum = 0; rowNum <= sheet.getLastRowNum(); rowNum ++) {
//                
//            	Row row = sheet.getRow(rowNum);
//                Cell string = row.getCell(0);
//                
//                if (string.getStringCellValue().trim().length() == 0) {
//					continue;
//				}
//                
//                String[] strings = string.getStringCellValue().split(" ");
//                
//                String code = strings[0].trim();
//                String name = strings[1];
//                
//                String pro = code.substring(0, 2);
//                String city = code.substring(2, 4);
//                String block = code.substring(4, 6);
//                
//                System.out.println(code);
////                System.out.println(code.length());
////                System.out.println(pro);
////                System.out.println(city);
////                System.out.println(block);
////                System.out.println(name);
////                System.out.println(name.length());
//                
//                // 保存到数据库中
//                
//                String sql = "insert into t_china_division values(seq_cdid.nextval, ?, ?, ?, ?)";
//                int num = runner.update(sql, Integer.parseInt(pro), city.equals("00") ? 0 : Integer.parseInt(city), block.equals("00") ? 0 : Integer.parseInt(block), name);
//          
//                System.out.println(num);
////                System.out.println(string.getStringCellValue());
//
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//		
//	}
	
//	
}
