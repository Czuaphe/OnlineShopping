<%@page import="com.onlineshopping.entity.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物商城</title>

    <!-- 框架所需CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/web-fonts.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">

    <!-- 用户自定义CSS文件 -->
    <link rel="stylesheet" href=" ./css/shop.css">

    <!-- 框架所需JS文件 -->
    <script src="./js/base/jquery-3.2.1.min.js"></script>
    <script src="./js/base/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>

</head>
<body>

<%
	if(request.getAttribute("flag") == null) {
		request.getRequestDispatcher("IndexServlet").forward(request, response);
	}
	Object userObject =  session.getAttribute("user");
	
	List<Goods> hotGoodsList = (List<Goods>) request.getAttribute("hotGoodsList");
	List<Goods> newGoodsList = (List<Goods>) request.getAttribute("newGoodsList");
	List<Goods> discountGoodsList = (List<Goods>) request.getAttribute("discountGoodsList");
	
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
            <div class="shopping_cart" >
                <!-- 目前不进行下拉菜单的开发  class="dropdown-toggle" data-toggle="dropdown" -->
                <a href="shop_car.jsp">
                    <i class="fa fa-shopping-cart"></i>购物车<span class="badge badge-danger">0</span>
                </a>
                <!-- 购物车下拉菜单（可选功能，尽力实现） -->
                <div class="dropdown-menu pull-right">
                    <ul>
                        <li>
                            <span class="dropdown_title"><b>购物车</b></span>
                            <span class="badge badge-danger" style="">共 0 件商品</span>
                        </li>
                    </ul>
                    <div style="text-align: center;line-height: 100px;">没有商品</div>
                </div>
            </div>
            <%
            	if(userObject != null) {
            		User user = (User) userObject;
            %>
            <!-- 登录之后的用户信息显示功能 -->
            <div class="user_info">
                <img class="icon_pic" src="img/pic_icon.png" alt="">
                <!--&lt;!&ndash; 目前不进行下拉菜单的开发 class="dropdown-toggle" data-toggle="dropdown" &ndash;&gt;-->
               	<a href="#"><%= user.getName() %><b class="caret" style="margin-left: 10px;"></b></a>
                
            </div>
            <%
            	} else {
            %>
            <!-- 登录之前的显示登录注册功能 -->
            <div class="list_func">
                <ul>
                    <li>
                        <a href="regist.jsp">注册</a>
                    </li>
                    <hr>
                    <li>
                        <a href="login.jsp">登录</a>
                    </li>
                </ul>
            </div>
			<%
            	}
			%>
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
            <form action="SearchServlet" >
                <input type="text" id="input_search" name="key" placeholder="请输入关键字"/>
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

<div class="shop_groom">
    <div class="container">
        <div class="title_box">
            <div class="title_name">
                <span><b>热卖商品</b></span>
            </div>
            <div class="title_move">
                <i class="fa fa-chevron-left groom-prev"></i>
                <i class="fa fa-chevron-right groom-next"></i>
            </div>
        </div>
        <div class="groom_cut swiper-container" >
            <div class="swiper-wrapper">
                
                <%
                if(hotGoodsList != null) {
                	for(Goods goods : hotGoodsList) {
                %>
                		<div class="swiper-slide">
                    		<div class="groom_item">
                        		<a href="goods_details.jsp?gid=<%= goods.getGid() %>">
                        			<% String[] picList = goods.getPicpath().split(","); %>
                            		<img src="./img/400_400/<%=picList[0] %>" alt="">
                            		<b><%=goods.getName() %></b>
                            		<i><%= goods.getDetails() %></i>
                            		<p>￥<%= goods.getPrice() %>元</p>
                        		</a>
                    		</div>
                		</div>
                <% 
                	}
                }
                %>
                <%--<c:if test="${ hotGoodsList != null }">
                	 <c:forEach items="hotGoodsList" var="goods">
                		<div class="swiper-slide">
                    		<div class="groom_item">
                        		<a href="#">
                            		<img src="./img/groom-1.jpg" alt="">
                            		<b><%=goods.getName() %></b>
                            		<i>${ goods.getDetails() }</i>
                            		<p>￥${ goods.getPrice() }元</p>
                        		</a>
                    		</div>
                		</div>
                	</c:forEach> 
                </c:if> --%>
                <!-- <div class="swiper-slide">
                    <div class="groom_item">
                        <a href="#">
                            <img src="./img/groom-1.jpg" alt="">
                            <b>美人鱼干湿两用粉饼</b>
                            <i>保湿遮瑕控油</i>
                            <p>￥9.90元</p>
                        </a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="groom_item">
                        <a href="#">
                            <img src="./img/groom-1.jpg" alt="">
                            <b>美人鱼干湿两用粉饼</b>
                            <i>保湿遮瑕控油</i>
                            <p>￥9.90元</p>
                        </a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="groom_item">
                        <a href="#">
                            <img src="./img/groom-1.jpg" alt="">
                            <b>美人鱼干湿两用粉饼</b>
                            <i>保湿遮瑕控油</i>
                            <p>￥9.90元</p>
                        </a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="groom_item">
                        <a href="#">
                            <img src="./img/groom-1.jpg" alt="">
                            <b>美人鱼干湿两用粉饼</b>
                            <i>保湿遮瑕控油</i>
                            <p>￥9.90元</p>
                        </a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="groom_item">
                        <a href="#">
                            <img src="./img/groom-1.jpg" alt="">
                            <b>美人鱼干湿两用粉饼</b>
                            <i>保湿遮瑕控油</i>
                            <p>￥9.90元</p>
                        </a>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>

<div class="shop_discount">
    <div class="container">
        <div class="discount_box">
            <div class="discount_title">
                <span class="title_left"><b>今日特价</b></span>
                <span class="title_right">查看更多</span>
            </div>
            <div class="discount_down">
                <div class="discount_left">
                    <div class="discount_pic">
                        <a href="#">
                            <div class="discount_item">
                                <img src="img/discount_pic-1.jpg" alt="">
                            </div>
                        </a>
                    </div>
                    <div class="discount_pic">
                        <a href="#">
                            <div class="discount_item">
                                <img src="img/discount_pic-2.jpg" alt="">
                            </div>
                        </a>
                    </div>
                </div>
                <div class="discount_right">
                    <ul>
                    	<%
                    	if( discountGoodsList != null) {
                    		for(Goods goods : discountGoodsList) {
                    	%>
                    	<li>
                            <div class="discount_pic">
                                <a href="goods_details.jsp?gid=<%= goods.getGid() %>">
                                    <div class="discount_item">
                                    	<% String[] picList = goods.getPicpath().split(","); 
                                    	DecimalFormat df = (DecimalFormat) DecimalFormat.getInstance();
                                    	df.applyPattern("##.##");
                                    	%>
                                        <img src="./img/400_400/<%=picList[0] %>" alt="">
                                        <b><%= goods.getName() %></b>
                                        <i><%= goods.getDetails() %></i>
                                        <div class="item_price">
                                            <del>￥<%= goods.getPrice() %>元</del>
                                            <span>￥<%= df.format(goods.getPrice() * goods.getDiscount()) %>元</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                    	<% 
                    		}
                    	}
                    	%>
                    	
                    	<!-- 
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li> 
                        -->
                    </ul>
                </div>
            </div>
        </div>
        <div class="discount_box">
            <div class="discount_title">
                <span class="title_left"><b>新品上架</b></span>
                <span class="title_right">查看更多</span>
            </div>
            <div class="discount_down">
                <div class="discount_left">
                    <div class="discount_pic">
                        <a href="#">
                            <div class="discount_item">
                                <img src="img/discount_pic-3.jpg" alt="">
                            </div>
                        </a>
                    </div>
                    <div class="discount_pic">
                        <a href="#">
                            <div class="discount_item">
                                <img src="img/discount_pic-4.jpg" alt="">
                            </div>
                        </a>
                    </div>
                </div>
                <div class="discount_right">
                    <ul>
                    	
                    	<%
                    	if( newGoodsList != null) {
                    		for(Goods goods : newGoodsList) {
                    	%>
                    	<li>
                            <div class="discount_pic">
                                <a href="goods_details.jsp?gid=<%= goods.getGid() %>">
                                    <div class="discount_item">
                                    	<% String[] picList = goods.getPicpath().split(","); 
                                    	DecimalFormat df = (DecimalFormat) DecimalFormat.getInstance();
                                    	df.applyPattern("##.##");
                                    	%>
                                        <img src="./img/400_400/<%=picList[0] %>" alt="">
                                        <b><%= goods.getName() %></b>
                                        <i><%= goods.getDetails() %></i>
                                        <div class="item_price">
                                            <del>￥<%= goods.getPrice() %>元</del>
                                            <span>￥<%= df.format(goods.getPrice() * goods.getDiscount()) %>元</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                    	<% 
                    		}
                    	}
                    	%>
                    
                    	<!-- 
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="discount_pic">
                                <a href="#">
                                    <div class="discount_item">
                                        <img src="./img/groom-1.jpg" alt="">
                                        <b>商品名称</b>
                                        <i>商品描述</i>
                                        <div class="item_price">
                                            <del>￥12.00</del>
                                            <span>￥9.00</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        -->
                    </ul>
                </div>
            </div>
        </div>
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
                    <span class="info_call">4000-000-000</span>
                    <span class="info_time">服务时间 9:00-22:00</span>
                    <span class="info_connection">
                        <i class="fa fa-weibo"></i>
                        <i class="fa fa-weixin"></i>
                        <i class="fa fa-qq"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="shop_copyright">
    <div class="container">
        <span class="copyright_info">化妆品商城 版权所有 © 2018-2020 湘ICP备8888888 （本网站内容为演示数据）</span>
        <span class="copyright_powered">Powered by <a href="#">Czuaphe</a> 5.3.19</span>
    </div>
</div>

<!-- 用户自定义JS文件 -->
<script src="./js/shop.js"></script>

</body>
</html>