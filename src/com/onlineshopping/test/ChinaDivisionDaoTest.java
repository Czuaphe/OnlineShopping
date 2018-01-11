package com.onlineshopping.test;

import static org.junit.Assert.*;

import java.util.Map;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;

import com.onlineshopping.dao.ChinaDivisionDao;

public class ChinaDivisionDaoTest {
	
	private ChinaDivisionDao china = new ChinaDivisionDao();
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void getAllProvincesTest() {
		Map<Integer, String> map = china.getAllProvinces();
		Set<Integer> set = map.keySet();
		for (Integer integer : set) {
			System.out.println(integer + ", " + map.get(integer));
		}
		assertNotNull(map);
	}
	
	@Test
	public void getAllCitiesTest() {
		Map<Integer, String> map = china.getAllCities(14);
		Set<Integer> set = map.keySet();
		for (Integer integer : set) {
			System.out.println(integer + ", " + map.get(integer));
		}
		assertNotNull(map);
	}
	
	@Test
	public void getAllBlocksTest() {
		Map<Integer, String> map = china.getAllBlock(14, 1);
		Set<Integer> set = map.keySet();
		for (Integer integer : set) {
			System.out.println(integer + ", " + map.get(integer));
		}
		assertNotNull(map);
	}

}
