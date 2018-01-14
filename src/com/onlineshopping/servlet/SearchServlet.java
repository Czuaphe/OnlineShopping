package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		int pageSize = 10;
		int page = 0;
		
		String key = request.getParameter("key");
		if (key == null) {
			key = (String) session.getAttribute("key");
		} else {
			session.setAttribute("key", key);
		}
		
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		request.setAttribute("searchGoodsList", goodsService.getSearchResult(key, page, pageSize));
		request.setAttribute("searchCount", goodsService.getSearchCount(key));
//		System.out.println(goodsService.getSearchCount(key));
		request.setAttribute("page", page);
		request.setAttribute("pageSize", pageSize);
		
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
