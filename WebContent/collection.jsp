<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String uid=(String)session.getAttribute("uid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
<script type="text/javascript" src="<%=path%>/js/base/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
  var cid=0;
  function addframe(){
	var num=$(".add_right").children(".shop").length;
	var row=0;
	if(num%4==0){
    	row=num/4-1;
    }else{
    	row=num/4;
    }
	var addH=402+row*272;
	$(".add_right").height(addH+"px");
	var addF=462+row*272;
	$(".fa").height(addF+"px");
}
  
  function de(){
	  alert("ffff");
  }
  
  function del(id){
  	  cid=id;
  	  $(".delfrom").css("display","block");
  }
    
$(function(){
	addframe();
	$("#can").click(function(){
		$(".delfrom").css("display","none");
	});
	$("#con").click(function(){
		$.getJSON(
        	    "/OnlineShopping/CollectionServlet",	
        	    {"flag":"delete","cid":cid},
        	    function(result){
        	    	if($.trim(result) == "true"){
        	    		$(".delfrom").css("display","none");
        	    		$("#shop"+cid).remove();
        	    	}
        	    }
        	);
	});
});
</script>
    <style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}
a{
    cursor:pointer;
}
.fa {
	width: 100%;
	height: 462px;
	background-color: #F2F2F2;
}

.add_left {
	width: 265px;
	height: 402px;
	margin-left: 91px;
	margin-top: 30px;
	background-color: white;
	float: left;
	border-radius: 4px;
	line-height: 45px;
}

table {
	padding-top: 13px;
	padding-left: 60px;
}

table a {
	text-decoration: none;
	color: #76838F;
	font-size: 14px;
}

table a:hover {
	color: black;
}

#a {
	color: #93A8EB;
}

.add_right {
	width: 852px;
	height: 402px;
	margin-left: 42px;
	margin-top: 30px;
	float: left;
	background-color: white;
	border-radius: 4px;
}

.item {
	width: 791px;
	height: 43px;
	border-bottom: 1px solid #E4EAEC;
}

.collection {
	width: 84px;
	height: 43px;
	line-height: 43px;
	margin-left: 0;
	border-bottom: 2px solid #62A8EA;
	text-align: center;
}

.collection a {
	color: #62A8EA;
	text-decoration: none;
	font-size: 14px;
}

.shop {
	width: 178px;
	height: 252px;
	margin-left: 30px;
	margin-top: 20px;
	float: left;
}

.shop_top {
	height: 179px;
	width: 178px;
	position: relative;
	overflow: hidden;
}

.shadow {
	height: 179px;
	width: 178px;
	background-color: rgba(0, 0, 0, 0.4);
	position: absolute;
	left: 0;
	top: 0;
	display: none;
}

.sel {
	display: block;
	float: left;
	width: 41px;
	height: 27px;
	margin-top: 76px;
	line-height: 27px;
	text-align: center;
	text-decoration: none;
}

.buy {
	margin-left: 45px;
	background-color: #E47176;
	color: white;
}

.del {
	margin-left: 5px;
	background-color: #CAE2EC;
	color: #6F8A99;
}

.img {
	transition-duration: 0.5s;
}

.shop_top:hover .img {
	transform: scale(1.3, 1.3);
}

.shop_top:hover .shadow {
	display: block;
}

.shop_bottom {
	width: 152px;
	height: 74px;
	background-color: #F3F7F9;
	padding: 0 13px;
	text-align: center;
}

#name {
	color: #62A8EA;
	font-size: 12px;
}

#name:hover {
	color: #68b8ff;
	text-decoration: none;
}

#price {
	color: #F96868;
	font-size: 12px;
}

.delfrom {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	position: absolute;
	left: 0;
	top: 0;
	display: none;
}

.deltip {
	width: 402px;
	height: 132px;
	background-color: white;
	margin-top: 238px;
	line-height: 70px;
	border-radius: 4px;
}

.deltip a {
	display: block;
	width: 58px;
	height: 36px;
	border-radius: 3px;
	line-height: 36px;
	text-align: center;
	text-decoration: none;
	float: left;
}

#can {
	background-color: #E4EAEC;
	color: #76838F;
	margin-left: 261px;
}

#con {
	background-color: #89BCEB;
	color: #FFFFFF;
	margin-left: 10px;
}

#m1 {
	height: 77px;
	font-size: 14px;
	padding-left: 24px;
}

.top {
	width: 100%;
	height: 100px;
	background-color: white;
}

.top_left {
	margin-left: 100px;
	padding-top: 27px;
	float: left;
}

.top_center {
	height: 24px;
	margin-left: 15px;
	margin-top: 40px;
	border-left: 2px solid #DDDFE6;
	float: left;
	font-size: 22px;
	font-family: "微软雅黑";
	color: black;
}

.top_right {
	width: 225px;
	padding-right: 110px;
	height: 100px;
	line-height: 110px;
	float: right;
	font-size: 13px;
	font-family: "微软雅黑";
}

.top_right a {
	color: #337AB7;
	text-decoration: none;
}

.top_right a:hover {
	text-decoration: underline;
}
.bottom {
	width: 100%;
	height: 91px;
	background-color: white;
	line-height: 91px;
	text-align: center;
	font-size: 14px;
	color: #777777;
}
</style>
</head>
<body>
<div class="top">
        <div class="top_left"><a href="index.jsp"><img src="<%=path%>/img/hzp.png"/></a></div>
        <div class="top_center">&nbsp;&nbsp;会员中心</div>
        <div class="top_right">
            <span style="color:black;">${sessionScope.user.name}&nbsp;/</span>
            <a href="<%=path%>/LogoutServlet">退出登录</a>&nbsp;/
            <a href="index.jsp">返回首页</a>
        </div>
    </div>
<div class="fa">
    <div style="height:1px;"></div>
    <div class="add_left">
        <table width="140" border="0" cellpadding="0" cellspacing="0" align="left">
            <tr align="left">
                <th>订单中心</th>
            </tr>
            <tr>
                <td><a href="<%=path%>/AccountServlet">个人中心</a></td>
            </tr>
            <tr>
                <td><a href="#">我的订单</a></td>
            </tr>
            <tr>
                <td><a id="a" href="<%=path%>/CollectionServlet">我的收藏</a></td>
            </tr>
            <tr>
                <td><a href="#">我的优惠券</a></td>
            </tr>
            <tr>
                <td><a href="<%=path%>/AddressServlet">收货地址</a></td>
            </tr>
            <tr>
                <td><a href="#">消费明细</a></td>
            </tr>
            <tr>
                <td><a href="#">账户设置</a></td>
            </tr>
        </table>
    </div>
    <div class="add_right">
        <div style="height:31px;"></div>
        <div class="item">
            <div class="collection">
                <a href="">已收藏</a>
            </div>
        </div>
        <c:forEach items="${ requestScope.colls}" var="coll">
        <div class="shop" id="shop${coll.cid }">
            <div class="shop_top">
                <img class="img" id="img${coll.cid }" src="<%=path%>/img/400_400/${coll.picpath }" width="178"/>
                <div class="shadow">
                    <a class="sel buy" id="buy${coll.cid }" href="goods_details.jsp?gid=${coll.gid }">购买</a>
                    <a class="sel del" id="del${coll.cid }" onclick="del(${coll.cid })">删除</a>
                </div>
            </div>
            <div class="shop_bottom">
                <a href="goods_details.jsp?gid=${coll.gid }" id="name">${coll.name}</a><br/>
                <span id="price">${coll.price}</span>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
<div class="bottom">
        化妆品商城 版权所有 © 2018-2020 湘ICP备8888888 （本网站内容为演示数据）
    </div>
    <div class="delfrom">
            <div class="deltip">
            <div id="m1">确定要删除吗？</div>
            <a id="can">取消</a>
            <a id="con">确定</a>
        </div>
    </div>
</body>