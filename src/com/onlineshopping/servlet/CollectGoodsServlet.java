package com.onlineshopping.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.UserCollectGoodsDao;
import com.onlineshopping.entity.User;

/**
 * Servlet implementation class CollectGoodsServlet
 */
@WebServlet("/CollectGoodsServlet")
public class CollectGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

	    System.out.println("收到ajax请求");

	    String gid = request.getParameter("gid");

	    if (gid == null) {
	        System.out.print("没有得到参数gid的值！");
        } else {
	        System.out.println("得到的gid值为" + gid);
        }



        User user = (User) session.getAttribute("user");

        String responseStr = "Failure";

        if (user == null) {
            System.out.println("用户没有登录");
            responseStr = "NotLogin";
        } else {
            // 登录之后，收藏商品
        	try {
				boolean b = new UserCollectGoodsDao().collectGoods(user.getUserid(), Integer.parseInt(gid));
				if (b) {
					// 收藏成功，返回成功标志
		            responseStr = "Success";
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
            
        }

		response.getWriter().write(responseStr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served doPost at: ").append(request.getContextPath());
	}

}
