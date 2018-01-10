<%@page import="com.onlineshopping.service.GoodsService"%>
<%@page import="com.onlineshopping.entity.Goods"%>
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
	Goods goods = goodsService.getGoodsByGid(Integer.parseInt(request.getParameter("gid")));
	//Goods goods = goodsService.getGoodsByGid(5155);
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
                    <li>
                        <a href="#">注册</a>
                    </li>
                    <hr>
                    <li>
                        <a href="#">登录</a>
                    </li>
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
            <h1 style="font-size: 28px;font-weight: 300;margin-bottom: 10px">
                <%=goods.getName() %>
            </h1>
            <div style="padding: 30px 20px;background-color: #fafafa">
                <span style="color: red;font-size: 32px">￥<%=goods.getPrice() * goods.getDiscount() %>元</span>
                <span style="font-size: 20px;margin-left: 20px">原价：<del style="">￥ <%=goods.getPrice() %> 元</del></span>
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
                    <button style="width: 45px;height: 40px;border: none;float: left;">-</button>
                    <input type="text" class="form-control" value="1" style="width: 60px;height: 40px;text-align: center;border-radius:0;float: left;">
                    <button  style="width: 45px;height: 40px;border: none;float: left;">+</button>
                </div>
            </div>
            <div style="margin-top: 5px">
                <span>库存 <%=goods.getNumbers() %> 件</span>
            </div>
            <div style="margin-top: 50px">
                <a href="#" class="btn btn-lg btn-primary" style="border-radius: 0;width: 180px;margin-left: 20px;background-color: #cccccc;border: 1px solid #cccccc;">
                    <i class="fa fa-heart" style="margin-right: 5px"></i>
                    加入收藏
                </a>
                <a href="#" class="btn btn-lg btn-primary pull-left" style="border-radius: 0;width: 180px;background-color: #f32196;border: 1px solid #f32196;">
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

</body>
</html>