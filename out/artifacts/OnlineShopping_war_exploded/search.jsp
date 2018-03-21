<%@page import="com.onlineshopping.db.DBUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>

<!-- 框架所需CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/web-fonts.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">

<!-- 用户自定义CSS文件 -->
<link rel="stylesheet" href=" ./css/shop.css">

<!-- 框架所需JS文件 -->
<script src="./js/base/jquery-3.2.1.min.js"></script>
<script src="./js/base/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>


</head>
<body>

	<%
		List<Goods> searchGoodsList = (List<Goods>) request.getAttribute("searchGoodsList");
		int count = (int) request.getAttribute("searchCount");
		int page1 = (int) request.getAttribute("page");
		int pageSize = (int) request.getAttribute("pageSize");
		
	%>

	<div class="shop_header">
		<div class="container">
			<div class="col-xs-6 header_left">
				<p>欢迎光临电子在线购物平台！！</p>
				<a href="#"><i class="fa fa-weixin"></i></a>
				<hr>
				<a href="#"><i class="fa fa-qq"></i></a>
				<hr>
				<a href="#"><i class="fa fa-weibo"></i></a>
			</div>
			<div class="col-xs-6 header_right">
				<!-- 购物车功能 -->
				<div class="shopping_cart">
					<!-- 目前不进行下拉菜单的开发  class="dropdown-toggle" data-toggle="dropdown" -->
					<a href="#"> <i class="fa fa-shopping-cart"></i>购物车<span
						class="badge badge-danger">0</span>
					</a>
					<!-- 购物车下拉菜单（可选功能，尽力实现） -->
					<div class="dropdown-menu pull-right">
						<ul>
							<li><span class="dropdown_title"><b>购物车</b></span> <span
								class="badge badge-danger" style="">共 0 件商品</span></li>
						</ul>
						<div style="text-align: center; line-height: 100px;">没有商品</div>
					</div>
				</div>
				<!-- 登录之后的用户信息显示功能 -->
				<!--<div class="user_info">-->
				<!--<img class="icon_pic" src="img/pic_icon.png" alt="">-->
				<!--&lt;!&ndash; 目前不进行下拉菜单的开发 class="dropdown-toggle" data-toggle="dropdown" &ndash;&gt;-->
				<!--<a href="#">cui<b class="caret" style="margin-left: 10px;"></b></a>-->
				<!--&lt;!&ndash; 用户信息下拉菜单（下拉菜单是个坑） &ndash;&gt;-->
				<!--<div class="dropdown-menu pull-right"  style="width: 100px;color: #000; padding: 0;">-->
				<!--<ul style="list-style: none;padding: 0; text-align: left; line-height: 25px">-->
				<!--<li style="padding: 8px 15px; ">-->
				<!--<a href="#" style="color: #000;"><i class="fa fa-user" style="margin-right: 10px; font-size: 16px;"></i>个人中心</a>-->
				<!--</li>-->
				<!--<li style="padding: 8px 15px;"><i class="fa fa-qq" style="margin-right: 10px; font-size: 16px;"></i>订单中心</li>-->
				<!--<li style="padding: 8px 15px;"><i class="fa fa-weixin" style="margin-right: 10px; font-size: 16px;"></i>退出登录</li>-->
				<!--</ul>-->
				<!--</div>-->
				<!--</div>-->
				<!-- 登录之前的显示登录注册功能 -->
				<div class="list_func">
					<ul>
						<li><a href="#">注册</a></li>
						<hr>
						<li><a href="#">登录</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>

	<div class="shop_nav">
		<div class="container">
			<div class="col-xs-2 logo">
				<img src="./img/logos.png" alt="">
			</div>
			<div class="col-xs-7 nav_box">
				<ul>
					<li><a href="#">全部种类</a></li>
					<li><a href="#">品牌故事</a></li>
					<li><a href="#">热点新闻</a></li>
					<li><a href="#">售后服务</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
			<div class="col-xs-3 search_box">
				<form action="SearchServlet">
					<input type="text" id="input_search" name="key" placeholder="请输入关键字" />
					<button type="submit" class="fa fa-search" id="btn_search"></button>
				</form>
			</div>
		</div>
	</div>

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

	<div class="shop_footer">
		<div class="container">
			<div class="footer_pic">
				<ul>
					<li><a href="#"><i class=" fa wb-dashboard"></i>预约维修服务</a></li>
					<li><a href="#"><i class="fa wb-inbox"></i>7天无理由退货</a></li>
					<li><a href="#"><i class="fa wb-envelope-open"></i>15天免费换货</a></li>
					<li><a href="#"><i class="wb-pluse"></i>满150元包邮</a></li>
					<li><a href="#"><i class="wb-gallery"></i>520余家售后网点</a></li>
				</ul>
			</div>
			<div class="footer_text">
				<div class="footer_content">
					<ul>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
						<li>
							<div>
								<span class="content_option">帮助中心</span><span>帐号中心</span><span>帐号中心</span><span>帐号中心</span>
							</div>
						</li>
					</ul>
				</div>
				<div class="footer_info">
					<div class="info_content">
						<span class="info_call">4000-000-000</span> <span
							class="info_time">服务时间 9:00-22:00</span> <span
							class="info_connection"> <i class="fa fa-weibo"></i> <i
							class="fa fa-weixin"></i> <i class="fa fa-qq"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="shop_copyright">
		<div class="container">
			<span class="copyright_info">化妆品商城 版权所有 © 2018-2020
				湘ICP备8888888 （本网站内容为演示数据）</span> <span class="copyright_powered">Powered
				by <a href="#">Czuaphe</a> 5.3.19
			</span>
		</div>
	</div>

	<!-- 用户自定义JS文件 -->
	<script src="./js/shop.js"></script>

</body>
</html>