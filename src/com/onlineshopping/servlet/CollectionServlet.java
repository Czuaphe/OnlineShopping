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
import com.onlineshopping.entity.User;

public class CollectionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CollectionDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		String flag=req.getParameter("flag");
		//ɾ���ղ���Ʒ
		if("delete".equals(flag)) {
			String _cid=req.getParameter("cid");
			int cid=Integer.parseInt(_cid);
			if(dao.deleteCollectGoods(cid)) {
				resp.getWriter().write("true");
			}else {
				resp.getWriter().write("false");
			}
		}
		//�鿴�ղ���Ʒ
		else {
			dao=new CollectionDao();
			try {
				List<Collection> colls=dao.getUserCollectionByUid(user.getUserid());
				req.setAttribute("colls", colls);
				req.getRequestDispatcher("collection.jsp").forward(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
