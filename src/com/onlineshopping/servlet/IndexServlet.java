package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.User;
import com.onlineshopping.service.GoodsService;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private GoodsService goodsService = new GoodsService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
    }

	/**
	 * 此方法会得到index.jsp页面所需要的数据
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// 测试时，假设其已经登录
        User user1 = new User();
        user1 = new UserDao().queryByUserID(1014);
        session.setAttribute("user", user1);
		
		request.setAttribute("flag", true);
		
		request.setAttribute("hotGoodsList", goodsService.getHotGoods());
		
		request.setAttribute("newGoodsList", goodsService.getNewGoods());
		
		request.setAttribute("discountGoodsList", goodsService.getDiscountGoods());
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served doPost at: ").append(request.getContextPath());
	}

}
