<%@page import="com.onlineshopping.entity.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>

<%
	if(request.getAttribute("flag") == null) {
		request.getRequestDispatcher("IndexServlet").forward(request, response);
	}
	
	List<Goods> hotGoodsList = (List<Goods>) request.getAttribute("hotGoodsList");
	List<Goods> newGoodsList = (List<Goods>) request.getAttribute("newGoodsList");
	List<Goods> discountGoodsList = (List<Goods>) request.getAttribute("discountGoodsList");
	
%>

<div class="shop_lunbo">
    <div class="container">
        <div class="swiper-container lunbo_container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="img/lunbo-1.jpg" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="img/lunbo-2.jpg" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="img/lunbo-3.jpg" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="img/lunbo-4.jpg" alt="">
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

<%@ include file="footer.jsp"%>