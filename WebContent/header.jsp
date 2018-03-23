<%@ page import="com.onlineshopping.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    if (path == null) {
        path = "";
    }
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//    System.out.println(basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物商城</title>
    <base href="<%=basePath %>">
    <!-- 框架所需CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/web-fonts.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">

    <!-- 用户自定义CSS文件 -->
    <link rel="stylesheet" href=" ./css/shop.css">
    <link rel="stylesheet" href="./css/goods_details.css">
    <link rel="stylesheet" href="./css/shopping_cart.css">

    <!-- 框架所需JS文件 -->
    <script src="./js/base/jquery-3.2.1.min.js"></script>
    <script src="./js/base/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>

</head>
<body>

<%
    User user = (User) session.getAttribute("user");
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
                <a href="shopping_cart.jsp">
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
                <a href="AccountServlet">
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
            <a href="index.jsp">
                <img src="./img/logos.png" alt="">
            </a>
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

<script>
    var test = 0;
    $(document).ready(function () {
        console.log('data:' + test);
        $.ajax({
            url:"GetShoppingCartCount",
            dataType:"html",
            success: function (data,textStatus,jqXHR) {
                console.log('data' + data);
                console.log($('#shoppingCartCount').html());
                $('#shoppingCartCount').html(data);
            }
        });
    });
</script>