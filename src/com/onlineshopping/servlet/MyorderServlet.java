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

import com.onlineshopping.entity.Record;
import com.onlineshopping.service.UserRecordService;

public class MyorderServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		UserRecordService urs = new UserRecordService();
		try {
			List<Record> list = urs.selctAll();
			/*for (Record record : list) {
				System.out.println(record.toString());
			}*/
			req.setAttribute("ulist", list);
			req.getRequestDispatcher("myorder.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
