<%@ page import="com.onlineshopping.dao.RecordDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlineshopping.dao.RecordDetailsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.onlineshopping.dao.GoodsDao" %>
<%@ page import="com.onlineshopping.entity.*" %>
<%@ page import="com.onlineshopping.dao.UserAddressDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<%
    int rid = Integer.parseInt(request.getParameter("rid"));

    Record record = new RecordDao().queryByRid(rid);
    UserAddress address = new UserAddressDao().getAddress(record.getUaid());
    List<RecordDetails> recordDetailsList = new RecordDetailsDao().queryByRid(rid);
    List<Goods> goodsList = new ArrayList<>();
    System.out.println(record.toString());
    for (RecordDetails recordDetails : recordDetailsList) {
        Goods goods = new GoodsDao().getGoodsByGid(recordDetails.getGid());
        goodsList.add(goods);
    }

%>

<div style="background-color: #dddddd;padding-top: 30px;">
    <div class="container" >
        <div class="row">

            <%@include file="user_nav.jsp"%>

            <div class="col-md-9">

                <div class="panel panel-default">
                    <div class="panel-body">

                        <div class="font-sizeAndheight">
                            <i class="wb-payment pull-left" style="margin-right: 20px;font-size: 30px;color: orange"></i>
                            <div class="pull-left" style="margin-top: 5px;">
                                <span><%=record.getStatus() == 1 ? "待支付" : record.getStatus() == 2 ? "已支付" : "已完成" %></span>
                            </div>
                            <button class="btn btn-danger pull-right" style="margin-left: 20px">立即付款</button>
                            <button class="btn btn-default pull-right">取消订单</button>
                        </div>
                    </div>
                </div>

                <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-body">--%>
                        <%--<div class="row">--%>
                            <%--<div class="col-md-3">--%>
                                <%--&lt;%&ndash;<div class="progress" style="position: absolute;width: 100px;left: 92px;top: 12px;height: 5px;box-shadow: none;color: black;">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;box-shadow: none" >&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<span class="sr-only">60% Complete</span>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--<div class="center-block" style="z-index:10;width: 48px; height: 48px;border-radius: 24px; border: 2px solid #62a8ea;margin-top: 10px">--%>
                                    <%--<i class="wb-clipboard" style="font-size: 20px;margin-top:8px;width: 44px;text-align: center;color: #62a8ea;"></i>--%>
                                <%--</div>--%>
                                <%--<div style="margin-top: 5px;font-size: 16px" >--%>
                                    <%--<span class="text-center center-block">下单</span>--%>
                                    <%--<span class="text-center center-block" style="color: #a3afb7;margin-top: 5px">2017.09.11 12:23:23</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-3">--%>
                                <%--<div class="center-block" style="width: 48px; height: 48px;border-radius: 24px; border: 2px solid #62a8ea;margin-top: 10px">--%>
                                    <%--<i class="wb-clipboard" style="font-size: 20px;margin-top:8px;width: 44px;text-align: center;color: #62a8ea;"></i>--%>
                                <%--</div>--%>
                                <%--<div style="margin-top: 5px;font-size: 16px" >--%>
                                    <%--<span class="text-center center-block">下单</span>--%>
                                    <%--<span class="text-center center-block" style="color: #a3afb7;margin-top: 5px">2017.09.11 12:23:23</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-3">--%>
                                <%--<div class="center-block" style="width: 48px; height: 48px;border-radius: 24px; border: 2px solid #62a8ea;margin-top: 10px">--%>
                                    <%--<i class="wb-clipboard" style="font-size: 20px;margin-top:8px;width: 44px;text-align: center;color: #62a8ea;"></i>--%>
                                <%--</div>--%>
                                <%--<div style="margin-top: 5px;font-size: 16px" >--%>
                                    <%--<span class="text-center center-block">下单</span>--%>
                                    <%--<span class="text-center center-block" style="color: #a3afb7;margin-top: 5px">2017.09.11 12:23:23</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-3">--%>
                                <%--<div class="center-block" style="width: 48px; height: 48px;border-radius: 24px; border: 2px solid #62a8ea;margin-top: 10px">--%>
                                    <%--<i class="wb-clipboard" style="font-size: 20px;margin-top:8px;width: 44px;text-align: center;color: #62a8ea;"></i>--%>
                                <%--</div>--%>
                                <%--<div style="margin-top: 5px;font-size: 16px" >--%>
                                    <%--<span class="text-center center-block">下单</span>--%>
                                    <%--<span class="text-center center-block" style="color: #a3afb7;margin-top: 5px">2017.09.11 12:23:23</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                <%--</div>--%>

                <!-- 显示订单购买的商品的详情 -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>商品名称</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>运费</th>
                                <th>小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (int i= 0; i < recordDetailsList.size(); i ++) {
                                    RecordDetails recordDetails = recordDetailsList.get(i);
                                    Goods goods = goodsList.get(i);
                            %>
                            <tr>
                                <td class="col-md-4">
                                    <img class="pull-left" src="./img/400_400/<%=goods.getPicpath().split(",")[0] %>" alt="" style="width: 60px;height: 60px;">
                                    <div class="pull-left"
                                         style="margin-left: 10px;width: 170px; word-wrap:break-word;font-size: 16px;"><%=goods.getName() %>
                                    </div>
                                </td>
                                <td><%=recordDetails.getBuyprice() %></td>
                                <td><%=recordDetails.getNumbers() %></td>
                                <td>0</td>
                                <td><%=String.format("%.2f", recordDetails.getBuyprice() * recordDetails.getNumbers()) %></td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 显示订单详情 -->
                <div class="panel panel-default">
                    <div class="panel-body ">
                        <div class="row info">
                            <div class="col-md-2 text-right">订单号：</div>
                            <div class="col-md-10"><%=record.getRecnum() %></div>
                        </div>
                        <div class="row info">
                            <div class="col-md-2 text-right">支付方式：</div>
                            <div class="col-md-10">在线支付</div>
                        </div>
                        <div class="row">
                            <hr style="width: 100%;margin-top: 10px;margin-bottom: 10px">
                        </div>
                        <div class="row info">
                            <div class="col-md-2 text-right">配送方式：</div>
                            <div class="col-md-10">快递配送</div>
                        </div>
                        <div class="row info">
                            <div class="col-md-2 text-right">收货地址：</div>
                            <div class="col-md-10"><%=address.getProvince() + " " + address.getCity() + " " + address.getBlock() + " " + address.getDetails()%></div>
                        </div>
                        <div class="row">
                            <hr style="width: 100%;margin-top: 10px;margin-bottom: 10px">
                        </div>
                        <div class="row info">
                            <div class="col-md-2 text-right">买家留言：</div>
                            <div class="col-md-10"></div>
                        </div>
                    </div>
                </div>
                <!-- 显示总价详情 -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-striped">
                            <tr>
                                <th class="text-center">订单金额</th>
                                <th class="text-center"></th>
                                <th class="text-center">运费</th>
                                <th class="text-center"></th>
                                <th class="text-center">优惠</th>
                                <th class="text-center"></th>
                                <th class="text-center">涨价V减免</th>
                                <th class="text-center"></th>
                                <th class="text-center">实付金额</th>
                            </tr>
                            <tr>
                                <td class="text-center">￥<%=record.getTotal() %>元</td>
                                <td class="text-center">+</td>
                                <td class="text-center">￥0元</td>
                                <td class="text-center">+</td>
                                <td class="text-center">￥0元</td>
                                <td class="text-center">+</td>
                                <td class="text-center">￥0元</td>
                                <td class="text-center">+</td>
                                <td class="text-center">￥<%=record.getTotal() %>元</td>
                            </tr>
                        </table>
                    </div>
                </div>


            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>
