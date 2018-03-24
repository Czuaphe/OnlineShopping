<%@page import="com.onlineshopping.entity.Record"%>
<%@page import="com.onlineshopping.entity.UserAddress"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@page import="com.onlineshopping.entity.RecordDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<!-- 框架所需CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/web-fonts.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">

<!-- 用户自定义CSS文件 -->
<link rel="stylesheet" href=" ./css/myorderlist.css">

<!-- 框架所需JS文件 -->
<script src="./js/base/jquery-3.2.1.min.js"></script>
<script src="./js/base/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
<%
List<RecordDetails> recordDetails = (List<RecordDetails>)request.getAttribute("recordDetails");
List<Goods> goodlist = (List<Goods>)request.getAttribute("good");
UserAddress addresses = (UserAddress)request.getAttribute("useaddress");
Record record = (Record)request.getAttribute("records");
%>
</head>
<body>
	<div class="detils">
		<div class="detils_left">
			<div class="detils_left_1"></div>
			<ul>
				<li>
					<h1 style="font-size: 20px; font-weight: normal; color: black">订单中心</h1>
				</li>
				<li><a href="#">个人中心</a></li>
				<li><a href="myorder.jsp">我的订单</a></li>
				<li><a href="#">我的收藏</a></li>
				<li><a href="#">我的优惠券</a></li>
				<li><a href="#">收货地址</a></li>
				<li><a href="#">消费明细</a></li>
				<li><a href="#">账户设置</a></li>
			</ul>

		</div>
		<div class="detils_right">
			<div class="detils_right1">
				<div class="detils_right1_left">
					<div class="detils_right1_left1">
						<img src="img/1.png" alt="" />
					</div>
					<div class="detils_right1_left2">
						<span>待支付</span>
					</div>
				</div>
				<div class="detils_right1_right">
					<div class="detils_right1_right1">
						<span>取消订单</span>
					</div>
					<div class="detils_right1_right2">
						<span>立即付款</span>
					</div>
				</div>
			</div>

			<div class="detils_right3">


				<table style="text-align: center; margin-top: 20px" width="760"
					cellpadding="10" align="center">
					
					<tr>
						<th style="text-align: center; border-bottom: 1px solid #cecece;"
							width="120">商品名称</th>
						<th style="border-bottom: 1px solid #cecece;"></th>
						<th style="text-align: center; border-bottom: 1px solid #cecece;">单价</th>
						<th style="text-align: center; border-bottom: 1px solid #cecece;"
							width="80">数量</th>
						<th style="text-align: center; border-bottom: 1px solid #cecece;"
							width="80">运费</th>
						<th style="text-align: center; border-bottom: 1px solid #cecece;"
							width="150">小计</th>
					</tr>
					
				<%
				int flag = 0;
				for(int i=0;i<recordDetails.size();i++){
					flag=i;
				%>
					<tr>
					
					
						<td style="margin-top: 10px">
						<%
					for(Goods goods:goodlist){
					%>
							<%String[] pics = goodlist.get(i).getPicpath().split(","); %> <img
							src="img/400_400/<%=pics[0] %>"
							style="width: 60px; height: 60px; margin-top: 15px;" />
							
							<%
					break;		
					} %>
						</td>
						
					
						<td 
							<%
					for(Goods goods:goodlist){
					%>
						style="margin-top: 10px"><%=goodlist.get(i).getName() %>
						<%
						break;	
					} %>
						</td>
						
						
						<%
						double price = 0;
						for(Goods goods:goodlist){
							price = goodlist.get(i).getDiscount()*goodlist.get(i).getDiscount();
						}
                    %>
						<td style="margin-top: 10px"><%=price%></td>
						
						
					<%
                   double total = 0;
					for(RecordDetails rd:recordDetails){
                    	total = price*recordDetails.get(i).getNumbers()+record.getFreight();
					}
                    %>
                   
						<td 
						 <%
                    for(RecordDetails rd:recordDetails){
                   		 %>
                    style="margin-top: 10px"><%=recordDetails.get(i).getNumbers() %>
                    
                    <%
                   break;
                    } %>
                    </td>
						
						<td style="margin-top: 10px"><%=record.getFreight() %></td>
						
						<td style="margin-top: 10px"><%=total %></td>
						
					</tr>
<%} %>



				</table>


			</div>
			<div class="detils_right4">
				<div class="detils_right4_top">
					<div class="detils_right4_top_1">
						<div class="detils_right4_top_1_left">
							<span>订单号：</span>

						</div>
						<div class="detils_right4_top_1_right"><%=record.getRecnum() %></div>
					</div>
					<div class="detils_right4_top_2">
						<div class="detils_right4_top_2_left">
							<span>支付方式：</span>

						</div>
						<div class="detils_right4_top_2_right">
							<span><%=record.getPayway() %></span>
						</div>
					</div>
				</div>
				<div class="detils_right4_middle">
					<div class="detils_right4_middle_1">
						<div class="detils_right4_middle_1_left">
							<span>配送方式:</span>
						</div>
						<div class="detils_right4_middle_1_right">
							<span><%=record.getExpress() %></span>
						</div>
					</div>
					<div class="detils_right4_middle_2">
						<div class="detils_right4_middle_2_left">
							<span>收货信息：</span>
						</div>
						<div class="detils_right4_middle_2_right">
							<table width="560" cellpadding="10">
								<tr>
									<td style="text-align: left"><%=addresses.getName() %></td>
									<td style="text-align: left"><%=addresses.getPhone() %></td>
									<td style="text-align: left"><%=addresses.getProvince() %></td>
									<td style="text-align: left"><%=addresses.getCity() %></td>
									<td style="text-align: left"><%=addresses.getDetails() %></td>
									<td style="text-align: left"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="detils_right4_bottom">
					<div class="detils_right4_bottom_left">
						<span>卖家留言：</span>

					</div>
					<div class="detils_right4_bottom_right">afa,hhfka</div>
				</div>
			</div>
			<div class="detils_right5">
				<table width="740" align="center">

					<tr>
						<th><span>订单金额</span></th>
						<th></th>
						<th><span>运费</span></th>
						<th></th>
						<th><span>优惠</span></th>
						<th></th>
						<th><span>涨价V减免</span></th>
						<th></th>
						<th><span>实付金额</span></th>
					</tr>
					<tr align="center">
						<td><span>￥<%=record.getTotal() %></span></td>
						<td>+</td>
						<td><span>￥<%=record.getFreight() %></span></td>
						<td>+</td>
						<%
						double byprice = 0;
						double godprice = 0;
						for(RecordDetails recordDetails2: recordDetails){
							byprice = recordDetails.get(flag).getBuyprice();
						}
						for(Goods goods:goodlist){
							godprice = goodlist.get(flag).getPrice();
						}
						double disprice = godprice-byprice;
						%>
						<td><span>￥<%= disprice%></span></td>
						
						<td>+</td>
						<td><span>￥0</span></td>
						<td>=</td>
						<td><span>￥<%=record.getTotal() %></span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>