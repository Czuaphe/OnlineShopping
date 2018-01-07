<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uname = request.getParameter("uname");
	if("admin".equals(uname)){
		out.print("true");
	}else{
		out.print("false");
	}
%>
