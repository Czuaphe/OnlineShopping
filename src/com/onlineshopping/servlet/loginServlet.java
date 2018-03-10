package com.onlineshopping.servlet;

import com.onlineshopping.entity.User;
import com.onlineshopping.dao.UserDao;
import com.onlineshopping.db.DBUtils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet{
	
		public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	    }
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			UserDao ud=new UserDao();
			//获取用户名
			String uname=req.getParameter("username");
			//获取密码
			String pwd=req.getParameter("password");
			User user;
			try {
				user = ud.getName(uname);
				if(user!=null) {
					if(pwd.equals(user.getPswd())) {
						resp.sendRedirect("index.jsp");
					}else {
						System.out.print("<script language='javascript'>setTimeout(go, 3000);alert('密码错误');</script>");
						resp.setHeader("refresh","3;url=login.jsp");
					}
				}else{
					System.out.println("<script language='javascript'>setTimeout(go, 3000);alert('用户名不存在');</script>");
					resp.setHeader("refresh","3;url=login.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		}
		
}
