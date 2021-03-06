<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>

<div style="width: 100%;background-color: #dddddd;padding-top: 30px">

    <div class="container" >
        <div class="row panel" style="background-color: white;padding: 30px;">
            <div>
                <span style="font-size: 20px">收货地址</span>
                <div class="btn btn-danger" style="margin-left: 50px">
                    新增收货地址
                </div>
            </div>
            <!-- 所有地址 -->
            <div id="addresses" style="margin-top: 20px">
                <!-- 由JS填充 -->
            </div>
        </div>
        <div class="row panel" style="font-size: 18px; background-color: white;margin-top: 30px;padding: 30px">
            <div>支付方式：在线支付</div>
            <hr style="width: 100%;margin: 10px 0;">
            <div>配送方式：快递</div>
        </div>
        <!-- 所有商品 -->
        <div class="row panel" style="background-color: white;margin-top: 30px;padding: 30px">
            <table id="goodsList" class="col-md-12 table table-hover" style="font-size: 18px">
                <tr>
                    <th>名称</th>
                    <th>单价 × 数量</th>
                    <th>小计</th>
                </tr>
            </table>
        </div>

        <div class="row panel" style="height: 114px;padding: 30px;">
            <div class="row" style="margin: 0;">

                <div class="col-md-9 text-right" style="font-size: 16px;line-height: 50px">
                    <span style="margin-right: 50px">共计 <b id="goodsNumber">1</b> 件商品，合计 <b id="goodsTotal" style="color: red;font-size: 20px">￥499.00</b></span>
                </div>
                <div class="col-md-3">
                    <a  id="return_shopping_cart" class="btn btn-danger pull-left" style="width: 120px;height: 52px;border-radius: 0; line-height: 40px;font-size: 20px;background-color: gainsboro;border: none;color: #000;" >返回购物车</a>
                    <a id="make_record" class="btn btn-danger pull-right" style="width: 120px;height: 52px;border-radius: 0; line-height: 40px;font-size: 20px;background-color: #f46868;border: none;" >生成订单</a>
                </div>

            </div>

        </div>
    </div>
</div>


    <script>
        $(document).ready(function () {

            $(".address").click(function () {
                $(".address").css("border", "2px solid red");
                alert("click");
                $(".edit").css("display", "block");
            });

            // 所有数据
            var info = null;
            // 地址显示数据
            var addresses = {};

            // 以一个异步开始
            $.getJSON("/OnlineShopping/RecordDataServlet", function (data) {
                // 得到数据
                info = data;
                // console.log(data.addressList[0].uaid);
                // 判断选择地址的数组
                for (var i = 0; i < data.addressList.length; i ++) {
                    addresses[data.addressList[i].uaid] = false;
                }
                // console.log(addresses);
                // 数据填充到标签中
                fillData();
                // 添加监听器
                addListener();

            })

            function fillData() {
                // 填充地址数据
                for (var i = 0; i < info.addressList.length; i ++) {
                    // 创建地址元素
                    var addressComponent = createAddressComponent(info.addressList[i]);
                    $("#addresses").append(addressComponent);
                }
                // 填充商品数据
                var tbody = $("<tbody></tbody>");
                $("#goodsList").append(tbody);
                for (var i = 0; i < info.goodsList.length; i ++) {
                    console.log(info.goodsList[i]);
                    var goodsComponent = createGoodsComponent(info.goodsList[i]);
                    tbody.append(goodsComponent);
                }

                // 填充总数量和总价
                var number = 0;
                var total = 0;

                for(var i = 0; i < info.goodsList.length; i ++) {
                    number += info.goodsList[i].number;
                    total += (info.goodsList[i].number * info.goodsList[i].goods.price * info.goodsList[i].goods.discount);
                }

                $("#goodsNumber").html(number);
                $("#goodsTotal").html("￥" + total.toFixed(2));
            }

            function addListener() {

                // 返回购物车按钮添加链接
                $("#return_shopping_cart").click(function () {
                    window.location.href = "shopping_cart.jsp";
                });

                $("#make_record").click(function () {
                    var uaid = -1;
                    for(var key in addresses) {
                        if(addresses[key]) {
                            uaid = key;
                            break;
                        }
                    }

                    if (uaid != -1) {
                        // 得到一个地址，发送服务器
                        $.getJSON("/OnlineShopping/RecordMakeServlet", {"uaid": uaid}, function (data) {
                            // 生成订单成功，跳转到订单中心页
                            if (data.status == true) {
                                alert("生成订单成功");
                                window.location.href = "index.jsp";
                            }else {
                                alert(data.status);
                            }
                        })
                    } else {
                        alert("请选择一个收货地址！");
                    }


                });

                // 循环为每个地址添加监听器
                for (var i = 0; i < info.addressList.length; i ++) {
                    // 为每个地址被选择时添加监听器
                    $("#address-" + info.addressList[i].uaid).click(function (ev) {
                        // 得到触发点击事件的对象
                        var id = ev.target.parentNode.id;   // goods-123
                        // console.log(id);
                        // 得到应该更改的地址的uaid
                        var idString = id.substr(id.indexOf('-') + 1);
                        // console.log(idString);
                        for (var key in addresses)  {
                            addresses[key] = key == parseInt(idString);
                        }
                        // console.log(addresses);
                        // 重新显示地址的状态
                        for (var key in addresses)  {
                            if (addresses[key]) {
                                $("#address-" + key).css("border-color", "red");
                                $("#edit-" + key).css("display", "block");
                            } else {
                                $("#address-" + key).css("border-color", "#dddddd");
                                $("#edit-" + key).css("display", "none");
                            }
                        }

                    });
                    // 为每个地址的可编辑按钮添加监听器
                    $("#edit-" + info.addressList[i].uaid).click(function (ev) {

                        var id = ev.target.parentNode.id;

                        var idString = id.substr(id.indexOf('-') + 1);

                        console.log(idString);
                        // TODO 显示当前地址的编辑页面。
                        // 得到地址数据
                        layer.open({
                            type: 2,
                            area: ['700px', '450px'],
                            fixed: false, //不固定
                            maxmin: true,
                            content: 'adress_show.html'
                        });
                    });

                }

            }

            function createAddressComponent(address) {
                return '<div id="address-' + address.uaid + '" class="pull-left address" style="padding: 10px;font-size: 18px; line-height: 30px; width: 272px;height: 150px;margin: 20px;">\n' +
                    '                    <button id="edit-' + address.uaid + '" class="pull-right" style="display: none; border: none;background-color: transparent"><i class="icon wb-edit"></i></button>\n' +
                    '                    <div>姓名：' + address.name + '</div>\n' +
                    '                    <div>电话：' + address.phone + '</div>\n' +
                    '                    <div>地区：' + address.province + ' ' + address.city + ' ' + address.block + '</div>\n' +
                    '                    <div>详细地址：' + address.details + '</div>\n' +
                    '                </div>';
            }

            function createGoodsComponent(goods) {
                return '<tr>\n' +
                    '                    <td>\n' +
                    '                        <img class="pull-left" src="./img/400_400/' + goods.goods.picpath.split(',')[0] + '" alt="" style="width: 60px;height: 60px;">\n' +
                    '                        <div class="pull-left" style="margin-left: 20px">\n' +
                    '                            <div><a href="goods_details.jsp?gid=' + goods.goods.gid + '">' + goods.goods.name + '</a></div>\n' +
                    '                            <div style="margin-top: 5px ">' + goods.goods.details + '</div>\n' +
                    '                        </div>\n' +
                    '                    </td>\n' +
                    '                    <td>￥ ' + (goods.goods.price * goods.goods.discount).toFixed(2) + ' 元 × ' + goods.number + '</td>\n' +
                    '                    <td>￥ ' + (goods.goods.price * goods.goods.discount * goods.number).toFixed(2) + ' 元</td>\n' +
                    '                </tr>';
            }

        });
    </script>

<%@include file="footer.jsp"%>