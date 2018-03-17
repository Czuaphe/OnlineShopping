<%@page import="com.onlineshopping.entity.User"%>
<%@page import="com.onlineshopping.service.GoodsService"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//    System.out.println(basePath);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

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

    <style>
        .shop_goods_details {
            height: 650px;
            padding: 50px 0 50px;
        }

        .goods_left {
            height: 550px;
        }
        
        .small_img {
            float: left;
            margin-left: 10px;
            cursor: pointer;
            border: 2px solid #dddddd;
        }

        .small_img_active {
            border-color: #f32196;
        }

        .small_img img {
            width: 60px;
            height: 60px;

        }
    </style>

</head>
<body>

<%
	
	GoodsService goodsService = new GoodsService();
	Goods goods = null;
	boolean isCollect = false;
	User user = null;
	// 判断是否拥有GID
	String gid = request.getParameter("gid");
	//System.out.println(gid);
	if(gid == null || gid.equals("")) {
		response.sendRedirect("not_direct_see.jsp"); 
	} else {
		// 判断GID是否正确
		goods = goodsService.getGoodsByGid(Integer.parseInt(gid));
		if(goods == null) {
			response.sendRedirect("not_data.jsp");
		} else {
			Object object = session.getAttribute("user");
			// 判断用户是否已经收藏该商品
			if(object != null) {
				user = (User) object;
				isCollect = goodsService.isCollectGoods(user.getUserid(), goods.getGid());
			}
		}
	}
	
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
                <a href="#">
                    <i class="fa fa-shopping-cart"></i>购物车<span id="shoppingCartCount" class="badge badge-danger">0</span>
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
            	if(user != null) {
            %>
            <!-- 登录之后的用户信息显示功能 -->
            <div class="user_info">
            	<a href="#">
            		<img class="icon_pic" src="img/pic_icon.png" alt="">
            	<%=user.getName() %>
            	<!-- <b class="caret" style="margin-left: 10px;"></b> -->
            	</a>
            </div>
            <%
            	} else {
            %>
            <!-- 登录之前的显示登录注册功能 -->
            <div class="list_func">
                <ul>
                    <li>
                        <a href="#">注册</a>
                    </li>
                    <hr>
                    <li>
                        <a href="#">登录</a>
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
            <form action="SearchServlet">
                <input type="text" id="input_search" name="key" placeholder="请输入关键字"/>
                <button type="submit" class="fa fa-search" id="btn_search"></button>
            </form>
        </div>
    </div>
</div>

<div style="height: 30px;background-color: #f5f5f5">

</div>

<div class="shop_goods_details">
    <div class="container">
        <div class="goods_left col-sm-7">
            <div style="width: 158px;height: 550px;float: left;">
                <a class="goods_img_prev" href="#" style="display: block;width: 25px;margin-top: 200px;">
                    <i class="fa fa-angle-left" style="font-size: 70px;color: #dddddd"></i>
                </a>
            </div>
            <div style="height: 550px;width: 400px;float: left;">
                <div class="swiper-container goods_img">
                    <div class="swiper-wrapper">
                        <%
                        	if(goods != null) {
                        		String[] picpath = goods.getPicpath().split(",");
                        %>
                        <%
                        		for(int i = 0; i < picpath.length; i ++) {
                        %>
                        <div class="swiper-slide" style="height: 400px;width: 400px;">
                            <img src="./img/400_400/<%=picpath[i] %>" alt="">
                        </div>
                        <%
                        		}
                        	}
                        %>
                    </div>
                </div>
                <div style="height: 150px;width: 400px;padding-top: 50px;">
                    <ul class="swiper-pagination" style="list-style: none;margin-top: 0;margin-left: 80px"></ul>
                </div>
            </div>
            <div style="width: 158px;height:550px; float: left;">
                <a class="goods_img_next" href="#" style="display: block; width: 25px;margin-top: 200px;margin-left: 133px">
                    <i class="fa fa-angle-right" style="font-size: 70px;color: #dddddd;"></i>
                </a>
            </div>
        </div>
        <div class="goods_right col-sm-5" style="height: 550px;">
            <input id="gid" type="hidden" value="<%=goods != null ? goods.getGid() : 0 %>">
            <input id="basePath" type="hidden" value="<%=basePath %>" />
            <input id="isCollect" type="hidden" value="<%=isCollect %>">
            <h1 style="font-size: 28px;font-weight: 300;margin-bottom: 10px">
                <%=goods != null ? goods.getName() : "没有名字数据" %>
            </h1>
            <div style="padding: 30px 20px;background-color: #fafafa">

                <span style="color: red;font-size: 32px">￥<%=String.format("%.2f", goods != null ? goods.getPrice() * goods.getDiscount() : 0) %>元</span>
                <span style="font-size: 20px;margin-left: 20px">原价：<del style="">￥ <%=goods != null ? goods.getPrice() : 0 %> 元</del></span>
            </div>
            <div style="margin-top: 20px;height: 60px;">
                <span style="display: block;">优惠</span>
                <div style="width: 120px;margin-top:5px;float: left;border: 1px solid red;color: red;padding: 2px 5px;font-size: 10px">
                    购物满500元减50元
                </div>
                <div style="width: 100px;margin-top:5px;margin-left: 20px ;float: left;border: 1px solid gray;color: gray;padding: 2px 5px;font-size: 10px">
                    查看更多优惠
                </div>
            </div>
            <div style="margin-top: 10px;height:70px">
                <span style="display: block;">数量</span>
                <div style="margin-top: 5px;">
                    <button id="minusNum" style="width: 45px;height: 40px;border: none;float: left;">-</button>
                    <input id="showNum" type="text" class="form-control" value="1" style="width: 60px;height: 40px;text-align: center;border-radius:0;float: left;">
                    <button id="addNum" style="width: 45px;height: 40px;border: none;float: left;">+</button>
                </div>
            </div>
            <div style="margin-top: 5px">
                <span>库存 <%=goods != null ? goods.getNumbers() : 0 %> 件</span>
            </div>
            <div style="margin-top: 50px">
                <a id="addCollect" class="btn btn-lg btn-primary" style="border-radius: 0;width: 180px;margin-left: 20px;background-color: #cccccc;border: 1px solid #cccccc;<% if(isCollect) { %> color:#f32184; <% } %>">
                    <i class="fa fa-heart" style="margin-right: 5px;"></i>
                    加入收藏
                </a>
                <a id="addShoppingCart" class="btn btn-lg btn-primary pull-left" style="border-radius: 0;width: 180px;background-color: #f32196;border: 1px solid #f32196;">
                    <i class="fa fa-shopping-cart" style="margin-right: 5px"></i>
                    加入购物车
                </a>
            </div>
        </div>
    </div>
</div>

<div style="height: 50px;background-color: #f5f5f5">

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

<script src="./js/shop.js"></script>

<script>
	var test = 0;
	$(document).ready(function () {	
		console.log('data:' + test);
		$.ajax({
    		url:"/OnlineShopping/GetShoppingCartCount",
            dataType:"html",
            success: function (data,textStatus,jqXHR) {
            	console.log('data' + data);
            	console.log($('#shoppingCartCount').html());
            	$('#shoppingCartCount').html(data);
            }
    	});
	});
</script>

</body>
</html>