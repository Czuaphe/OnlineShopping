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
<link rel="stylesheet" href=" ./css/myorder.css">

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
	Goods goods = (Goods) request.getAttribute("good");
%>

</head>
<body>
	<div class="myorder">
		<div class="myorder_left">
			<div class="myorder_left_1"></div>
			<ul>
				<li>
					<h1 style="font-size: 20px; font-weight: normal; color: black">订单中心</h1>
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
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 10px;">
						<tr>
							<td>
								<div class="myorder_right_down">
									<div class="myorder_right_down1">
										<div class="myorder_right_down1_left">
											<div class="myorder_right_down1_left_top">
												<span>待支付</span>
											</div>
											<div class="myorder_right_down1_left_bottom">
												<table width="460">
													<%
														for (Record record : list) {
													%>
													<tr>
														<td width="60"><span>订单号:</span></td>

														<td width="160"><span><%=record.getRecnum()%>
														</span></td>
														<td width="160"><span><%=record.getTime()%></span></td>
														<td width="60"><span><%=record.getPayway()%></span></td>
													</tr>

												</table>
											</div>
										</div>
										<div class="myorder_right_down1_right">
											<span>订单金额:</span>

											<%=record.getTotal()%>

											<%
												}
											%>
										</div>
									</div>
									<div class="myorder_right_down2">
										<div class="myorder_right_down2_left"
											style="margin-left: 10px;">
											<table width="440" valign="center" align="left"
												cellpadding="5">
												<tr>
													<td rowspan="2">
														<%
															String[] pics = goods.getPicpath().split(",");
														%> <img src="img/400_400/<%=pics[0]%>"
														style="width: 60px; height: 60px; margin-top: 15px;" />
													</td>
												</tr>
												<tr>
													<%
														for (RecordDetails rd : rdlist) {
													%>
													<td><span><%=goods.getName()%></span><br> <span>
															￥<%=rd.getBuyprice()%> 元 × <%=rd.getNumbers()%></span></td>
													<%
														}
													%>
													<td></td>
												</tr>

											</table>



										</div>
										<div class="myorder_right_down2_right">
											<div class="myorder_right_down2_right_1">
												<%
													for (RecordDetails rd : rdlist) {
												%>
												<a
													href="MyorderRedatileRecoleServlet?drid= <%=rd.getRid()%>">订单详情</a>
												<%
													}
												%>
											</div>
											<div class="myorder_right_down2_right_2">
												<a id="pay" href="#">立即付款</a>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<!-- 添加其他商品 -->

							</td>
						</tr>

					</table>
					<!-- 添加其它订单  复制table表格 -->


				</div>
				<!--待收货-->
				<div class="tab-pane fade" id="java">
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 20px;">
						<tr>
							<td>
								<div class="myorder_receive">
									<div class="myorder_receive_top">
										<div class="myorder_receive_top1">
											<span>待收货</span>
										</div>
										<div class="myorder_receive_top2">
											<table width="780" align="center">
												<tr>
													<td width="80"><span>订单号：</span></td>
													<td>123456789009876543</td>
													<td>在线支付</td>
													<td></td>
													<td width="400"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="myorder_receive_bottom">
										<div class="myorder_receive_bottom_left">
											<table valign="center" align="left">
												<tr>
													<td rowspan="2"><img style="width: 100px"
														src="../img/data.png" alt="" /></td>
												</tr>
												<tr>
													<td><span>dsifsuonfal</span><br> <span>osiaojaof</span>
													</td>
													<td></td>
												</tr>
											</table>
										</div>
										<div class="myorder_receive_bottom_right">
											<div class="myorder_receive_bottom_right1">
												<span>确认收货</span>
											</div>
											<div class="myorder_receive_bottom_right2">
												<a href="#"> <span>监督催单</span></a>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<!-- 添加收货其它订单 -->

				</div>
				<!--已关闭-->
				<div class="tab-pane fade" id="java1">
					<table
						style="border: 1px solid red; margin-top: 10px; margin-left: 10px;">
						<tr>
							<td>
								<div class="myorder_receive">
									<div class="myorder_receive_top">
										<div class="myorder_receive_top1">
											<span>已关闭</span>
										</div>
										<div class="myorder_receive_top2">
											<table width="780" align="center">
												<tr>
													<td width="80"><span>订单号：</span></td>
													<%-- <%
													for (Record record : list) {
												%>
												<td><%=record.getRid()%></td>
												<td><%=record.getPayway()%></td>
												<%
													}
												%> --%>
													<td></td>
													<td width="400"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="myorder_receive_bottom">
										<div class="myorder_receive_bottom_left">
											<table valign="center" align="left">
												<tr>
													<td rowspan="2"><img style="width: 100px"
														src="../img/data.png" alt="" /></td>
												</tr>
												<tr>
													<td><span>dsifsuonfal</span><br> <span>osiaojaof</span>
													</td>
													<td></td>
												</tr>
											</table>

										</div>
										<div class="myorder_receive_bottom_right">
											<div class="myorder_receive_bottom_right1">
												<span><a href="#">确认付款</a></span>
											</div>
										</div>
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