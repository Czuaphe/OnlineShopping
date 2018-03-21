<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<style type="text/css">
        *{
            margin:0 auto;
            padding:0;
        }
        /*顶部样式*/
        .met-head{
            height:100px;
            width: 1349px;
        }
        /*logo部分样式*/
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
        /*超链接部分*/
        .daoh{
            height:30px;
            width:100px;
            margin-top: 40px;
            float: right;
        }
        a{
            text-decoration: none;
        }
        /*页面主体部分*/
        .main{
            height:925px;
            width:1349px;
            background-color:#cccccc;
        }
        .blank{
            width:500px ;
            height:50px;
            text-align: center;
        }
        .form_regist{
            width: 500px;
            height:825px;
            background-color: white;
        }
        .blank2{
            width: 500px;
            height:30px;
        }
        /*form表单输入框*/
        .form_group{
            width: 440px;
            height:43px;
            border:1px solid #cccccc;
        }
        .input_left{
            width: 45px;
            height:43px;
            background-color:#cccccc;
            float: left;
        }
        .input_right{
            width: 395px;
            height:43px;
            background-color: white;
            float: right;
        }
        .form_control{
            width: 395px;
            height:43px;
            float: right;
            line-height: 43px;
            border:0px;
            display: block;
            font-size: 15px;
        }
        .tan{
            width:395px;
            float: right;
            font-size: 14px;
            color:red;
            height:15px;
            display:none;
        }
        .blank3{
            width:440px;
            height:15px;
        }
        .form_group2{
            width: 440px;
            height:43px;
        }
        .form_group3{
            width: 285px;
            height:43px;
            float: left;
            border:1px solid #cccccc;
        }
        .input_right2{
            width: 240px;
            height:43px;
            background-color: white;
            float: left;
        }
        .form_control2{
            width: 240px;
            height:43px;
            float: left;
            line-height: 43px;
            border:0px;
            display: block;
            font-size: 15px;
        }
        .act{
            width:130px;
            height:43px;
            background-color: red;
            float: right ;
        }
        /*更多信息*/
        .form_group4{
            width: 170px;
            height:43px;
            float:left;
        }
        .hr{
            width:169px;
            padding-top: 21px;
            border-bottom:1px solid #cccccc;
        }
        .middle{
            width: 100px;
            height:43px;
            float: left;
        }
        span{
            width:99px;
            height:43px;
            line-height: 43px;
            color:#777;
            text-align: center;
            float:left;
        }
        .form_group5{
            width: 170px;
            height:43px;
            float:right;
        }
        .contain_left{
            width: 112px;
            height:43px;
            float: left;
            text-align: center;
        }
        .span2{
            color: black;
            line-height: 43px;
            font-size: 16px;
        }
        .contain_right{
            width:326px;
            height:36px;
            float: right;
            border: 1px solid #cccccc;
        }
        .form_control3{
            width: 326px;
            height:36px;
            float: right;
            line-height: 36px;
            border:0px;
            display: block;
            font-size: 15px;
        }
        .blank4{
            width:440px;
            height:33px;
        }
        /*添加注册按钮*/
        .bt1{
            height:46px;
            width:440px;
            background-color: #337ab7;
            border-color: #2e6da4;
            border:none;
            font-size: 20px;
            color: white;
        }
        /*已有账号*/
        .already{
            height:30px;
            width:440px;
            line-height: 30px;
            text-align: right;
        }
        a{
            text-decoration: none;
        }
        /*页面结尾部分*/
        .footer{
            height:70px;
            width:1349px;
        }
        p{
            height:20px;
            width:1110px;
            text-align: center;
            margin-top: 60px;
            color: #777;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript" src="../js/base/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
      $(function(){
    	  
      });
    </script>
</head>
<body>
<!--导航与logo部分-->
    <div class="met-head">
    <div class="row">
        <div class="logo">
            <div class="nav">
                <ul>
                    <li class="met-logo"><img src="../images/logos.png"></a></li>
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
<!--页面主体-->
    <div class="main">
        <div class="blank"></div>
        <!--form表单内容-->
        <form class="form_regist" method="post" action="#" novalidate="novalidate">
            <div class="blank2"></div>
            <!--用户名输入框-->
            <div class="form_group">
                <div class="input_left">
                    <i class="fa fa-user"></i>
                </div>
                <div class="input_right">
                    <input type="text" name="username" placeholder="&nbsp;会员名" class="form_control"/>
                    <div class="tan">用户名已存在</div>
                </div>
            </div>
            <div class="blank3"></div>
            <!--密码框输入-->
            <div class="form_group">
                <div class="input_left">
                    <i class="fa fa-user"></i>
                </div>
                <div class="input_right">
                    <input type="password" name="password" placeholder="&nbsp;密码" class="form_control"/>
                    <div class="tan">密码为6-16位字母数字组成</div>
                </div>
            </div>
            <div class="blank3"></div>
            <!--重复密码-->
            <div class="form_group">
                <div class="input_left">
                    <i class="fa fa-user"></i>
                </div>
                <div class="input_right">
                    <input type="password" name="password" placeholder="&nbsp;重复密码" class="form_control"/>
                    <div class="tan">密码有误</div>
                </div>
            </div>
            <div class="blank3"></div>
            <!--验证码-->
            <div class="form_group2">
                <div class="form_group3">
                    <div class="input_left">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="input_right2">
                        <input type="text" name="rename" placeholder="&nbsp;验证码" class="form_control2"/>
                    </div>
                </div>
                <div class="act"></div>
            </div>
            <div class="blank3"></div>
            <!--更多信息-->
            <div class="form_group2">
                <div class="form_group4">
                    <div class="hr"></div>
                </div>
                <div class="middle">
                    <span>更多资料</span>
                </div>
                <div class="form_group5">
                    <div class="hr"></div>
                </div>
            </div>
            <!--公司信息-->
            <div class="blank3"></div>
            <div class="form_group2">
                <div class="contain_left">
                    <span class="span2">公司名称</span>
                </div>
                <div class="contain_right">
                    <input type="text" name="game" class="form_control3" placeholder="&nbsp;公司名称"/>
                </div>
            </div>
            <div class="blank4"></div>
            <div class="form_group2">
                <div class="contain_left">
                    <span class="span2">公司传真</span>
                </div>
                <div class="contain_right">
                    <input type="text" name="gamemax" class="form_control3" placeholder="&nbsp;公司传真"/>
                </div>
            </div>
            <div class="blank4"></div>
            <div class="form_group2">
                <div class="contain_left">
                    <span class="span2">公司联系地址</span>
                </div>
                <div class="contain_right">
                    <input type="text" name="gamephone" class="form_control3" placeholder="&nbsp;公司联系地址"/>
                </div>
            </div>
            <div class="blank4"></div>
            <div class="form_group2">
                <div class="contain_left">
                    <span class="span2">公司邮政编码</span>
                </div>
                <div class="contain_right">
                    <input type="text" name="gamemail" class="form_control3" placeholder="&nbsp;公司邮政编码"/>
                </div>
            </div>
            <div class="blank4"></div>
            <div class="form_group2">
                <div class="contain_left">
                    <span class="span2">公司网址</span>
                </div>
                <div class="contain_right">
                    <input type="text" name="gamedr" class="form_control3" placeholder="&nbsp;公司网址"/>
                </div>
            </div>
            <div class="blank4"></div>
            <div class="form_group2">
                <button type="submit" class="bt1">立即注册</button>
            </div>
            <div class="blank3"></div>
            <div class="already">
                <a href="login.html">已有账号？</a>
            </div>
        </form>
    </div>
<!--页面结尾部分-->
    <div class="footer">
        <p>化妆品商城&nbsp;&nbsp;版权所有&nbsp;&nbsp;2018-2018&nbsp;&nbsp;
            晋ICP备8888888&nbsp;&nbsp;本网站为演示数据</p>
    </div>
</body>
</html>