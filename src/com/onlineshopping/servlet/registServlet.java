package com.onlineshopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.User;
import java.awt.Color;

import java.awt.Font;

import java.awt.Graphics;

import java.awt.image.BufferedImage;

import java.io.IOException;

import java.util.Random;

import javax.imageio.ImageIO;

import javax.servlet.ServletOutputStream;
/**
 * Servlet implementation class registeServlet
 */
@WebServlet("/registServlet")
public class registServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		UserDao ud=new UserDao();
		//响应客户端
		PrintWriter out=response.getWriter();
		//获取用户名
		String uname=request.getParameter("username");
		User user=ud.getName(uname);
		if(user==null) {
			user=new User();
		    user.setName(uname);
		    String pswd=request.getParameter("password");
		    System.out.println(pswd);
			user.setPswd(pswd);
			String phone=request.getParameter("phone");
			 System.out.println(phone);
			user.setPhone(phone);
			String email=request.getParameter("emailt");
			 System.out.println(email);
			user.setEmail(email);
			ud.saveUser(user);
			//重定向
			response.sendRedirect("index.jsp");
		}
		else {
			response.setHeader("refresh","3;url=regist.jsp");
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		}
		

}


