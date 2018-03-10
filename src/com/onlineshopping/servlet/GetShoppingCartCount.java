package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class GetShoppingCartCount
 */
@WebServlet("/GetShoppingCartCount")
public class GetShoppingCartCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static Logger logger = Logger.getLogger(GetShoppingCartCount.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetShoppingCartCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.debug("do Get Method");
		System.out.println("do Get Method");
		// 返回购物车的购物的数量
		HttpSession session = request.getSession();
		
		Object object = session.getAttribute("ShoppingCart");
		int count = 0;
		
		if (object != null) {
			Map<Integer, Integer> shoppingCart = (Map<Integer, Integer>) object;
			for(Integer key : shoppingCart.keySet()) {
				count += shoppingCart.get(key);
			}
		}
		System.out.println(count);
		response.getWriter().write(String.valueOf(count));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.debug("doPost Method");
		doGet(request, response);
	}

}
