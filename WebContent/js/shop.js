$(document).ready(function(){
    $("#input_search").focus(function () {
        $("#input_search, #btn_search").css("border-color", "#f32196");
    });
    $("#input_search").blur(function() {
        $("#input_search, #btn_search").css("border-color","#e0e0e0");
    });

    var shop_lunbo = new Swiper('.lunbo_container', {
        autoplay: true,
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            clickableClass : 'my-pagination-clickable'
        }
    });

    var shop_groom = new Swiper('.groom_cut', {
        slidesPerView: 'auto',
        loop: true,
        autoplay: true,
        navigation: {
            nextEl: '.groom-next',
            prevEl: '.groom-prev'
        },
    });
    
    // 显示商品图片的轮播效果
    var path = new Array();
    var array = document.getElementsByClassName("swiper-slide");
    for(var i = 0; i < array.length; i ++) {
        var img = array[i].getElementsByTagName("img");
        path[i] = img[0].getAttribute("src");
    }
    
    var shop_goods_details = new Swiper('.goods_img', {
        loop: true,
        navigation: {
            nextEl: '.goods_img_next',
            prevEl: '.goods_img_prev'
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            bulletClass: 'small_img',
            bulletActiveClass: 'small_img_active',
            renderBullet: function (index, className) {
                return '<li class="' + className + '">' + '<img src="' + path[index] + '" alt="" >' + '</li>';
            }
        }
    });
    
    // 商品数量减少
    $("#minusNum").click(function () {
        var num = $("#showNum").val();
        if (num > 1) {
            $("#showNum").val(num - 1);
        }
    });
    // 商品数量增加
    $("#addNum").click(function () {
        var num = $("#showNum").val();
        $("#showNum").val(parseInt(num) + 1);
    });
    
    var basePath = $('#basePath').val();

    // 对收藏事件进行处理
    $("#addCollect").click(function () {
    	// 得到要收藏的商品的gid
        var gid = $("#gid").val();
        alert(basePath);
        $.ajax({
            url: basePath + "/CollectGoodsServlet",
            dataType:"html",
            data:{
                "gid": gid
            },
            success: function (data,textStatus,jqXHR) {

                if (data == "NotLogin") {
                    alert("没有登录，请登录后进行收藏！");
                }
                if (data == "Success") {
                    alert("收藏成功");
                    //window.location.reload();

                    $("#addCollect").css("color", "#F32184");
                }
                if (data == "SuccessUnCollect") {
                    alert("取消收藏成功");
                    $("#addCollect").css("color", "#ffffff");
                }
                if (data == "Failure") {
                    alert("收藏失败，请稍后重试！");
                }
            }
        });
    });
    
    // 对添加商品到购物车的事件进行处理
    $("#addShoppingCart").click(function () {
    	// 异步向服务发送数据，返回添加结果，并对页面进行更改
    	var gid = $("#gid").val();
    	// 添加到session中
    	$.ajax({
            url: basePath + "/AddShoppingCartServlet",
            dataType:"html",
            data:{
                "gid": gid
            },
            success: function (data,textStatus,jqXHR) {
            	if(data == "true") {
            		changeShoppingCartCount();
            		alert("加入购物车成功");
            	} else {
            		alert("加入失败！请重试。。。");
            	}
            }
        });
    	
    	console.log("添加购物车成功！");
    	
    	
    	
    });
    
    function changeShoppingCartCount() {
    	// 修改网页中的数据
    	$.ajax({
    		url:"/GetShoppingCartCount",
            dataType:"html",
            success: function (data,textStatus,jqXHR) {
            	console.log('data' + data);
            	console.log($('#shoppingCartCount').html());
            	$('#shoppingCartCount').html(data);
            }
    	});
    }
    

});

