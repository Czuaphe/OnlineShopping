package com.onlineshopping.test;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

/**
 * 测试goods_details.jsp页面
 * @author admin
 *
 */
public class JSPGoodsDetails {
	
	/**
	 * 1、直接访问页面，没参数
	 * 2、直接访问页面，有gid参数，但是不正确
	 * 
	 */
	
	@Before
	public void setUp() throws Exception {}
	
	/**
	 * 简单测试自动测试框架
	 */
	@Test
	public void SeleniumTest() {
		
		// 设置Chrome的驱动
        String path = "C:\\Users\\鹏鹏\\Pictures\\chromedriver_win32\\chromedriver.exe";
        System.setProperty("webdriver.chrome.driver", path);
        // 在Chrome中得到网页
        WebDriver webDriver = new ChromeDriver();
        webDriver.manage().window().maximize();
        webDriver.get("http://localhost:8080/OnlineShopping/goods_details.jsp?gid=5155");
        
	}
	
	/**
	 * 测试模拟框架mockito
	 */
	@Test
	public void MockitoTest() {
		List mock = mock( List.class );  
		when( mock.get(0) ).thenReturn( 1 );  
		assertEquals( "预期返回1", 1, mock.get( 0 ) );// mock.get(0) 返回 1  
	}
	
	@Test
	public void directSeeJSPTest() {
		HttpServletRequest request = mock(HttpServletRequest.class);  
		when(request.getParameter("gid")).thenReturn("1001");
		
	}
	
	

}
