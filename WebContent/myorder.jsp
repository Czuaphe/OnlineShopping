<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineshopping.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<!-- 框架所需CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/web-fonts.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">

    <!-- 用户自定义CSS文件 -->
    <link rel="stylesheet" href=" ./css/myorder.css">

    <!-- 框架所需JS文件 -->
    <script src="./js/base/jquery-3.2.1.min.js"></script>
    <script src="./js/base/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>

</head>
<body>
<div class="myorder">
    <div class="myorder_left">
        <div class="myorder_left_1"></div>
        <ul>
            <li>
                <h1 style="font-size: 20px;font-weight: normal;color: black">订单中心</h1>
            </li>
            <li><a href="#">个人中心</a></li>
            <li><a href="myorder.jsp">我的订单</a></li>
            <li><a href="#">我的收藏</a></li>
            <li><a href="#">我的优惠券</a></li>
            <li><a href="#">收货地址</a></li>
            <li><a href="#">消费明细</a></li>
            <li><a href="#">账户设置</a></li>

        </ul>

    </div>
    <div class="myorder_middle"></div>
    <div class="myorder_right">
        <div class="myorder_right_top">
            <div class="myorder_right_top1">
                <ul>
                    <li><a href="#">全部有效订单</a></li>
                    <li id="tab1"  onmouseover="changeTab1()" class="selected"><a href="#">待支付(<span id="num"></span>0)</a></li>
                    <li id="tab2"  onmouseover="changeTab2()"><a href="#">待收货(<span id="num1"></span>0)</a></li>
                    <li id="tab3"    onmouseover="changeTab3()">  <a href="#" >已关闭</a></li>
                </ul>
            </div>
        </div>
        <div class="myorder_right_middle">
                <input id="search" type="search" name="" placeholder="商品订单、订单编号">
                <input id="button" type="button" value="搜索"/>
        </div>
        <!--全部有效订单-->
        <div class="tab-content">
            <div id="c1" class="myorder_right_down">
                <div class="myorder_right_down1">
                    <div  class="myorder_right_down1_left">
                        <div class="myorder_right_down1_left_top">
                            <span>待支付</span>
                        </div>
                        <div class="myorder_right_down1_left_bottom">
                            <table width="460">
                                <tr>
                                    <td width="60"><span>订单号:</span></td>
                                    <td width="160"><span>18位数字以内</span></td>
                                    <td width="160"><span>2017/1/10 11:18:38</span></td>
                                    <td width="60"><span>在线支付</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="myorder_right_down1_right">
                        <span>订单金额:</span>12345678
                    </div>
                </div>
                <div class="myorder_right_down2">
                    <div class="myorder_right_down2_left">
                        <table width="440" valign="center" align="left">
                            <tr>
                                <td rowspan="2"><img  style="width: 300px" src="../img/data.png" alt=""/></td>
                            </tr>
                            <tr>
                                <td><span>傻样那个腹水</span><br>
                                    <span>美白警服</span>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                    </div>
                    <div class="myorder_right_down2_right">
                        <div class="myorder_right_down2_right_1">
                            <a href="myorderdetils.html">订单详情</a>
                        </div>
                        <div class="myorder_right_down2_right_2">
                            <a id="pay" href="#" >立即付款</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--待收货-->
            <div id ="c2" class="myorder_receive">
                <div class="myorder_receive_top">
                    <div class="myorder_receive_top1">
                        <span>待收货</span>
                    </div>
                    <div class="myorder_receive_top2">
                        <table width="780" align="center">
                            <tr>
                                <td width="80"><span>订单号：</span></td>
                                <td>123456789009876543</td>
                                <td>在线支付</td>
                                <td></td>
                                <td width="400"></td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div class="myorder_receive_bottom">
                    <div class="myorder_receive_bottom_left">
                        <table width="440" valign="center" align="left">
                            <tr>
                                <td rowspan="2"><img  style="width: 300px" src="../img/data.png" alt=""/></td>
                            </tr>
                            <tr>
                                <td><span>dsifsuonfal</span><br>
                                    <span>osiaojaof</span>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                    </div>
                    <div class="myorder_receive_bottom_right">
                        <div class="myorder_receive_bottom_right1">
                            <span>确认收货</span>
                        </div>
                        <div class="myorder_receive_bottom_right2">
                            <a href="#"> <span>监督催单</span></a>
                        </div>
                    </div>
                </div>
            </div>


            <div id="c3">

        </div>

        </div>

    </div>


</div>

</body>
</html>