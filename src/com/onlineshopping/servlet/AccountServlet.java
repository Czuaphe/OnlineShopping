package com.onlineshopping.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.dao.UserLoginLogDao;
import com.onlineshopping.entity.User;
import com.onlineshopping.entity.UserLoginLog;

public class AccountServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*HttpSession session=req.getSession();
		Integer userid=(Integer)session.getAttribute("uid");*/
		UserDao userDao=new UserDao();
		UserLoginLogDao loginDao=new UserLoginLogDao();
		User user=userDao.queryByUserID(100);
		UserLoginLog userLoginLog=loginDao.queryRecentLogin(100);
		int count=loginDao.queryCountByUserID(100);
		req.setAttribute("user", user);
		req.setAttribute("userLoginLog", userLoginLog);
		req.setAttribute("count", count);
		req.getRequestDispatcher("userinfo.jsp").forward(req, resp);
	}

}
