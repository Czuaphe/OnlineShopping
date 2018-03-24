<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心-化妆品商城</title>
    <script type="text/javascript" src="<%=path%>/js/base/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
        	$("#myicon").bind("change",function(){
        		var file=document.getElementById("myicon");
                var url=window.URL.createObjectURL(file.files[0]);
                $("#icon").attr({src:url});
            });
        });
    </script>
<style type="text/css">
body {
	background-color: #EFEFEF;
}

* {
	margin: 0 auto;
	padding: 0;
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

.middle {
	width: 100%;
	height: 1098px;
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

.middle_main {
	width: 819px;
	height: 1005px;
	margin-top: 31px;
	margin-left: 15px;
	padding: 16px;
	background-color: white;
	float: left;
}

.m {
	width: 819px;
	height: 42px;
	line-height: 42px;
	background-color: #F5F5F5;
	border-bottom: 1px solid #DDDDDD;
}

.info {
	width: 784px;
	height: 50px;
	padding-left: 35px;
	line-height: 50px;
	border-bottom: 1px solid #DDDDDD;
}

#info1 {
	padding-top: 19px;
}

.info_last {
	width: 784px;
	height: 50px;
	padding-left: 35px;
	line-height: 50px;
}

.m_left {
	float: left;
	width: 195px;
}

.m_right {
	float: left;
}

.img {
	width: 219px;
	height: 275px;
	border: 1px solid #DDDDDD;
	margin-top: 40px;
	margin-left: 228px;
	font-size: 32px;
	line-height: 44px;
	text-align: center;
}

input[type="file"] {
	margin-left: 228px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.list {
	height: 94px;
	border-top: 1px solid #DDDDDD;
	line-height: 94px;
}

.list_left {
	padding-left: 21px;
	float: left;
	width: 206px;
}

input[type="text"] {
	width: 545px;
	height: 42px;
	padding-left: 11px;
	margin-top: 25px;
	font-size: 14px;
}

.last_list {
	border-bottom: 1px solid #DDDDDD;
}

input[type="submit"] {
	width: 81px;
	height: 33px;
	margin-left: 228px;
	margin-top: 25px;
	background-color: #337AB7;
	border: 1px solid #2E6DA4;
	color: white;
}

input[type="submit"]:hover {
	background-color: #2E6DA4;
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
            <span style="color:black;">${requestScope.user.name}&nbsp;/</span>
            <a href="<%=path%>/LogoutServlet">退出登录</a>&nbsp;/
            <a href="index.jsp">返回首页</a>
        </div>
    </div>
    <div class="middle">
        
        
        <div style="height:1px;"></div>
    <div class="add_left">
        <table width="140" border="0" cellpadding="0" cellspacing="0" align="left">
            <tr align="left">
                <th>订单中心</th>
            </tr>
            <tr>
                <td><a id="a" href="<%=path%>/AccountServlet">个人中心</a></td>
            </tr>
            <tr>
                <td><a href="record_center.jsp">我的订单</a></td>
            </tr>
            <tr>
                <td><a href="<%=path%>/CollectionServlet">我的收藏</a></td>
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

        <div class="middle_main">
            <div class="m">&nbsp;&nbsp;个人信息</div>
            <div class="info" id="info1">
                <div class="m_left">会员名</div>
                <div class="m_right">${requestScope.user.name}</div>
            </div>
            <div class="info">
                <div class="m_left">会员类型</div>
                <div class="m_right">普通会员</div>
            </div>
            <div class="info">
                <div class="m_left">登录次数</div>
                <div class="m_right">${requestScope.count}</div>
            </div>
            <div class="info_last">
                <div class="m_left">最后登录IP</div>
                <div class="m_right">${requestScope.userLoginLog.ip}</div>
            </div>
            <div style="height:50px;"></div>
            <div class="m">&nbsp;&nbsp;更多资料</div>
            <div class="img">
                <img id="icon" width="219" height="275" src="<%=path%>/img/user/${requestScope.user.icon }"/>
            </div>
            <form action="<%=path%>/UploadServlet" enctype="multipart/form-data" method="post">
                <input id="myicon" name="myicon" type="file"/>
                <div class="list">
                    <div class="list_left">电话</div>
                    <input type="text" name="cz" value="${requestScope.user.phone }" placeholder="公司传真"/>
                </div>
                <div class="list last_list">
                    <div class="list_left">邮箱</div>
                    <input type="text" name="wz" value="${requestScope.user.email }" placeholder="公司网址"/>
                </div>
                <input type="submit" value="保存资料"/>
            </form>
        </div>
    </div>
    <div class="bottom">
        化妆品商城 版权所有 © 2018-2020 湘ICP备8888888 （本网站内容为演示数据）
    </div>
</body>
</html>