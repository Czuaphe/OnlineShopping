<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--购物车详情页面-->
     <meta charset="UTF-8">
    <title>购物车页面</title>
    <style type="text/css">
        *{
            margin:0 auto;
            padding:0;
        }
        /*顶部样式*/
        .met-head{
            height:40px;
            width: 1349px;
            background-color: black;
        }
        .main-head{
            height:40px;
            width:1170px;
        }
        .head-left{
            height:40px;
            width:772px;
            margin-left: 50px;
            float: left;
        }
        .come{
            line-height: 40px;
            font-size: 16px;
            color:#cccccc;
        }
        .nav{
            height:40px;
            width:348px;
            float: left;
        }
        .nav ul{
            list-style: none;
        }
        .nav ul li{
            height:40px;
            float: left;
        }
        .login{
            height:40px;
            width: 30px;
            font-size:16px;
            color: #cccccc;
            line-height: 40px;
            text-decoration: none;
        }
        .login:hover{
            color:#f32196;
        }
        .shu{
            height:12px;
            margin-top:14px;
            width:1px ;
            margin-left:15px;
            margin-right: 15px;
            background-color: #999999;
        }
        .register{
            height:40px;
            width: 30px;
            font-size:16px;
            color: #cccccc;
            line-height: 40px;
            text-decoration: none;
        }
        .register:hover{
            color:#f32196;
        }
        .quan{
            height:40px;
            width:170px;
            font-size: 16px;
            line-height: 40px;
            color: #cccccc;
            text-align: center;
            text-decoration: none;
        }
        .buycar{
            height:40px;
            width:80px;
            font-size: 16px;
            line-height: 40px;
            color: #cccccc;
            text-align: center;
            text-decoration: none;
        }
        .quan:hover{
            color:#f32196;
        }
        .buycar:hover{
            color: #f32196;
        }
        .empty{
            height:20px;
            width:1349px;
        }
        /*logo部分样式*/
        .met-logo{
            height:90px;
            width:990px;
        }
        .photo{
            width:121px;
            height:90px;
            float: left;
            background-image:url(./img/resizeApi.jpg) ;
        }
        .photo_right{
            width:100px;
            height:90px;
            text-align:center ;
            line-height: 90px;
            float: left;
            font-size: 25px;
        }
        .so{
            width:326px;
            height:28px;
            float: right;
            padding-top:42px;
        }
        .so_f{
            width:326px;
            height:28px;
            background-color:aqua;
        }
        .so_left{
            width:270px;
            height:24px;
            border:2px solid red;
            float: left;
        }
        .sosuo{
            width:270px;
            height:24px;
            font-size: 14px;
            border:none;
        }
        .so_right{
            width:52px;
            height:28px;
            float: right;
        }
        .bt{
            width:52px;
            height:28px;
            background-color: red;
            border: none;
            line-height: 28px;
            font-size:16px;
            text-align: center;
            color: white;
        }
        .goods{
            width:990px;
            height:40px;
            line-height:40px;
            font-size:20px;
            margin-top: 30px;
            color: red;
        }
        .check_box{
            width:980px;
            height: 40px;
            color: #666;
            line-height: 40px;
            padding-left: 10px;
            background-color:#F3F3F3;
            border: 1px solid #e9e9e9;
        }
        .check{
            width:150px;
            height:32px;
            float: left;
        }
        .t-goods{
            width:400px;
            height:32px;
            float: left;
        }
        .t-price{
            width:120px;
            height:32px;
            float: left;
        }
        .t-quantity{
            width:130px;
            height:32px;
            float: left;
        }
        .t-sum{
            width:100px;
            height:32px;
            float: left;
        }
        .t-action{
            width:50px;
            height:32px;
            float:left;
        }
        /*商品展示模块*/
        .main{
            height:215px;
            width:990px;
        }
        .main-up{
            height:54px;
            width:990px;
            border-bottom: 1px solid #AAAAAA;
        }
        .main-down{
            height:158px;
            width:988px;
            border:1px solid #AAAAAA;
        }
        .check_p{
            height:72px;
            width:30px;
            padding-top: 56px;
            float: left;
            text-align: center;
        }
        .wares{
            height:128px;
            width:958px;
            float: right;
        }
        .wares_blank{
            height:20px;
            width:958px;
        }
        .wares_pic{
            height:108px;
            width:340px;
            padding-left: 10px;
            float: left;
        }
        .picture{
            height:100px;
            width:70px;
            border: 1px solid #999999;
            float: left;
        }
        .picture_up{
            height:65px;
            width:260px;
            float: right;
            background-color: royalblue;
        }
        .picture_down{
            font-size: 14px;
            color:#6485CB;
        }
        .wares_price{
            height:69px;
            padding-top:39px;
            width:225px;
            float: left;
        }
        .pre_price{
            height:30px;
            width:70px;
            float: right;
            font-size: 16px;
            line-height:30px;
            background-color: red;
        }
        .wares_num{
            height:69px;
            padding-top:39px;
            width:145px;
            float: left;
        }
        .num_pic{
            height:30px;
            width:100px;
            float: right;
            background-color: white;
            border: 1px solid #999999;
        }
        .pic_lef{
            height:30px;
            width:30px;
            border-right:1px solid #999999;
            text-align: center;
            font-size: 26px;
            line-height: 30px;
            float: left;
        }
        .pic_mid{
            height:30px;
            width:38px;
            border-right:1px solid #999999;
            text-align: center;
            line-height:30px;
            font-size:16px;
            float: left;
        }
        .pic_rig{
            height:30px;
            width:30px;
            text-align: center;
            font-size: 26px;
            line-height: 30px;
            float: left;
        }
        .wares_sum{
            height:69px;
            padding-top:39px;
            width:110px;
            float: left;
        }
        .pre_sum{
            height:30px;
            width:70px;
            float: right;
            font-size: 16px;
            line-height:30px;
            background-color: red;
        }
        .wares_ope{
            height:69px;
            padding-top:39px;
            width:95px;
            float: left;
        }
        .ope_del{
            height:30px;
            width:48px;
            float: right;
            font-size: 16px;
            line-height:30px;
            color: red;
        }
        .down_end{
            height:20px;
            width:958px;
            float: right;
        }
        .down_p{
            background-color: black;
            height:20px;
            width:36px;
            margin-left: 10px;
            font-size: 14px;
            line-height: 20px;
            color:white;
            float: left;
        }
        .down_p_font{
            height:20px;
            line-height:20px;
            width:280px;
            float: left;
            font-size:14px;
            color:#999999;
        }
        .down_a{
            font-size: 14px;
            height:20px;
            width:70px;
            float: left;
        }
        a{
            text-decoration: none;
            color: black;
        }
        .check_box2{
            width:980px;
            height: 40px;
            margin-top:20px;
            margin-bottom: 20px;
            color: #666;
            line-height: 40px;
            padding-left: 10px;
            border: 1px solid #e9e9e9;
        }
        .deleteall{
            width:470px;
            height:40px;
            line-height:40px;
            float: left;
        }
        .num{
            height:40px;
            width:120px;
            line-height:40px;
            float: left;
        }
        .sum{
            height:40px;
            width:100px;
            line-height:40px;
            float: left;
        }
        .sub{
            height:40px;
            width:85px;
            line-height: 40px;
            float: right;
        }
        .sub-btn{
            height:40px;
            width:85px;
            color: white;
            background-color: red;
            float: right;
            border: none;
            font-weight: bolder;
            font-size: 18px;
        }
        /*商品下方导航模块*/
        .container{
            height:280px;
            width:1349px;
            background-color: #EAEAEA;
        }
        .kuai1{
            height:104px;
            width:180px;
            float: left;
        }
        .goods-down{
            height: 104px;
            width:1349px;
            border-bottom: 1px solid #cccccc;
        }
        .blank2{
            height:20px;
            width: 1349px;
        }
        /*综合服务块*/
        .kuai2{
            height:104px;
            width:160px;
            float: left;
        }
        .tables{
            height:151px;
            width:1080px;
            float: left;
        }
        .tables ul{
            list-style: none;
        }
        .table_1{
            height:151px;
            width:180px;
            float: left;
        }
        b{
            height:24px;
            width:180px;
            line-height: 24px;
            font-size: 15px;
            margin-bottom: 14px;
        }
        b a{
            color: black;
            text-decoration: none;
        }
        p{
            height:14px;
        }
        ol{
            height:86px;
            width:180px;
            list-style: none;
        }
        ol li{
            height:28px;
            line-height:28px;
            font-size:13px;

        }
        ol li a{
            color:#777;
            text-decoration: none;
        }
        /*页面结尾部分*/
        footer{
            height:60px;
            width:1170px;
            padding-left: 89.5px;
            padding-right: 89.5px;
            padding-top: 40px;
            background-color:#EAEAEA;
        }
        .footer-left{
            height:20px;
            width:1000px;
            float: left;
            line-height: 20px;
            font-size:12px;
            color: #777;
        }
        .footer-right{
            height: 20px;
            width:170px;
            float: right;
            line-height: 20px;
            font-size:14px;
            color:#777;
        }
    </style>
</head>
<body>
<!--页面顶头部分-->
    <div class="met-head">
    <div class="main-head">
        <div class="head-left">
            <span class="come">欢迎来到购物车页面</span>
        </div>
        <div class="nav">
            <ul>
                <li><a class="login" href="login.html">登录</a></li>
                <li><div class="shu"></div></li>
                <li><a class="register" href="register.html">注册</a></li>
                <li class="quan">我的优惠券</li>
                <li class="buycar">购物车</li>
            </ul>
        </div>
    </div>
</div>
    <div class="empty"></div>
<!--logo部分-->
    <div class="met-logo">
        <div class="photo"></div>
        <div class="photo_right">购物车</div>
        <div class="so">
            <div class="so_f">
                <div class="so_left">
                    <input type="text" class="sosuo" placeholder="搜索商城中的商品"/>
                </div>
                <div class="so_right">
                    <button type="submit" class="bt">搜索</button>
                </div>
            </div>
        </div>
    </div>
<!--购物商品展示块-->
    <div class="goods">全部商品</div>
    <div class="check_box">
        <div class="check">
            <input type="checkbox" id="check_all" name="check_all"/>&nbsp;&nbsp;全选
        </div>
        <div class="t-goods">商品</div>
        <div class="t-price">单价</div>
        <div class="t-quantity">数量</div>
        <div class="t-sum">小计</div>
        <div class="t-action">操作</div>
    </div>
 <div class="main">
        <div class="main-up"></div>
        <div class="main-down">
            <div class="check_p">
                <input type="checkbox" id="check_pk" name="check_pk"/>
            </div>
            <div class="wares">
                <div class="wares_blank"></div>
                <div class="wares_pic">
                    <div class="picture">

                    </div>
                    <div class="picture_up">

                    </div>
                    <div class="picture_down">
                        &nbsp;&nbsp;支持7天无理由退换货
                    </div>
                </div>
                <div class="wares_price">
                    <div class="pre_price"></div>
                </div>
                <div class="wares_num">
                    <div class="num_pic">
                        <div class="pic_lef">-</div>
                        <div class="pic_mid">1</div>
                        <div class="pic_rig">+</div>
                    </div>
                </div>
                <div class="wares_sum">
                    <div class="pre_sum"></div>
                </div>
                <div class="wares_ope">
                    <div class="ope_del">删除</div>
                </div>
            </div>
            <div class="down_end">
                <div class="down_p">PLUS</div>
                <div class="down_p_font">&nbsp;&nbsp;免费试用PLUS会员，享受商品会员价</div>
                <div class="down_a"><a href="#">立即试用></a></div>
            </div>
        </div>
    </div>
    <div class="main">
    <div class="main-up"></div>
    <div class="main-down">
        <div class="check_p">
            <input type="checkbox" id="check_pk" name="check_pk"/>
        </div>
        <div class="wares">
            <div class="wares_blank"></div>
            <div class="wares_pic">
                <div class="picture">

                </div>
                <div class="picture_up">

                </div>
                <div class="picture_down">
                    &nbsp;&nbsp;支持7天无理由退换货
                </div>
            </div>
            <div class="wares_price">
                <div class="pre_price"></div>
            </div>
            <div class="wares_num">
                <div class="num_pic">
                    <div class="pic_lef">-</div>
                    <div class="pic_mid">1</div>
                    <div class="pic_rig">+</div>
                </div>
            </div>
            <div class="wares_sum">
                <div class="pre_sum"></div>
            </div>
            <div class="wares_ope">
                <div class="ope_del">删除</div>
            </div>
        </div>
        <div class="down_end">
            <div class="down_p">PLUS</div>
            <div class="down_p_font">&nbsp;&nbsp;免费试用PLUS会员，享受商品会员价</div>
            <div class="down_a"><a href="#">立即试用></a></div>
        </div>
    </div>
</div>
    <div class="check_box2">
        <div class="check">
            <input type="checkbox" id="check_all" name="check_all"/>&nbsp;&nbsp;全选
        </div>
        <div class="deleteall">删除所有商品</div>
        <div class="num">
            <span>已选择几件商品</span>
        </div>
        <div class="sum">
        </div>
        <div class="sub">
            <input type="button" class="sub-btn" value="去结算"/>
        </div>
    </div>
<!--综合服务块-->
<div class="container">
    <div class="goods-down">
        <div class="kuai1"></div>
        <img src="./img/1.jpg" />
    </div>
    <div class="blank2"></div>
    <div class="kuai2"></div>
    <div class="tables">
        <ul>
            <li class="table_1">
                <b><a href="#">帮助中心</a></b><p></p>
                <ol>
                    <li><a href="#">账户管理</a></li>
                    <li><a href="#">购物指南</a></li>
                    <li><a href="#">订单操作</a></li>
                </ol>
            </li>
            <li class="table_1">
                <b><a href="#">服务支持</a></b><p></p>
                <ol>
                    <li><a href="#">售后政策</a></li>
                    <li><a href="#">自助服务</a></li>
                    <li><a href="#">相关下载</a></li>
                </ol>
            </li>
            <li class="table_1">
                <b><a href="#">线下门店</a></b><p></p>
                <ol>
                    <li><a href="#">化妆品店</a></li>
                    <li><a href="#">服务网点</a></li>
                    <li><a href="#">零售网点</a></li>
                </ol>
            </li>
            <li class="table_1">
                <b><a href="#">关于我们</a></b><p></p>
                <ol><li><a href="#">品牌故事</a></li>
                    <li><a href="#">加盟合作</a></li>
                    <li><a href="#">联系我们</a></li>
                </ol>
            </li>
            <li class="table_1">
                <b><a href="#">关注我们</a></b><p></p>
                <ol><li><a href="#">新浪微博</a></li>
                    <li><a href="#">扣扣部落</a></li>
                    <li><a href="#">官方微信</a></li>
                </ol>
            </li>
            <li class="table_1">
                <b><a href="#">特色服务</a></b><p></p>
                <ol>
                    <li><a href="#">A码通道</a></li>
                    <li><a href="#">礼物码</a></li>
                    <li><a href="#">防伪查询</a></li>
                </ol>
            </li>
        </ul>
    </div>
</div>
<!--页面结尾部分-->
<footer>
    <div class="blank3"></div>
    <div class="footer-left">
        <span>化妆品商城&nbsp;版权所有&nbsp;2018&nbsp;晋ICP备888888（本网站为演示数据）</span>
    </div>
    <div class="footer-right">
        <span>Powered By MeInfo</span>
    </div>
</footer>
</body>
</html>