<%@page import="com.onlineshopping.db.DBUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

	<%
		List<Goods> searchGoodsList = (List<Goods>) request.getAttribute("searchGoodsList");
		int count = (int) request.getAttribute("searchCount");
		int page1 = (int) request.getAttribute("page");
		int pageSize = (int) request.getAttribute("pageSize");
		
	%>

	<div class="shop_lunbo">
		<div class="container">
			<div class="swiper-container lunbo_container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="./img/lunbo-1.jpg" alt="">
					</div>
					<div class="swiper-slide">
						<img src="./img/lunbo-2.jpg" alt="">
					</div>
					<div class="swiper-slide">
						<img src="./img/lunbo-3.jpg" alt="">
					</div>
					<div class="swiper-slide">
						<img src="./img/lunbo-4.jpg" alt="">
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>

	<div class="shop_type" style="height: 76px;">
		<div class="container">
			<ul style="list-style: none; display: block; margin: 0 auto;">
				<li style="float: left;"><a href="#" style="">全部商品</a></li>
				<li style="float: left;"><a href="#" style="">美容护肤</a></li>
				<li style="float: left;"><a href="#" style="">彩妆 靓妆</a></li>
				<li style="float: left;"><a href="#" style="">眼部 唇部护理</a></li>
				<li style="float: left;"><a href="#" style="">香氛 香水</a></li>
				<li style="float: left;"><a href="#" style="">美发 亮发</a></li>
				<li style="float: left;"><a href="#" style="">精油SPA</a></li>
				<li style="float: left;"><a href="#" style="">肌肤护理 修复</a></li>
				<li style="float: left;"><a href="#" style="">身体保洁</a></li>
				<li style="float: left;"><a href="#" style="">化妆工具</a></li>
				<li style="float: left;"><a href="#" style="">其它</a></li>
			</ul>
		</div>
	</div>

	<div class="shop_result" style="background-color: #f5f5f5">
		<div class="container" style="padding-top: 50px;">
			<div class="result_item" style="height: 748px;">
				
					<%
						if (searchGoodsList != null && searchGoodsList.size() != 0 && count != 0) {
					%>
					<ul>
					<%
							for (Goods goods : searchGoodsList) {
					%>
					<li>
						<div class="discount_pic">
							<a href="goods_details.jsp?gid=<%= goods.getGid() %>">
								<div class="discount_item">
									<%
										String[] picList = goods.getPicpath().split(",");
										DecimalFormat df = (DecimalFormat) DecimalFormat.getInstance();
										df.applyPattern("##.##");
									%>
									<img src="./img/400_400/<%=picList[0]%>" alt=""> <b><%=goods.getName()%></b>
									<i><%=goods.getDetails()%></i>
									<div class="item_price">
										<del>
											￥<%=goods.getPrice()%>元
										</del>
										<span>￥<%=df.format(goods.getPrice() * goods.getDiscount())%>元
										</span>
									</div>
								</div>
							</a>
						</div>
					</li>
					<%
							}
					%>
					</ul>
					<%
						} else {
					%>
					<span style="text-align:center;display:block;font-size:70px;">没有商品</span>
					<%
						}
					%>
				
			</div>
			<%
			if( count != 0) {
			%>
			<div class="result_page" style="height: 100px;">
				<div style="margin: 0 auto; width: 218px;">
					<ul class="pagination pagination-lg">
						<%-- 显示前一页的箭头 --%>
						<%
						if(page1 != 1) {
						%>
						<li><a href="SearchServlet?page=<%= page1 - 1 %>">&laquo;</a></li>
						<%
						} else {
						%>
						<li><a>&laquo;</a></li>
						<%
						}
						%>
						<%-- 显示前一页的标签 --%>
						<%
						if(page1 != 1) {
						%>
						
						<li><a href="SearchServlet?page=<%= page1 - 1 %>"><%=page1 - 1 %></a></li>
						<% 
						}
						%>
						<%-- 显示当前页的标签 --%>
						<li><a style="color: black;"><%=page1 %></a></li>
						<%-- 显示下一页的标签 --%>
						<%
						if(count - page1 * pageSize > 0) {
						%>
						<li><a href="SearchServlet?page=<%= page1 + 1 %>"><%=page1 + 1 %></a></li>
						
						<% 
						}
						%>
						<%-- 显示下一页的箭头 --%>
						<%
						if(count - page1 * pageSize > 0) {
						%>
						<li><a href="SearchServlet?page=<%= page1 + 1 %>">&raquo;</a></li>
						<%
						} else {
						%>
						<li><a>&raquo;</a></li>
						<%
						}
						%>
						
					</ul>
				</div>
			</div>
			<%
			}
			%>
			
		</div>
	</div>

<%@include file="footer.jsp" %>	
