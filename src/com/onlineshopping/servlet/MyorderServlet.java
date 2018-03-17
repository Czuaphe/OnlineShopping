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
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;

public class MyorderServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		try {

			MyorderRecordDao myorderRecordDao = new MyorderRecordDao();
			// 从订单记录表中查询，得到所有订单号
			List<Record> recordslist = myorderRecordDao.recodeAll();
			/*// 第一条订单
			System.out.println(recordslist.get(0).toString());*/
			// req.setAttribute("record", recordslist.get(0));
			req.setAttribute("record", recordslist);
			// 提取所有的订单号
			List<Integer> ridList = new ArrayList<>();
			for (Record record : recordslist) {
				ridList.add(record.getRid());
			}
			// 得到第一条订单
			// int rid = ridList.get(0);
			// 所有订单 rid
			for (Integer integerrids : ridList) {
				int rids = integerrids.intValue();
				System.out.println(rids);

				if (rids != 0) {
					// 通过订单号得到关于订单详情表，得到订单中商品号
					MyorderRecordDao MyorderRecordDetatisDao = new MyorderRecordDao();
					List<RecordDetails> list1 = MyorderRecordDetatisDao.reDtaislId(rids);
					for (RecordDetails recordDetails : list1) {
						System.out.println(recordDetails.toString());

					}
					// 通过订单号保存保存商品号
					// req.setAttribute("recorddetails", list1.get(0));
					req.setAttribute("recorddetails", list1);
					// 提取所有订单号
					List<Integer> gidlist = new ArrayList<>();
					for (RecordDetails recordDetails : list1) {
						gidlist.add(recordDetails.getGid());
					}

					// 一个订单中的所有商品号
					for (Integer integer : gidlist) {
						int gid = integer.intValue();
						System.out.println(gid);
						if (gid != 0) {
							// 通过商品号得到订单中商品的详细信息
							GoodsDao goodsDao = new GoodsDao();
							Goods goods = goodsDao.getGoodsByGid(gid);
							req.setAttribute("good", goods);
							System.out.println(goods.toString());
							req.getRequestDispatcher("myorder.jsp").forward(req, resp);
							return;
							
						}
					}

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
