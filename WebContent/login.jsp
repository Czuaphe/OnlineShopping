<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.onlineshopping.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--登录页面-->
    <meta charset="UTF-8">
    <title>登录页面</title>
    <style type="text/css">
        *{
            margin:0 auto;
            padding:0;
        }
        /*导航与logo部分*/
        .met-head{
            height:100px;
            width: 1349px;
        }
        .row{
            height: 100px;
            width: 1170px;
            margin:0 auto;
        }
        .logo{
            height: 100px;
            width: 585px;
            float: left;
        }
        .nav{
            height:100px;
            width: 550px;
        }
        .nav ul{
            list-style: none;
        }
        .nav ul li{
            height:100px;
            float: left;
        }
        .met-logo{
            width: 121px;
            padding-top: 23px;
        }
        .met-ge{
            height:33px;
            margin-top: 30px;
            width:5px ;
            margin-left: 15px;
            background-color: #999999;
        }
        .met-font{
            height:100px;
            width: 121px;
            line-height: 100px;
            font-size: 25px;
            margin-left: 15px;
        }
        .daoh{
            height:30px;
            width:100px;
            margin-top: 40px;
            float: right;
        }
        /*页面主体css*/
        .main{
            height:423px;
            width:1349px;
            background-image: url(./img/2015020201454782.jpg);
        }
        .blank{
            height:50px;
            width: 400px;
            margin-left: 200px;
        }
        .box{
            height:323px;
            width: 400px;
            margin-left: 200px;
            background-color:#cccccc;
        }
        .blank2{
            height:25px;
            width:340px;
        }
        .uname{
            height:43px;
            width:340px;
            background-color: white;

        }
        .form_u{
            border-style:none;
            height: 43px;
            width: 340px;
            float:right;
            line-height: 43px;
            font-size: 16px;
            display: block;
        }
        .pwd{
            height:43px;
            width:340px;
            background-color: white;
        }
        .form_p{
            border-style:none;
            height: 43px;
            width: 340px;
            line-height: 43px;
            font-size: 16px;
            display: block;
        }
        .blank3{
            height:30px;
            width:340px;
            line-height: 30px;
            font-size: 12px;
            color:red;
            display: none;
        }
        .blank4{
            height:30px;
            width:340px;
            line-height: 30px;
            font-size: 12px;
            color:red;
            display: none;
        }
        .forget{
            height:20px;
            width:340px;
            text-align: right;
            margin-bottom: 5px;
        }
        a{
            text-decoration: none;
        }
        /*添加登录按钮*/
        .bt1{
            text-decoration: none;
            font-size: 20px;
            line-height: 46px;
            display: block;
            height:46px;
            width: 340px;
            background-color: #337ab7;
            border-color: #2e6da4;
            text-align: center;
            color: white;
        }
        .link{
            text-decoration: none;
            font-size: 20px;
            line-height: 46px;
            display: block;
            height:46px;
            width: 340px;
            background-color: #337ab7;
            border-color: #2e6da4;
            text-align: center;
            color: white;
        }
        /*页面结尾部分*/
        .footer{
            height:90px;
            width:1349px;
        }
        p{
            height:20px;
            width:1110px;
            text-align: center;
            margin-top: 65px;
            color: #777;
            font-size: 14px;
        }
        .foot{
            height:20px;
            width: 1349px;
            background-color:darkblue;
            margin-top: 60px;
        }
    </style>
    <script type="text/javascript" src="./js/base/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function checkname(){
            var un=$("input[name=username]").val();
            var b3=$(".blank3");
            if(un==null||un==""){
                b3.css("display","block");
                return false;
            }

        }
        function checkpwd(){
            var pw=$("input[name=password]").val();
            var b4=$(".blank4");
            if(pw==null||pw==""){
                b4.css("display","block");
                return false;
            }
        }
        $(function(){
            $("input[name=username]").blur(checkname);
            $("input[name=password]").blur(checkpwd);
            $(".bt1").click(function(){
                var flag=true;
                if(checkname()){
                    flag=false;
                }
                if(checkpwd()){
                    flag=false;
                }
                return flag;
            });
        });
    </script>
</head>
<body>
	<%
	//获取用户名
	String uname=request.getParameter("username");
	//登录jdbc驱动程序
	Class.forName("");
	//获取密码
	String pwd=request.getParameter("password");
	
	%>
<!--导航logo部分-->
    <div class="met-head">
        <div class="row">
            <div class="logo">
                <div class="nav">
                    <ul>
                        <li class="met-logo"><img src="./img/logos.png"></li>
                        <li><div class="met-ge"></div></li>
                        <li class="met-font">会员登录</li>
                    </ul>
                </div>
            </div>
            <div class="daoh">
                <a href="#">返回首页</a>
            </div>
        </div>
    </div>
<!--页面主体内容-->
    <div class="main">
        <div class="blank"></div>
        <div class="box">
            <div class="blank2"></div>
            <!--form表单内容-->
            <form method="post" action="#" >
                <div class="uname">
                    <input type="text" name="username" class="form_u" placeholder="&nbsp;用户名/邮箱/手机"/>
                </div>
                <div class="blank2">
                    <div class="blank3">&nbsp;&nbsp;此项不能为空</div>
                </div>
                <div class="pwd">
                    <input type="password" name="password" class="form_p" placeholder="&nbsp;密码"/>
                </div>
                <div class="blank2">
                    <div class="blank4">&nbsp;&nbsp;此项不能为空</div>
                </div>
                <div class="forget">
                    <a href="#">忘记密码？</a>
                </div>
                <a class="bt1" href="#">登录</a>
                <div class="blank2"></div>
                <a class="link" href="register.html">注册账号</a>
            </form>
        </div>
    </div>
<!--页面尾部-->
    <div class="footer">
        <p>化妆品商城&nbsp;&nbsp;版权所有&nbsp;&nbsp;2018-2018&nbsp;&nbsp;
            晋ICP备8888888&nbsp;&nbsp;本网站为演示数据</p>
        <div class="foot"></div>
    </div>
</body>
</html>