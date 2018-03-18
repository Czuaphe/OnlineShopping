<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineshopping.entity.RecordDetails"%>
<%@page import="com.onlineshopping.entity.Record"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<!-- 框架所需CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/web-fonts.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 用户自定义CSS文件 -->
<link rel="stylesheet" href=" ./css/myorder1.css">

<!-- 框架所需JS文件 -->
<script src="./js/base/jquery-3.2.1.min.js"></script>
<script src="./js/base/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
	List<Record> list = (List<Record>) request.getAttribute("record");

	List<RecordDetails> rdlist = (List<RecordDetails>) request.getAttribute("recorddetails");
	/* Record record = (Record)request.getAttribute("record"); */
	/* RecordDetails recordDetails = (RecordDetails)request.getAttribute("recorddetails"); */
	List<Goods> goodlist = (List<Goods>) request.getAttribute("good");
%>

</head>
<body>
	<div class="myorder">
		<div class="myorder_left">
			<div class="myorder_left_1"></div>
			<ul>
				<li><h1
						style="font-size: 20px; font-weight: normal; color: black">订单中心</h1>
				</li>
				<li><a href="#">个人中心</a></li>
				<li><a href="#<!-- myorder.html -->">我的订单</a></li>
				<li><a href="#">我的收藏</a></li>
				<li><a href="#">我的优惠券</a></li>
				<li><a href="#">收货地址</a></li>
				<li><a href="#">消费明细</a></li>
				<li><a href="#">账户设置</a></li>
			</ul>

		</div>
		<div class="myorder_middle"></div>
		<div class="myorder_right">
			<div class="myorder_right_top">
				<div class="myorder_right_top1">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#ios" data-toggle="tab">全部有效订单</a>
						</li>
						<li><a href="#ios" data-toggle="tab">待支付(<span id="num"></span>0)
						</a></li>
						<li><a href="#java" data-toggle="tab">待收货(<span id="num1"></span>0)
						</a></li>
						<li><a href="#java1" data-toggle="tab">已关闭</a></li>
					</ul>
				</div>
			</div>
			<div class="myorder_right_middle">
				<input id="search" type="search" name="" placeholder="商品订单、订单编号">
				<input id="button" type="button" value="搜索" />
			</div>
			<div id="myTabContent" class="tab-content">
				<!--全部有效订单-->
				<div class="tab-pane fade in active" id="home"></div>
				<!-- 待支付-->
				<div class="tab-pane fade" id="ios">
					<!--增加其他订单；就是增加table-->
						
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 10px;"
						cellspacing="20" width="640">
						<tr>
							<td>
								<div class="wpay_top">
									<table width="740" cellpadding="4">
										<%
											for (Record record : list) {
										%>
										<tr>
											<td style="padding-left: 30px"><span
												style="font-size: 20px; color: powderblue">待支付</span></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td align="center"><span>订单金额：</span> <%=record.getTotal() %>
											</td>
										<tr>
											<td style="padding-bottom: 5px; padding-left: 10px"
												width="180"><span>订单号：</span> <span><%=record.getRecnum() %></span>
											</td>
											<td style="padding-bottom: 5px"><span><%=record.getTime() %></span>&nbsp;
												&nbsp; &nbsp; <span><%=record.getPayway() %></span></td>
										</tr>
										<tr>
											<td colspan="2"><div
													style="border: 1px solid red; width: 720px;"></div></td>
										</tr>
										<%} %>
									</table>
								</div>
								<div class="wpay_bottom">
									<div class="wpay_bottom_left">
									<%
									for(int i=0;i<rdlist.size();i++){
									%>
									<div style="width: 420px;height: 90px">
										<div class="wpay_bottom_left1">
											<%
												for(Goods goods:goodlist){
											%>
											<a href="#">&nbsp;&nbsp;&nbsp; <%
															String[] pics = goodlist.get(i).getPicpath().split(",");
												%> <img src="img/400_400/<%=pics[0]%>" alt=""
												style="width: 60px; height: 60px; margin-top: 15px;" />
											</a>
											<%
											if(!"".equals(null))
												break;
											%>
											
											<%} %>
										</div>
										<%
										
										%>
										<div class="wpay_bottom_left2"
											style="text-align: center; padding-top: 15px">

											<%
												for(Goods goods:goodlist){
											%>
											<span><%=goodlist.get(i).getName() %></span>
											<%
											if(!"".equals(null))
												break;
											%>
											<%
												} 
											%>
											<br />


											<%
											for (RecordDetails rd : rdlist) {
											%>

											<p style="margin-top: 10px">
												￥<%=rdlist.get(i).getBuyprice() %>
												&nbsp;×&nbsp;<%=rdlist.get(i).getNumbers()%></p>
												<%
												if(!"".equals(null)||!"".equals(null))
													break;
												%>
											<%} %>
										</div>
										
										</div>
										<%} %>
									</div>

									<div class="wpay_bottom_right">
										<ul>
											<li id="color"
												style="font-size: 14px; padding-top: 8px; background: #ea0000">
												<a href="#">立即付款</a>
											</li>

											<li
												style="border: 1px solid #919191; font-size: 14px; padding-top: 8px">
												<a
												<%
													for (RecordDetails rd : rdlist) {
												%>
												href="MyorderRedatileRecoleServlet?drid= <%=rd.getRid()%>"
												<%
												} 
												%>>订单详情</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<!--待收货-->
				<div class="tab-pane fade" id="java">
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 10px;"
						cellspacing="20" width="740">
						<tr>
							<td style="padding-top: 10px">
								<div class="wpayment_top">
									<table width="700" cellspacing="15" cellpadding="20">
										<tr>
											<td colspan="2" style="padding-left: 30px"><span
												style="font-size: 20px; color: powderblue">待付款</span></td>

										</tr>
										<tr>
											<td style="padding-top: 10px" width="80">订单号：</td>
											<td style="padding-top: 10px" width="200"><span>
													123459554324565876756</span></td>
											<td style="padding-top: 10px">在先支付</td>
										</tr>
									</table>
								</div>
								<div style="width: 720px; border: 1px solid red;"></div>
								<div class="wpayment_bottom">
									<div class="wpayment_bottom_left">
										<!--添加其他货物复制此地table-->
										<table cellpadding="10" width="200">
											<tr>
												<td style="padding-bottom: 15px"><a href="#">&nbsp;&nbsp;&nbsp;
														<img src="../img/1.png" alt="" />
												</a></td>
												<td style="margin-top: 20px; padding-bottom: 15px"
													width="200" align="center"><br /> <span>男士最好的护肤品</span>
													<br /> <span>￥1000元 &nbsp;×&nbsp;1000</span></td>
											</tr>
										</table>

									</div>
									<div class="wpayment_bottom_right">
										<ul>
											<li id="color1"
												style="font-size: 14px; padding-top: 8px; background: #ea0000">
												<a href="#">确认收货</a>
											</li>
											<li
												style="border: 1px solid #919191; font-size: 14px; padding-top: 8px">
												<a href="#">监督催单</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!--已关闭-->
				<div class="tab-pane fade" id="java1">
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 10px;"
						cellspacing="20" width="640">
						<tr>
							<td>
								<div class="wpay_top">
									<table width="740" cellpadding="4">
										<tr>
											<td style="padding-left: 30px"><span
												style="font-size: 20px; color: powderblue">已关闭</span></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td align="center"><span>订单金额：</span> 10000000000</td>
										<tr>
											<td style="padding-bottom: 5px; padding-left: 10px"
												width="180"><span>订单号：</span> <span>12345698765432</span>
											</td>
											<td style="padding-bottom: 5px"><span>1212301831283</span>&nbsp;
												&nbsp; &nbsp; <span>支付方式</span></td>
										</tr>
										<tr>
											<td colspan="2"><div
													style="border: 1px solid red; width: 720px;"></div></td>
										</tr>
									</table>
								</div>
								<div class="wpay_bottom">
									<div class="wpay_bottom_left">
										<!--添加其它商品就是复制table-->
										<table cellspacing="30">
											<tr>
												<td><a href="#">&nbsp;&nbsp;&nbsp; <img
														src="../img/1.png" alt="" />
												</a></td>
												<td style="margin-top: 20px" width="200" align="center"><br />
													<span>男士最好的护肤品</span> <br /> <span>￥1000元
														&nbsp;×&nbsp;1000</span></td>
											</tr>
										</table>

									</div>
									<div class="wpay_bottom_right">
										<ul>
											<li
												style="border: 1px solid #919191; font-size: 14px; padding-top: 8px">
												<a href="#">订单详情</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>