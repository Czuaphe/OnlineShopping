<%@page import="com.onlineshopping.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
User user = (User) session.getAttribute("user");
String uid= String.valueOf(user.getUserid());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货地址</title>
    <link rel="stylesheet" href="<%=path%>/css/address.css"/>
    <script type="text/javascript" src="<%=path%>/js/base/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/address.js"></script>
    <style type="text/css">
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
      <div id="zhongjian">
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
                    <td><a href="<%=path%>/CollectionServlet">我的收藏</a></td>
                </tr>
                <tr>
                    <td><a href="#">我的优惠券</a></td>
                </tr>
                <tr>
                    <td><a id="a" href="<%=path%>/AddressServlet">收货地址</a></td>
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
            <a id="b">添加收货地址</a>
            <c:forEach items="${ requestScope.adds}" var="add" varStatus="status">
            <div class="address" id="${add.uaid}">
                <div class="sel">
                    <a class="edit" onclick="edit(${add.uaid})">编辑</a>
                    <a class="delete" onclick="del(${add.uaid})">删除</a>
                </div>
                <span class="mingzi" id="name${add.uaid}">${add.name }</span><br/>
                <span class="others" id="phone${add.uaid}">${add.phone }</span><br/>
                <span class="others" id="details${add.uaid}">${add.province }&nbsp;${add.city }&nbsp;${add.block }&nbsp;${add.details}</span>
            </div>
            </c:forEach>
        </div>
        <div class="flash"></div>
        </div>     <!-- 第二层div:zhongjian -->
    </div>
    <!-- addform开始,收货地址弹框 -->
    <div id="addform">
        <div class="parent">
            <div class="parent_top">
                &nbsp;&nbsp;&nbsp;收货地址
            </div>
			<div id="pad"></div>
			<input type="text" id="username" placeholder="收货人姓名" />
			<div id="t1"></div>
			<input type="text" id="phone" placeholder="收货人电话" />
			<div id="t2"></div>
			<select id="add">
				<option id="emp" value="">请选择所在地区</option>
			</select>
			<div id="paaa">
				<div class="paad"></div>
				<select id="city" name="city"></select>
				<div class="paad"></div>
				<select id="county" name="county"></select>
			</div>
			<div id="t3"></div>
			<div style="width: 303px; height: 82px; background-color: white;">
				<textarea id="detail" placeholder="详细地址"></textarea>
			</div>
			<div id="t4"></div>
			<div id="a1fa">
				<a id="a1">保存</a> <a id="a2">取消</a>
				<div id="a1sub">保存</div>
			</div>
			<div id="t5"></div>
		</div>
    </div>
    <!-- addform结束 -->
    <div class="delfrom">
        <div class="deltip">
            <div id="m1">确定要删除吗？</div>
            <a id="can">取消</a>
            <a id="con">确定</a>
        </div>
    </div>
    <input id="hi" type="hidden" value="<%=uid%>"/>
</body>
</html>