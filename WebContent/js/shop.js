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
    
    $("#minusNum").click(function () {
        var num = $("#showNum").val();
        if (num > 1) {
            $("#showNum").val(num - 1);
        }
    });

    $("#addNum").click(function () {
        var num = $("#showNum").val();
        $("#showNum").val(parseInt(num) + 1);
    });

});

