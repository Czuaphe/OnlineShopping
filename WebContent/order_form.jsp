<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--订单生成页面-->
     <meta charset="UTF-8">
    <title></title>
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
            width:100px;
            float: left;
        }
        .nav ul{
            list-style: none;
        }
        .nav ul li{
            height:40px;
            float: left;
        }
        a{
            text-decoration: none;
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
        .con1{
            height:40px;
            width:130px;
            line-height: 40px;
            text-align: center;
            float: left;
        }
        .con2{
            height:40px;
            width:116px;
            font-size: 16px;
            line-height: 40px;
            text-align: center;
            float: right;
        }
        .quan{
            height:40px;
            width:130px;
            font-size: 16px;
            color: #cccccc;
            text-decoration: none;
        }
        .buycar{
            height:40px;
            width:116px;
            color: #cccccc;
            text-decoration: none;
        }
        .quan:hover{
            color:#f32196;
        }
        .buycar:hover{
            color: #f32196;
        }
        .empty{
            width:1349px;
            height:20px;
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
        .logo_right{
            width:490px;
            height:90px;
            float: right;
            background-image: url(./img/1234.jpg);
        }
        /*页面主体部分*/
        .show{
            height:980px;
            width:1349px;
            padding-top: 30px;
        }
        .contain{
            height:900px;
            width:1170px;
            background-color: white;
        }
        .font{
            height:50px;
            width:1080px;
            font-size: 16px;
            color: #777;
            line-height:50px;
        }
        .message{
            height:900px;
            width:1080px;
            border: 1px solid #b0b0b0;
        }
        .loc{
            height:120px;
            width: 1040px;
            border-bottom: 1px solid #b0b0b0;
        }
        .floor1{
            height:30px;
            width:1040px;
        }
        .floor1_l{
            height:30px;
            width:800px;
            float: left;
            line-height: 30px;
            font-size: 15px;
            font-weight: bolder;
        }
        .floor1_r{
            height:30px;
            width:190px;
            float: right;
            text-align: center;
            line-height: 30px;
            font-size:14px;
        }
        .floor1_r a{
            text-decoration: none;
        }
        .floor2{
            width:1040px;
            height:30px;
            padding-left: 20px;
            margin-top: 10px;
        }
        .floor21{
            width:150px;
            height:26px;
            border:2px solid red;
            float: left;
        }
        .floor22{
            width:550px;
            height:30px;
            float: left;
            background-color: #2e6da4;
        }
        .floor23{
            width:80px;
            height:30px;
            color: white;
            float: left;
            line-height:30px;
            text-align: center;
            background-color: #b0b0b0;
        }
        .floor3{
            width:1040px;
            height:60px;
            padding-left: 20px;
            line-height:60px;
            font-size: 13px;
            color:#777777;
        }
        .pay{
            height:120px;
            width: 1040px;
            border-bottom: 1px solid #b0b0b0;
        }
        .later{
            height: 28px;
            width:98px;
            border: 1px solid #DDDDDD;
            line-height: 26px;
            font-size: 13px;
            text-align: center;
            color: #B9B0C3;
            float: left;
            background-color: #F3F3F3;
        }
        .online{
            height: 26px;
            width:96px;
            border:2px solid red;
            color: #777777;
            line-height: 26px;
            text-align: center;
            float: left;
            margin-left: 50px;
        }
        .more{
            height:26px;
            width:100px;
            line-height: 26px;
            text-align: center;
            float: left;
            margin-left: 100px;
        }
       .ways{
            height:270px;
            width:1040px;
            margin-bottom: 10px;
        }
        .ways_lef{
            height:270px;
            width:410px;
            background-color:#F7F7F7;
            float: left;
        }
        .ways_font{
            height:39px;
            padding-top: 10px;
            padding-left: 15px;
            width:395px;
            font-size:14px;
            line-height:39px;
        }
        .fast_ways{
            height: 26px;
            width:200px;
            margin-top: 10px;
            border:2px solid red;
            color: #777777;
            line-height: 26px;
            text-align: center;
            font-size: 14px;
            margin-left:15px;
        }
        .ways_time{
            height:40px;
            margin-top: 20px;
            margin-left: 15px;
            width:320px;
            font-size:14px;
            line-height:40px;
            color:#999999;
            border-bottom: 1px solid #AAAAAA;
        }
        .ways_safe{
            height:40px;
            margin-left: 15px;
            width:320px;
            font-size:14px;
            color:#999999;
            line-height: 40px;
        }
        .safe_buy{
            height:40px;
            margin-left: 15px;
            width:320px;
            font-size:14px;
            line-height: 40px;
        }
        .ways_rig{
            height:270px;
            width:630px;
            float: right;
            background-color:#F3FBFE;
        }
        .ways_blank{
            height:40px;
            width:630px;
        }
        .ways_pic{
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
        .ways_price{
            height:69px;
            padding-top:39px;
            width:110px;
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
        .ways_num{
            height:69px;
            padding-top:39px;
            width:100px;
            float: left;
        }
        .number{
            height:30px;
            width:50px;
            float: right;
            font-size: 14px;
            line-height:30px;
            color:#999999;
        }
        .ways_p{
            height:69px;
            padding-top:39px;
            width:65px;
            float: left;
        }
        .p_goods{
            height:30px;
            width:48px;
            float: right;
            font-size: 14px;
            line-height:30px;
            color: #999999;
        }
        .ways_bot_lef{
            height:30px;
            width:380px;
            float: left;
            margin-top:30px;
            padding-top:20px;
            margin-left: 10px;
            font-size: 14px;
            color:#999999;
            border-top:1px solid #999999;
        }
        .ways_bot_rig{
            height:30px;
            line-height: 30px;
            width:220px;
            margin-top:30px;
            padding-top:20px;
            float: left;
            background-color:brown;
            color:red;
            font-size:16px;
            border-top:1px solid #999999;
        }
        .order{
            height:18px;
            width:1040px;
            line-height: 18px;
            color:#777777;
            font-size:14px;
        }
        .beizhu{
            margin-top: 5px;
            height:30px;
            width:1020px;
            line-height: 25px;
        }
        .write{
            height:25px;
            width:500px;
            float: left;
            color: #777777;
        }
        .beizhu_right{
            margin-left: 20px;
            height:25px;
            width:400px;
            float: left;
            color: #cccccc;
            font-size: 15px;
        }
        /*合计金额部分*/
        .pay-for{
            height:350px;
            width:1080px;
        }
        .count{
            height:130px;
            width:1080px;
        }
        .count-left{
            height:26px;
            width:950px;
            line-height: 26px;
            float: left;
            color:#666666;
            font-size: 14px;
        }
        .count-left span{
            float: right;
        }
        .count-right{
            height:26px;
            width:130px;
            line-height: 26px;
            font-size: 15px;
            float: right;
        }
        .count-right span{
            float: right;
        }
        .guest{
            height:45px;
            width:1080px;
            background-color: #FFFAE7;
        }
        .guest-font{
            height:45px;
            line-height:45px;
            float: right;
        }
        .sum{
            height:65px;
            width:1080px;
            padding-top: 10px;
            background-color: #F4F4F4;
        }
        .sum-should{
            height:30px;
            width:940px;
            line-height: 30px;
            float: left;
            color:#666666;
            font-size: 14px;
        }
        .sum-should span{
            float: right;
            color:#999999;
        }
        .money{
            height:30px;
            width:140px;
            float: right;
            color:red;
            line-height: 30px;
            font-size: 20px;
            font-weight: bolder;
        }
        .sum-man{
            height:30px;
            width:1040px;
            float: right;
            color:#99A4BD;
        }
        .sub{
            height:90px;
            padding-top: 10px;
            padding-right: 15px;
            width:1065px;
        }
        .sub-bt{
            height:36px;
            width:135px;
            float: right;
            background-color: #E13436;
        }
        .bt{
            height:36px;
            width:135px;
            line-height: 36px;
            font-size:20px;
            font-weight:bolder;
            border: none;
            background-color: red;
            color: white;
        }
        /*导航模块*/
        .container{
            height:256px;
            width:1142px;
        }
        .nav3{
            height: 83px;
            width:1142px;
            border-bottom: 1px solid #cccccc;
        }
        .nav3 ul{
            list-style: none;
        }
        .nav3 ul li{
            height:83px;
            width:228px;
            font-size:18px;
            float: left;
            color: #777777;
        }
        .blank{
            height:20px;
        }
        .shuge{
            height:41.5px;
            line-height: 41.5px;
            text-align: center;
            border-right: 1px solid #cccccc;
        }
        .shouhou{
            line-height: 83px;
            text-align: center;
        }
        .blank2{
            height:20px;
            width: 1142px;
        }
        /*综合服务块*/
        .tables{
            height:131px;
            width:913px;
            float: left;
        }
        .tables ul{
            list-style: none;
        }
        .table_1{
            height:131px;
            width:152px;
            float: left;
        }
        b{
            height:24px;
            width:152px;
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
            width:152px;
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
        .table_right{
            height:101px;
            width: 228px;
            border-left:1px solid #cccccc;
            float: right;
        }
        .cal{
            height:35px;
            width:228px;
            line-height:35px;
            font-size:20px;
            color:#f32196;
            text-align: center;
        }
        .time{
            height:24px;
            width:228px;
            line-height:24px;
            font-size:10px;
            text-align: center;
        }
        /*页面结尾部分*/
        footer{
            height:60px;
            width:1170px;
            padding-left: 89.5px;
            padding-right: 89.5px;
            padding-top: 40px;
            background-color:#fafafa;
        }
        .footer-left{
            height:20px;
            width:1000px;
            float: left;
            line-height: 20px;
            font-size:12px;
            color: #b0b0b0;
        }
        .footer-right{
            height: 20px;
            width:170px;
            float: right;
            line-height: 20px;
            font-size:14px;
            color:#b0b0b0;
        }
    </style>
</head>
<body>
<!--页面顶头部分-->
    <div class="met-head">
    <div class="main-head">
        <div class="head-left">
            <span class="come">欢迎来到美魅购物商城</span>
        </div>
        <div class="nav">
            <ul>
                <li><a class="login" href="login.html">登录</a></li>
                <li><div class="shu"></div></li>
                <li><a class="register" href="register.html">注册</a></li>
            </ul>
        </div>
        <div class="con1">
            <a class="quan" href="#">收藏夹</a>
        </div>
        <div class="con2">
            <a class="buycar" href="shop_car.html">购物车</a>
        </div>
    </div>
</div>
    <div class="empty"></div>
<!--导航与logo部分-->
    <div class="met-logo">
        <div class="photo"></div>
        <div class="photo_right">结算页</div>
        <div class="logo_right"></div>
    </div>
<!--咨询导航块-->
<!--页面主体-->
    <div class="show">
        <div class="contain">
            <div class="font">填写并核对账单信息</div>
            <div class="message">
                <div class="loc">
                    <div class="floor1">
                        <div class="floor1_l">收货人信息</div>
                        <div class="floor1_r"><a href="#">新增收货地址</a></div>
                    </div>
                    <div class="floor2">
                        <div class="floor21"></div>
                        <div class="floor22"></div>
                        <div class="floor23">默认地址</div>
                    </div>
                    <div class="floor3">该地址有配送站点，可放心下单</div>
                </div>
                <div class="pay">
                    <div class="floor1">
                        <div class="floor1_l">支付方式</div>
                    </div>
                    <div class="floor2">
                        <div class="later">
                            <div class="later_pay">货到付款</div>
                        </div>
                        <div class="online">
                            <div class="online_pay">在线支付</div>
                        </div>
                        <div class="more"><a href="#">更多方式 >></a></div>
                    </div>
                    <div class="floor3">在线支付更优惠哦</div>
                </div>
                <div class="floor1">
                    <div class="floor1_l">送货清单</div>
                </div>
                <div class="ways">
                    <div class="ways_lef">
                        <div class="ways_font">配送方式</div>
                        <div class="fast_ways">快递运输</div>
                        <div class="ways_time">配送时间：工作日、双休日与节假日均可送货</div>
                        <div class="ways_safe">运费险&nbsp;&nbsp;本店支持7天退货，15天换货</div>
                        <div class="safe_buy">可放心选购</div>
                    </div>
                    <div class="ways_rig">
                        <div class="ways_blank"></div>
                        <div class="ways_pic">
                            <div class="picture">
                            	<img alt="" src="">
                            </div>
                            <div class="picture_up">
                            	<img alt="" src="">
                            </div>
                            <div class="picture_down">
                                &nbsp;&nbsp;支持7天无理由退换货
                            </div>
                        </div>
                        <div class="ways_price">
                            <div class="pre_price"></div>
                        </div>
                        <div class="ways_num">
                            <div class="number">×1</div>
                        </div>
                        <div class="ways_p">
                            <div class="p_goods">有货</div>
                        </div>
                        <div class="ways_bot_lef">退换无忧</div>
                        <div class="ways_bot_rig">
                        </div>
                    </div>
                </div>
                <div class="ways">
                    <div class="ways_lef">
                        <div class="ways_font">配送方式</div>
                        <div class="fast_ways">快递运输</div>
                        <div class="ways_time">配送时间：工作日、双休日与节假日均可送货</div>
                        <div class="ways_safe">运费险&nbsp;&nbsp;本店支持7天退货，15天换货</div>
                        <div class="safe_buy">可放心选购</div>
                    </div>
                    <div class="ways_rig">
                        <div class="ways_blank"></div>
                        <div class="ways_pic">
                            <div class="picture">

                            </div>
                            <div class="picture_up">

                            </div>
                            <div class="picture_down">
                                &nbsp;&nbsp;支持7天无理由退换货
                            </div>
                        </div>
                        <div class="ways_price">
                            <div class="pre_price"></div>
                        </div>
                        <div class="ways_num">
                            <div class="number">×1</div>
                        </div>
                        <div class="ways_p">
                            <div class="p_goods">有货</div>
                        </div>
                        <div class="ways_bot_lef">退换       无忧</div>
                        <div class="ways_bot_rig">
                        </div>
                    </div>
                </div>
                <div class="order">添加订单备注</div>
                <div class="beizhu">
                    <input type="text" class="write" placeholder="&nbsp;限45个字（定制类商品，请将购买需求在备注中做详细说明）"/>
                    <div class="beizhu_right">提示：请勿填写有关支付、收货、发票方面的信息</div>
                </div>
            </div>
        </div>
    </div>
<!--结账部分-->
    <div class="pay-for">
        <div class="count">
            <div class="count-left"><span>总商品金额：</span></div><div class="count-right"><span></span></div>
            <div class="count-left"><span>返现：</span></div><div class="count-right"><span></span></div>
            <div class="count-left"><span>运费：</span></div><div class="count-right"><span></span></div>
            <div class="count-left"><span>服务费：</span></div><div class="count-right"><span></span></div>
            <div class="count-left"><span>退货无忧：</span></div><div class="count-right"><span></span></div>
        </div>
        <div class="guest">
            <div class="guest-font">开通会员PLUS，享受商品会员价，&nbsp;&nbsp;&nbsp;立省运费 ></div>
        </div>
        <div class="sum">
            <div class="sum-should"><span>应付金额:</span></div>
            <div class="money"></div>
            <div class="sum-man"></div>
        </div>
        <div class="sub">
            <div class="sub-bt">
                 <input type="submit" value="提交订单" class="bt"/>
            </div>
        </div>
    </div>
<!--综合服务块-->
    <div class="container">
        <div class="nav3">
            <ul>
                <li><div class="blank"></div><div class="shuge">预约维修服务</div></li>
                <li><div class="blank"></div><div class="shuge">7天无理由退货</div></li>
                <li><div class="blank"></div><div class="shuge">15天免费换货</div></li>
                <li><div class="blank"></div><div class="shuge">满150元包邮</div></li>
                <li class="shouhou">520余家售后网点</li>
            </ul>
        </div>
        <div class="blank2"></div>
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
        <div class="table_right">
            <div class="cal">400-000-000</div>
            <div class="time">服务时间：9:00-22:00</div>
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