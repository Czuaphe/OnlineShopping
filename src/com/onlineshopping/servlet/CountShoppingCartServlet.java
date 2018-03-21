package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class CouneShoppingCartServlet
 * 得到从页面返回的购物车数据
 */
@WebServlet("/CountShoppingCartServlet")
public class CountShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = 0;
		Map<Integer, Integer> newShoppingCart = new HashMap<>();
		
		while (true) {
			
			String gid = request.getParameter("info["+ num + "][gid]");
			String number = request.getParameter("info[" + num + "][number]");
			System.out.println("gid " + num + ":" + gid);
			System.out.println("number " + num + ":" + number);
			if (gid == null || number == null) {
				break;
			}
			newShoppingCart.put(Integer.parseInt(gid), Integer.parseInt(number));
			
			num ++;
		}
	
		System.out.println("newShoppingCart size:" + newShoppingCart.size());
		for (Integer gid : newShoppingCart.keySet()) {
			System.out.println("gid:" + gid);
			System.out.println("number:" + newShoppingCart.get(gid));
		}
		
		// 将新的购物车数据放入session中
		request.getSession().setAttribute("ShoppingCart", newShoppingCart);
		
		// 设置Date类型的对象的输出格式。（Timestamp类型不行）
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		// 设置返回数据
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("status", true);
		
		response.setHeader("Access-Control-Allow-Origin", "*");   
		System.out.println(jsonObject.toString());
		response.getWriter().write(gson.toJson(jsonObject));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
