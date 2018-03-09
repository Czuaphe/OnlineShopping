package com.onlineshopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gargoylesoftware.htmlunit.javascript.host.fetch.Request;
import com.onlineshopping.dao.MyorderRecordDetatisDao;
import com.onlineshopping.entity.RecordDetails;

/**
 * Servlet implementation class MyorderRedatileRecoleServlet
 */
@WebServlet("/MyorderRedatileRecoleServlet")
public class MyorderRecoledatileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyorderRecoledatileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		/*MyorderRecordDetatisDao recordDetatisDao = new MyorderRecordDetatisDao();
		List< RecordDetails> list = recordDetatisDao.reDtaislId(rid)
		request.setAttribute("relist", list);
		List<Integer> ridlist = new ArrayList<>();
		for (RecordDetails recordDetails : list) {
			
		}*/
		
		
	}

}
