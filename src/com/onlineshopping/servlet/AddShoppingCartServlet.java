package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 向购物车里增加商品
 */
@WebServlet("/AddShoppingCartServlet")
public class AddShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gid = Integer.parseInt(request.getParameter("gid"));
		
		// 将商品放入session中的购物车中
		System.out.println("后台已经得到商品ID为：" + gid);
		
		HttpSession session = request.getSession();
		
		// 得到session中的购物车
		Map<Integer, Integer> shoppingCart = null;
		Object object = session.getAttribute("ShoppingCart");
		if (object != null && object instanceof Map) {
			shoppingCart = (Map<Integer, Integer>) object;
		} else {
			shoppingCart = new HashMap<>();
		}
		
		// 将得到的商品ID放入购物车中
		if (shoppingCart.containsKey(gid)) {
			shoppingCart.put(gid, shoppingCart.get(gid) + 1);
		} else {
			shoppingCart.put(gid, 1);
		}
		
		// 将购物车放回session中
		session.setAttribute("ShoppingCart", shoppingCart);
		
		// 输出购物车中的所有商品
		System.out.println("购物车中的所有商品有：");
		for (Integer integer : shoppingCart.keySet()) {
			System.out.println(integer + " : " + shoppingCart.get(integer));
		}
		response.getWriter().write("true");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
