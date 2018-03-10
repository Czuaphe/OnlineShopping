package com.onlineshopping.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.CollectionDao;
import com.onlineshopping.entity.Collection;

public class CollectionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CollectionDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.setAttribute("user", "zhang");
		session.setAttribute("uid", "100");
		dao=new CollectionDao();
		try {
			List<Collection> colls=dao.getUserCollectionByUid(100);
			req.setAttribute("colls", colls);
			req.getRequestDispatcher("collection.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
