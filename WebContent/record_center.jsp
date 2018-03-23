<%@ page import="java.util.List" %>
<%@ page import="com.onlineshopping.entity.Record" %>
<%@ page import="com.onlineshopping.dao.RecordDao" %>
<%@ page import="com.onlineshopping.entity.RecordDetails" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.onlineshopping.entity.Goods" %>
<%@ page import="com.onlineshopping.dao.RecordDetailsDao" %>
<%@ page import="com.onlineshopping.dao.GoodsDao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<%
    List<Record> recordList = new RecordDao().queryByUserid(user.getUserid());
    List<List<RecordDetails>> recordDetailsAllList = new ArrayList<>();
    List<List<Goods>> goodsAllList = new ArrayList<>();
    for (Record record : recordList) {
        System.out.println(record.toString());
        List<RecordDetails> recordDetailsList = new RecordDetailsDao().queryByRid(record.getRid());
        List<Goods> goodsList = new ArrayList<>();
        for (RecordDetails recordDetails : recordDetailsList) {
            Goods goods = new GoodsDao().getGoodsByGid(recordDetails.getGid());
            goodsList.add(goods);
        }
        goodsAllList.add(goodsList);
        recordDetailsAllList.add(recordDetailsList);
    }
%>

<div style="background-color: #dddddd;padding-top: 30px;">
    <div class="container" >
        <div class="row">

            <%@include file="user_nav.jsp"%>

            <div class="col-md-9">

                <div class="panel panel-default" style="background-color: white;padding: 30px">
                    <%
                        for (int i = 0; i < recordList.size(); i ++) {
                            Record record = recordList.get(i);
                    %>
                    <div style="border: 1px solid red;padding: 30px;margin-bottom: 30px">
                        <div style="font-size: 24px;height: 40px;">
                            <span  style="color: red;" class="pull-left">待支付</span>
                            <span  style="font-size: 20px" class="pull-right">订单金额：<b style="font-size: 24px;color: red;">￥<%= String.format("%.2f", record.getTotal()) %>元</b></span>
                        </div>
                        <div style="margin-bottom: 20px">
                            <%
                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                            %>
                            <span>订单号：<%= record.getRecnum()%>&nbsp;&nbsp;&nbsp;&nbsp;<%=df.format(new Date(record.getTime().getTime())) %>&nbsp;&nbsp;&nbsp;&nbsp;在线支付</span>
                        </div>
                        <!-- 商品 -->
                        <div style="padding-top: 20px;border-top: 1px solid red">
                            <%-- TODO 支付更改订单的status状态 --%>
                            <a href="#" class="btn btn-danger pull-right">立即支付</a>
                            <a href="record_details.jsp?rid=<%=record.getRid() %>" class="btn btn-default pull-right" style="margin-right: 30px">查看详情</a>
                                <%
                                    List<RecordDetails> recordDetailses = recordDetailsAllList.get(i);
                                    List<Goods> goodses = goodsAllList.get(i);
                                    for(int j = 0; j < recordDetailses.size(); j ++) {
                                        RecordDetails recordDetails = recordDetailses.get(j);
                                        Goods goods = goodses.get(j);
                                %>
                            <div style="height: 70px;">
                                <img class="pull-left" src="./img/400_400/<%=goods.getPicpath().split(",")[0] %>" alt="" style="width: 60px;height: 60px;">
                                <div class="pull-left" style="margin-left: 20px;font-size: 16px">
                                    <span style="display: block;margin-top: 5px"><a
                                            href="goods_details.jsp?gid=<%=goods.getGid() %>"><%=goods.getName() %></a> <%=goods.getDetails() %></span>
                                    <span style="display: block;margin-top: 5px">￥<%=recordDetails.getBuyprice() %>元 x <%=recordDetails.getNumbers() %></span>
                                </div>
                            </div>
                                <%
                                    }
                                %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

            </div>
        </div>

    </div>
</div>

<%@include file="footer.jsp"%>
