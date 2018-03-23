<%@page import="com.onlineshopping.entity.User"%>
<%@page import="com.onlineshopping.service.GoodsService"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<%
	
	GoodsService goodsService = new GoodsService();
	Goods goods = null;
	boolean isCollect = false;
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

<%@include file="footer.jsp"%>