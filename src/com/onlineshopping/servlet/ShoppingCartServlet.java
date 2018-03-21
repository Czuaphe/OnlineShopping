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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.onlineshopping.dao.GoodsDao;
import com.onlineshopping.dao.UserDao;
import com.onlineshopping.entity.Goods;
import com.onlineshopping.entity.User;

/**
 * Servlet implementation class ShoppingCartServlet
 * 从session 得到购物车信息，使用JSON传送到页面
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1、判断是否登录，如果为是，进行下一步，如果为否，直接跳转到登录页面。
		// 2、得到购物车数据，包装成JSON格式
		
		HttpSession session = request.getSession();
		
		
//		User userTemp = new UserDao().getName("test");
//		session.setAttribute("user", userTemp);
//		
//		Map<Integer, Integer> shoppingCartTemp = new HashMap<Integer, Integer>();
//		shoppingCartTemp.put(5159, 2);
//		session.setAttribute("ShoppingCart", shoppingCartTemp);
		
		User user = (User) session.getAttribute("user");
		
		if (user == null) {
			response.sendRedirect("login.jsp");
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

		JsonObject json = new JsonObject();
		JsonArray items = new JsonArray();
		Map<Integer, Integer> shoppingCart = (Map<Integer, Integer>) session.getAttribute("ShoppingCart");
		
		if (shoppingCart != null) {
			for (Integer gid : shoppingCart.keySet()) {
				JsonObject item = new JsonObject();

				Goods goods = new GoodsDao().getGoodsByGid(gid);
//				System.out.println(new Gson().toJson(goods));
				item.add("goods", new JsonParser().parse(new Gson().toJson(goods)).getAsJsonObject());

				item.addProperty("number", shoppingCart.get(gid));

				items.add(item);
			}
		}
		json.add("data", items);
        response.setHeader("Access-Control-Allow-Origin", "*");  
		response.setHeader("Content-type", "text/html;charset=UTF-8"); 
		response.setCharacterEncoding("utf-8");
		System.out.println(json.toString());
		response.getWriter().write(gson.toJson(json));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
