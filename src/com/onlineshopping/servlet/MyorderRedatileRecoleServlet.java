package com.onlineshopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.dev.EFBiffViewer;

import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.MyorderRecordDao;
import com.onlineshopping.dao.UserAddressDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.Record;
import com.onlineshopping.entity.RecordDetails;
import com.onlineshopping.entity.UserAddress;

/**
 * Servlet implementation class MyorderRedatileRecoleServlet
 */
@WebServlet("/MyorderRedatileRecoleServlet")
public class MyorderRedatileRecoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//接收参数 rid 
		String srid = request.getParameter("rid");
		Integer rid = Integer.parseInt(srid);
		out.println(rid);
		//int rid = 1;
		try {
			//订单记录详情
			MyorderRecordDao myorderRecordDao = new MyorderRecordDao();
			List<RecordDetails>  recordDetails = myorderRecordDao.reDtaislId(rid);
			request.setAttribute("recordDetails", recordDetails);
			List<Integer> gidlist = new ArrayList<>();
			for (RecordDetails recordDetail : recordDetails) {
				gidlist.add(recordDetail.getGid());
				
			}
			System.out.println(recordDetails.size());
			for (Integer integer : gidlist) {
				int  gidAll = integer.intValue();
				System.out.println(gidAll);
				if(gidAll!=0) {
				//通过商品号得到订单中商品的详细信息
				GoodsDao goodsDao = new GoodsDao();
				Goods goods = goodsDao.getGoodsByGid(gidAll);
				request.setAttribute("good", goods);
				System.out.println(goods.toString());
					}
			}
				//订单记录
				Record records = myorderRecordDao.recordsOne(rid);
				request.setAttribute("records", records);
				//获取  地址     id
				int uaid = records.getAddscore();
				System.out.println(uaid);
				UserAddressDao userAddressDao = new UserAddressDao();
				UserAddress address = userAddressDao.getAddress(uaid);
				request.setAttribute("useaddress", address);
				System.out.println(address);
				request.getRequestDispatcher("myorderlistDetails.jsp").forward(request, response);
				return;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
