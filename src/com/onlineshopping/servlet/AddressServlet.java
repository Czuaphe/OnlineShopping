package com.onlineshopping.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshopping.dao.ChinaDivisionDao;
import com.onlineshopping.dao.UserAddressDao;
import com.onlineshopping.entity.UserAddress;

public class AddressServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserAddressDao dao;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.setAttribute("user", "zhang");
		session.setAttribute("uid", 100);
		String flag="init";
		String g=req.getParameter("flag");
		if(!("".equals(g)||null==g)){
			flag=g;
		}
		dao=new UserAddressDao();
		if("init".equals(flag)){
			try {
				List<UserAddress> adds=dao.getUserAddressByUid(100);
				req.setAttribute("adds", adds);
				req.getRequestDispatcher("address.jsp").forward(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("del".equals(flag)){
			int uaid=Integer.parseInt(req.getParameter("uaid"));
			try {
				if(dao.delete(uaid))
					resp.getWriter().write("true");
				else
					resp.getWriter().write("false");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("add".equals(flag)){
			UserAddress a=new UserAddress();
			a.setUserid(Integer.parseInt(req.getParameter("userid")));
			a.setName(req.getParameter("name"));
			a.setPhone(req.getParameter("phone"));
			a.setProvince(req.getParameter("province"));
			a.setCity(req.getParameter("city"));
			a.setBlock(req.getParameter("county"));
			a.setDetails(req.getParameter("details"));
			try {
				int c=dao.insert(a);
				String result="[";
				if(c>0){
					result+="\"true\","+a.getUaid()+"]";
				}else{
					result+="\"false\","+a.getUaid()+"]";
				}
				resp.getWriter().write(result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("edit".equals(flag)){
			ChinaDivisionDao cDao=new ChinaDivisionDao();
			String _uaid=req.getParameter("uaid");
			int uaid=Integer.parseInt(_uaid);
			try {
				UserAddress a=dao.getAddress(uaid);
				
				int pid=cDao.getPid(a.getProvince());
				Map<Integer, String> citys=cDao.getAllCities(pid);
				String p="";
				p+="[";
				int i=0;
				int size=citys.size();
				int cid=0;
				for(Integer key:citys.keySet()){
					if(citys.get(key).equals(a.getCity())){
						cid=key;
					}
					p+="\""+key+"\",";
					p+="\""+citys.get(key)+"\"";
					i++;
					if(i<size){
						p+=",";
					}
				}
				p+="]";
				
				Map<Integer,String> countys=cDao.getAllBlock(pid, cid);
				String q="";
				q+="[";
				i=0;
				int bid=0;
				size=countys.size();
				for(Integer key:countys.keySet()){
					if(countys.get(key).equals(a.getBlock())){
						bid=key;
					}
					q+="\""+key+"\",";
					q+="\""+countys.get(key)+"\"";
					i++;
					if(i<size){
						q+=",";
					}
				}
				q+="]";
				
				String result="{\"userid\":"+a.getUserid()+",\"name\":\""+a.getName()+"\",\"phone\":\""+a.getPhone()+"\",\"province\":\""
				+pid+"\",\"city\":\""+cid+"\",\"block\":\""+bid+"\",\"details\":\""+a.getDetails()+"\"}";
				resp.setContentType("text/html;charset=UTF-8");
				resp.setHeader("Cache-Control", "no-cache");
				resp.getWriter().write("["+result+","+p+","+q+"]");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("alter".equals(flag)){
			alter(req,resp);
		}
	}
	
	public void alter(HttpServletRequest req, HttpServletResponse resp){
		UserAddress a=new UserAddress();
		a.setUaid(Integer.parseInt(req.getParameter("uaid")));
		a.setUserid(Integer.parseInt(req.getParameter("userid")));
		a.setName(req.getParameter("name"));
		a.setPhone(req.getParameter("phone"));
		a.setProvince(req.getParameter("province"));
		a.setCity(req.getParameter("city"));
		a.setBlock(req.getParameter("county"));
		a.setDetails(req.getParameter("details"));
		try {
			if(dao.updateAddress(a)>0){
				resp.getWriter().write("true");
			}else{
				resp.getWriter().write("false");
			}
		} catch (SQLException e) {
			System.out.println("SQLException:异常出现在alter方法中");
		}catch (IOException e) {
			System.out.println("IOException:异常出现在alter方法中");
		}
	}
}
