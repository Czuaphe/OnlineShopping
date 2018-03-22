package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.sql.Timestamp;
import java.util.Date;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.onlineshopping.dao.RecordDao;
import com.onlineshopping.entity.Record;

public class RecordDaoTest {

	private RecordDao recordDao = new RecordDao();
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		
		Record record = new Record();
		
		
		record.setRecnum("19960509123456");
		record.setTime(new Timestamp(new Date().getTime()));
		record.setUserid(1020);
		record.setTotal(13.45);
		record.setAddscore(5);
		record.setStatus(0);
		record.setFreight(0);
		record.setUaid(3020);
		
		System.out.println(record.toString());
		boolean b = recordDao.save(record);
		
		assertEquals(b, true);
		
	}

}
