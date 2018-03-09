package com.onlineshopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.MyorderRecordDao;
import com.onlineshopping.dao.MyorderRecordDetatisDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;


public class MyorderServlet extends HttpServlet {
	   
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		try {
			
			MyorderRecordDao myorderRecordDao = new MyorderRecordDao();
			//从订单记录表中查询，得到订单号
			List<Record> list = myorderRecordDao.recodeAll();
			System.out.println(list.get(0).toString());
			req.setAttribute("record", list.get(0));
			//提取订单号
			List<Integer> ridList = new ArrayList<>();
			for (Record record : list) {
				ridList.add(record.getRid());
			}
			int rid = ridList.get(0);
			
			if(rid != 0) {
				//通过订单号得到关于订单详情表，得到订单中商品号
				MyorderRecordDetatisDao MyorderRecordDetatisDao=new MyorderRecordDetatisDao();
				List<RecordDetails> list1= MyorderRecordDetatisDao.reDtaislId(rid);
				for (RecordDetails recordDetails : list1) {
					System.out.println(recordDetails.toString());
				}
				req.setAttribute("recorddetails", list1.get(0));
				//通过订单号保存保存商品号
				int gid = list1.get(0).getGid();
				if(gid!=0) {
					//通过商品号得到订单中商品的详细信息
					GoodsDao goodsDao = new GoodsDao();
					Goods goods = goodsDao.getGoodsByGid(gid);
					req.setAttribute("good", goods);
					System.out.println(goods.toString());
					req.getRequestDispatcher("myorder.jsp").forward(req, resp);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
