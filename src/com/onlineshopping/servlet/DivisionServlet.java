package com.onlineshopping.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshopping.dao.ChinaDivisionDao;

public class DivisionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag=req.getParameter("flag");
		ChinaDivisionDao dao=new ChinaDivisionDao();
		String p="";
		String q="";
		if("1".equals(flag)){
			Map<Integer, String> provinces=dao.getAllProvinces();
			p+="[";
			int i=0;
			int size=provinces.size();
			for(Integer key:provinces.keySet()){
				p+="\""+key+"\",";
				p+="\""+provinces.get(key)+"\"";
				i++;
				if(i<size){
					p+=",";
				}
			}
			p+="]";
		}else if("2".equals(flag)){
			String _pid=req.getParameter("pid");
			int pid=Integer.parseInt(_pid);
			Map<Integer, String> citys=dao.getAllCities(pid);
			p+="[";
			int i=0;
			int size=citys.size();
			int cid=0;
			boolean b=true;
			for(Integer key:citys.keySet()){
				if(b){
					cid=key;
					b=false;
				}
				p+="\""+key+"\",";
				p+="\""+citys.get(key)+"\"";
				i++;
				if(i<size){
					p+=",";
				}
			}
			p+="]";
			
			Map<Integer,String> countys=dao.getAllBlock(pid, cid);
			q+="[";
			i=0;
			size=countys.size();
			for(Integer key:countys.keySet()){
				if(b){
					cid=key;
					b=false;
				}
				q+="\""+key+"\",";
				q+="\""+countys.get(key)+"\"";
				i++;
				if(i<size){
					q+=",";
				}
			}
			q+="]";
			p="["+p+","+q+"]";
		}else if("3".equals(flag)){
			String _pid=req.getParameter("pid");
			String _cid=req.getParameter("cid");
			int pid=Integer.parseInt(_pid);
			int cid=Integer.parseInt(_cid);
			Map<Integer, String> countys=dao.getAllBlock(pid, cid);
			p+="[";
			int i=0;
			int size=countys.size();
			for(Integer key:countys.keySet()){
				p+="\""+key+"\",";
				p+="\""+countys.get(key)+"\"";
				i++;
				if(i<size){
					p+=",";
				}
			}
			p+="]";
		}
		resp.setContentType("text/html;charset=UTF-8");
		resp.setHeader("Cache-Control", "no-cache");
		resp.getWriter().write(p);
	}
}
