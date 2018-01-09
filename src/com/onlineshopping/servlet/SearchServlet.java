package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshopping.entity.Goods;
import com.onlineshopping.service.GoodsService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private GoodsService goodsService = new GoodsService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageSize = 20;
		
		String key = request.getParameter("key");
		if (key == null) {
			// 如果key为null说明请求是从search页面来的
			key = (String) request.getAttribute("key");
			int page = Integer.parseInt(request.getParameter("page"));
			request.setAttribute("searchGoodsList", goodsService.getSearchResult(key, page, pageSize));
			
		} else {
			// 请求从index页面来的
			request.setAttribute("searchGoodsList", goodsService.getSearchResult(key, 1, pageSize));
			request.setAttribute("searchCount", goodsService.getSearchCount(key));
			request.setAttribute("key", key);
		}
		
		
		
		
		request.getRequestDispatcher("search.jsp").forward(request, response);
		
//		response.getWriter().append("Served doGet at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served doGet at: ").append(request.getContextPath());
	}

}
