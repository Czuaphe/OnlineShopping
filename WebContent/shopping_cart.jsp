<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>


<div style="background-color: #dddddd;width: 100%;padding-top: 30px;padding-bottom: 30px;" >
    <!-- 显示面板 -->
    <div class="container panel" style="margin-top: 30px">
        <div class="row" style="padding: 30px;">
            <table id="shopping_cart" class="col-md-12 table table-hover" style="margin-top: 20px;font-size: 16px">

            </table>
        </div>
    </div>
    <!--  结算面板 -->
    <div class="container panel" style="height: 114px;padding: 30px;margin-bottom: 30px">
        <div class="row" style="margin: 0;">
            <div class="col-md-3" style="">
                <input id="goodsAll" class="pull-left" style="margin-top: 17px;margin-left: 30px" type="checkbox" checked=true disabled>
                <div class="pull-left" style="margin-left: 10px; line-height: 52px;font-size: 16px">全选</div>
            </div>
            <div class="col-md-7 text-right" style="font-size: 16px;line-height: 50px">
                <span style="margin-right: 50px">共计 <b id="goodsNumber">0</b> 件商品，合计 <b id="goodsTotal" style="color: red;font-size: 20px">￥0.00</b></span>
            </div>
            <div class="col-md-2">
                <a id="calcAll" class="btn btn-danger pull-right" style="width: 120px;height: 52px;border-radius: 0; line-height: 40px;font-size: 20px;background-color: #f46868;border: none;" disabled>去结算</a>
            </div>

        </div>

    </div>

</div>

<script>
        $(document).ready(function () {

            // 初始化数据
            var data = null;

            // var map = {};

            function initData() {
                // console.log("hello 1");
                $.getJSON('/OnlineShopping/ShoppingCartServlet', function (json) {
                    console.log(json.data);
                    data = json.data;
                    for(var i = 0; i < data.length; i ++) {
                        data[i].visible = true;
                    }
                    // 将数据写入表格中
                    data2table();
                    // TODO 显示结算页（一开始结算页隐藏）

                    // 为每一行数据添加
                    addListener();
                    calcTotal();
                })

                // TODO 可以添加等待动画


            }

            function data2table() {
                var length = data.length;
                // 隐藏动画

                // 添加元素
                var tbody = $('<tbody></tbody>');
                $("#shopping_cart").append(tbody);
                tbody.append(createTableHead());
                for(var i = 0; i < length; i ++) {
                    var goods = data[i].goods;
                    var number = data[i].number;
                    var visible = data[i].visible;
                    var tr = createTableElement(goods, number, visible);
                    tbody.append(tr);
                }

            }

            function createTableHead() {
                var element = '<tr class="height-high">\n' +
                    '                    <th class="col-md-1 text-center" >\n' +
                    '                        <input type="checkbox" style="display: none;"/>\n' +
                    '                    </th>\n' +
                    '                    <th class="col-md-3 text-left" style="line-height: 34px">\n' +
                    '                        <span>\n' +
                    '                            商品\n' +
                    '                        </span>\n' +
                    '                    </th>\n' +
                    '                    <th class="col-md-2 text-center" style="line-height: 34px">\n' +
                    '                        单价\n' +
                    '                    </th>\n' +
                    '                    <th class="col-md-2 text-center" style="line-height: 34px">\n' +
                    '                        数量\n' +
                    '                    </th>\n' +
                    '                    <th class="col-md-2 text-center" style="line-height: 34px">\n' +
                    '                        小计\n' +
                    '                    </th>\n' +
                    '                    <th class="col-md-2 text-center" style="line-height: 34px">\n' +
                    '                        操作\n' +
                    '                    </th>\n' +
                    '                </tr>';
                return element;
            }

            function createTableElement(goods, number, visible) {
                var total = goods.price * goods.discount * number;
                var picpath = goods.picpath.split(',');
                // console.log("picpath size:" + picpath.length);
                // console.log("pic[0]:" + picpath[0]);
                // console.log("type of price:" + typeof goods.price);
                // console.log("type of number:" + typeof number);
                // console.log("type of price * number:" + typeof (goods.price * number));
                var element = '<tr class="height-common">\n' +
                    '                    <td class="text-center" style="line-height: 64px;">\n' +
                    '                        <input id="goods-' + goods.gid + '" type="checkbox" checked="' + visible + '">\n' +
                    '                    </td>\n' +
                    '                    <td class="text-center line-common">\n' +
                    '                        <img class="pull-left" src="/OnlineShopping/img/400_400/' + picpath[0] + '" alt="" style="width: 60px;height: 60px;">\n' +
                    '                        <div class="pull-left" style="margin-left: 10px">\n' +
                    '                            <div class="text-left" style="line-height: 32px;">\n' +
                    '                                <a class="web-link" href="#" style="display: block; width: 200px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + goods.name + '</a>\n' +
                    '                            </div>\n' +
                    '                            <div class="text-left"><span class="">' + goods.details + '</span></div>\n' +
                    '                        </div>\n' +
                    '                    </td>\n' +
                    '                    <td class="text-center" style="line-height: 64px;">\n' +
                    '                        ' + (goods.price * goods.discount).toFixed(2) + '\n' +
                    '                    </td>\n' +
                    '                    <td class="text-center" style="">\n' +
                    '                        <div style="margin-top: 12px;margin-left: 21px">\n' +
                    '                            <button id="minusNum-' + goods.gid + '" style="width: 45px;height: 40px;border: none;float: left;">-</button>\n' +
                    '                            <input id="showNum-' + goods.gid + '" type="text" class="form-control" value="' + number + '" style="width: 60px;height: 40px;text-align: center;border-radius:0;float: left;">\n' +
                    '                            <button id="addNum-' + goods.gid + '" style="width: 45px;height: 40px;border: none;float: left;">+</button>\n' +
                    '                        </div>\n' +
                    '                    </td>\n' +
                    '                    <td id="subTotal-' + goods.gid + '" class="text-center" style="line-height: 64px;color: red;">\n' +
                    '                        ￥' + total.toFixed(2) + '元\n' +
                    '                    </td>\n' +
                    '                    <td class="text-center" style="line-height: 64px;font-size: 20px" >\n' +
                    '                        <div class="icon-link">\n' +
                    '                            <button id="delete-' + goods.gid + '" class="fa fa-trash" style="border:none;background-color: transparent;"></button>\n' +
                    '                        </div>\n' +
                    '                    </td>\n' +
                    '                </tr>';
                return element;
            }
            // 为所有的按钮添加监听器
            function addListener() {

                // 全选监听器
                $("#goodsAll").removeAttr('disabled');
                $("#goodsAll").click(function () {
                    var flag = false;
                    console.log($("#goodsAll").prop("checked"));

                    if ($("#goodsAll").prop("checked") == true) {
                        flag = true;
                    }
                    for(var i = 0; i < data.length; i++) {
                        data[i].visible = flag;
                        if (flag) {
                            $("#goods-" + data[i].goods.gid).prop("checked", true);
                        } else {
                            $("#goods-" + data[i].goods.gid).prop("checked", false);
                        }
                    }
                    calcTotal();
                });
                // 结算监听器
                $("#calcAll").removeAttr("disabled");
                $("#calcAll").click(function () {
                    // 将数据异步传给服务器
                    var info = [];

                    for(var i = 0; i < data.length; i ++) {
                        if (data[i].visible) {
                            var map = {};
                            map['gid'] = data[i].goods.gid;
                            map['number'] = data[i].number;
                            info[i] = map;
                        }
                    }

                    console.log(info);
                    // 通过异步将更改的数据传到服务器上
                    $.getJSON('/OnlineShopping/CountShoppingCartServlet',
                        { 'info': info}, function (callback) {
                            console.log(callback.status);
                            if (callback.status == true) {
                                // 跳转到订单生成页中
                                window.location.href = 'make_record.jsp';
                            } else {
                                alert(callback.status);
                            }
                        });

                    // $.ajax({
                    //     url: 'http://localhost:8080/OnlineShopping/CountShoppingCartServlet',
                    //     data: {
                    //         'info': info
                    //     },
                    //     dataType: 'jsonp',
                    //     success: function (callback, status) {
                    //         console.log(callback);
                    //     }
                    // })

                });

                for(var i = 0; i < data.length; i ++) {
                    var gid = data[i].goods.gid;
                    console.log(gid);
                    // 给每一个商品的可见性添加监听器
                    $('#goods-' + gid).click(function (ev) {
                        // 得到触发点击事件的对象
                        var id = ev.target.id;   // goods-123
                        // 得到应该更改的商品的gid
                        var idString = id.substr(id.indexOf('-') + 1);
                        console.log(idString);
                        toggleGoodsChecked(idString);
                        console.log(data);
                        // 计算总计
                        calcTotal();
                    });
                    // 给每一个商品的数量添加监听器
                    $("#addNum-" + gid).click(function (ev) {
                        // 得到触发点击事件的对象
                        var id = ev.target.id;   // addNum-123
                        // 得到应该更改的商品的gid
                        var idString = id.substr(id.indexOf('-') + 1); // String 类型
                        console.log(idString);
                        // 将对应的商品数量加1
                        addGoodsNumber(idString);
                        // 计算小计
                        changeSubTotal(idString);
                        // 计算总计
                        calcTotal();
                    });
                    $("#minusNum-" + gid).click(function (ev) {
                        // 得到触发点击事件的对象
                        var id = ev.target.id;   // minusNum-123
                        // 得到应该更改的商品的gid
                        var idString = id.substr(id.indexOf('-') + 1); // String 类型
                        console.log(idString);
                        // 将对应的商品数量加1
                        minusGoodsNumber(idString);
                        // 计算小计
                        changeSubTotal(idString);
                        // 计算总计
                        calcTotal();
                    });
                    // 删除监听器
                    $("#delete-" + gid).click(function (ev) {
                        // 得到触发点击事件的对象
                        var id = ev.target.id;   // delete-123
                        // 得到应该更改的商品的gid
                        var idString = id.substr(id.indexOf('-') + 1); // String 类型
                        console.log(idString);
                        // 弹窗进行二次确定
                        if(confirm("确定删除此商品？")) {
                            deleteGoods(idString);
                            alert("删除成功！");
                        }
                        console.log(data);
                        calcTotal();
                    });

                }
            }
            // 切换商品的可见性
            function toggleGoodsChecked(id) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].goods.gid);
                    console.log("id type:" + typeof id);
                    console.log("data[i].goods.gid type:" + typeof data[i].goods.gid);
                    var idInt = parseInt(id);
                    console.log("idInt type:" + idInt);
                    if(data[i].goods.gid == idInt) {
                        data[i].visible = !data[i].visible;
                    }
                }
                // TODO 判断是不是全选
                var flag = true;
                for (var i = 0; i < data.length; i++) {
                    if (data[i].visible == false) {
                        flag = false;
                        break;
                    }
                }
                console.log("goodsAll checked:" + $("#goodsAll").prop('checked'))
                if (flag) {
                    $("#goodsAll").prop("checked", true);
                } else {
                    $("#goodsAll").prop("checked", false);
                }


            }

            // 将商品数量加一
            function addGoodsNumber(id) {
                for (var i = 0; i < data.length; i ++) {
                    if(data[i].goods.gid == parseInt(id)) {
                        data[i].number += 1;
                        $("#showNum-" + id).val(data[i].number);
                        break;
                    }
                }
            }

            // function test(gid) {
            //     map[gid].number += 1;
            //     $('#showNum' + gid).val(map[gid].number);
            // }

            function minusGoodsNumber(id) {
                for (var i = 0; i < data.length; i ++) {
                    if(data[i].goods.gid == parseInt(id)) {
                        if (data[i].number > 1) {
                            // 更改数据
                            data[i].number -= 1;
                            // 更改页面
                            $("#showNum-" + id).val(data[i].number);
                            break;
                        }

                    }
                }
            }

            function changeSubTotal(id) {
                for (var i = 0; i < data.length; i ++) {
                    if(data[i].goods.gid == parseInt(id)) {
                        $("#subTotal-" + id).html('￥' + (data[i].goods.price * data[i].goods.discount * data[i].number).toFixed(2) + '元');
                    }
                }
            }
            // 删除一个商品，异步通知服务器
            function deleteGoods(id) {
                for (var i = 0; i < data.length; i ++) {
                    if(data[i].goods.gid == parseInt(id)) {
                        data.splice(i, 1);
                        $('#delete-' + id).parent().parent().parent().remove();
                        // 异步通知服务器，即使刷新也不能恢复被删除商品
                        break;
                    }
                }
                // 数据为空，删除表头，禁用结算页
                if (data.length == 0) {
                    $("#shopping_cart").remove();
                }

            }
            // 得到商品的数量和总价
            function calcTotal() {
                var number = 0;
                var total = 0;

                for(var i = 0; i < data.length; i ++) {
                    if (data[i].visible) {
                        number += data[i].number;
                        total += (data[i].number * data[i].goods.price * data[i].goods.discount);
                    }
                }

                $("#goodsNumber").html(number);
                $("#goodsTotal").html("￥" + total.toFixed(2));
            }

            initData();
        });
    </script>

<%@include file="footer.jsp"%>