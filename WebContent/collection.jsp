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
    
$(function(){
	addframe();
	$("#sel2").click(function(){
		
	});
	
});
</script>
    <style type="text/css">
        *{
            margin:0 auto;
            padding:0;
            font-family: "微软雅黑";
        }
        .fa{
            width:100%;
            height:462px;
            background-color: #F2F2F2;
        }
        .add_left{
            width: 265px;
            height:402px;
            margin-left: 91px;
            margin-top:30px;
            background-color: white;
            float: left;
            border-radius: 4px;
            line-height: 45px;

        }
        table{
            padding-top: 13px;
            padding-left:60px;

        }
        table a{
            text-decoration: none;
            color:#76838F;
            font-size: 14px;
        }
        table a:hover{
            color:black;
        }
        #a{
            color:#93A8EB;
        }
        .add_right{
            width:852px;
            height:402px;
            margin-left: 42px;
            margin-top:30px;
            float: left;
            background-color: white;
            border-radius: 4px;
        }
        .item{
            width:791px;
            height:43px;
            border-bottom: 1px solid #E4EAEC;
        }
        .collection{
            width:84px;
            height:43px;
            line-height: 43px;
            margin-left:0;
            border-bottom: 2px solid #62A8EA;
            text-align: center;
        }
        .collection a{
            color:#62A8EA;
            text-decoration: none;
            font-size: 14px;
        }
        .shop{
            width:178px;
            height:252px;
            margin-left: 30px;
            margin-top:20px;
            float:left;
        }
        .shop_top{
            height:179px;
            width:178px;
            position: relative;
            overflow: hidden;
        }
        .shadow{
            height:179px;
            width:178px;
            background-color: rgba(0,0,0,0.4);
            position: absolute;
            left:0;
            top:0;
            display: none;
        }
        .sel{
            display: block;
            float:left;
            width:41px;
            height:27px;
            margin-top:76px;
            line-height: 27px;
            text-align: center;
            text-decoration: none;
        }
        #sel1{
            margin-left:45px;
            background-color: #E47176;
            color:white;
        }
        #sel2{
            margin-left:5px;
            background-color: #CAE2EC;
            color:#6F8A99;
        }
        .img{
            transition-duration: 0.5s;
        }
        .shop_top:hover .img{
            transform: scale(1.3,1.3);
        }
        .shop_top:hover .shadow{
            display: block;
        }
        .shop_bottom{
            width:152px;
            height:74px;
            background-color: #F3F7F9;
            padding:0 13px;
            text-align: center;
        }
        #name{
            color:#62A8EA;
            font-size: 12px;
        }
        #name:hover{
            color: #68b8ff;
            text-decoration: none;
        }
        #price{
            color:#F96868;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="fa">
    <div style="height:1px;"></div>
    <div class="add_left">
        <table width="140" border="0" cellpadding="0" cellspacing="0" align="left">
            <tr align="left">
                <th>订单中心</th>
            </tr>
            <tr>
                <td><a href="#">个人中心</a></td>
            </tr>
            <tr>
                <td><a href="#">我的订单</a></td>
            </tr>
            <tr>
                <td><a href="#">我的收藏</a></td>
            </tr>
            <tr>
                <td><a href="#">我的优惠券</a></td>
            </tr>
            <tr>
                <td><a id="a" href="#">收货地址</a></td>
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
        <div class="shop">
            <div class="shop_top">
                <img class="img" id="img${coll.cid }" src="<%=path%>/img/400_400/${coll.picpath }" width="178"/>
                <div class="shadow">
                    <a class="sel" id="sel1" href="#">购买</a>
                    <a class="sel" id="sel2" href="#">删除</a>
                </div>
            </div>
            <div class="shop_bottom">
                <a href="#" id="name">${coll.name}</a><br/>
                <span id="price">${coll.price}</span>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
    <div class="delfrom">
        <div class="deltip">
            <div id="m1">确定要删除吗？</div>
            <a id="can">取消</a>
            <a id="con">确定</a>
        </div>
    </div>
</body>