<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="<%=path%>/js/base/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function provinces(){
        	
        }
    
        $(function(){
        	/* $.ajax({
        	    url:"/OnlineShopping/DivisionServlet",
        	    
        	    type:"POST",
        	    dataType:"json",
        	    success:function(result){
        	    	alert("dd");
        	        var op=$("<option value='"+result[0]+"'>"+result[1]+"</option>");
        	    	$("#add").append(op); 
        	    }
        	}); */
        	$.getJSON(
        	    "/OnlineShopping/DivisionServlet",	
        	    {"flag":"1"},
        	    function(result){
        	    	for(var i=0;i<result.length;i+=2){
        	    		var op=$("<option value='"+result[i]+"'>"+result[i+1]+"</option>");
            	    	$("#add").append(op);
        	    	}
        	    }
        	);
            $("#a2").click(function(){
                $("#addform").css("display","none");
            });
            $("#b").click(function(){
                $("#addform").css("display","block");
            });
            $("#username").bind(
                'input propertychange',function(){
                var name=$("#username").val();
                        var phone=$("#phone").val();
                        var address=$("#detail").val();
                        var add=$("#add").val();
                        if(name!=""&&phone!=""&&address!=""&&add!=""){
                            $("#a1sub").css("display","none");
                        }
                if(""==name){
                    $("#t1").html("此项不能为空");
                }else{
                    $("#t1").html("");
                }
            });

            $("#phone").bind(
                'input propertychange',function() {
                        var phone = $(this).val();
                        var name=$("#username").val();
                        var address=$("#detail").val();
                        var add=$("#add").val();
                        if(name!=""&&phone!=""&&address!=""&&add!=""){
                            $("#a1sub").css("display","none");
                        }
                        if ("" == phone) {
                            $("#t2").html("此项不能为空");
                        } else {
                            $("#t2").html("");
                        }
             });

            $("#detail").bind(
                    'input propertychange',function() {
                        var add = $(this).val();
                        var name=$("#username").val();
                        var phone=$("#phone").val();
                        var address=$("#add").val();
                        if(name!=""&&phone!=""&&address!=""&&add!=""){
                            $("#a1sub").css("display","none");
                        }
                        if ("" == add) {
                            $("#t4").html("此项不能为空");
                        } else {
                            $("#t4").html("");
                        }
                    });
            /* 省级选择框发生改变时 */
            $("#add").bind(
                    'input propertychange',function() {
                        var add = $(this).val();
                        var name=$("#username").val();
                        var phone=$("#phone").val();
                        var address=$("#detail").val();
                        if(name!=""&&phone!=""&&address!=""&&add!=""){
                            $("#a1sub").css("display","none");
                        }
                        if ("" == add) {
                            $("#t3").html("此项不能为空");
                            $("#paaa").css("display","none");
                        } else {
                            $("#t3").html("");
                            $("#city").children().remove();
                            $("#county").children().remove();
                            $.getJSON(
                            	    "/OnlineShopping/DivisionServlet",	
                            	    {"flag":"2","pid":add},
                            	    function(result){
                            	    	for(var i=0;i<result[0].length;i+=2){
                            	    		var op=$("<option value='"+result[0][i]+"'>"+result[0][i+1]+"</option>");
                                	    	$("#city").append(op);
                            	    	}
                            	    	for(var i=0;i<result[1].length;i+=2){
                            	    		var op=$("<option value='"+result[1][i]+"'>"+result[1][i+1]+"</option>");
                                	    	$("#county").append(op);
                            	    	}
                            	    }
                            	);
                            $("#paaa").css("display","block");
                        }
                    });
            
            /* 市级选择框发生改变时 */
            $("#city").bind(
                    'input propertychange',function() {
                    	var cid=$(this).val();
                    	var pid=$("#add").val();
                        $("#county").children().remove();
                        $.getJSON(
                            	    "/OnlineShopping/DivisionServlet",	
                            	    {"flag":"3","pid":pid,"cid":cid},
                            	    function(result){
                            	    	for(var i=0;i<result.length;i+=2){
                            	    		var op=$("<option value='"+result[i]+"'>"+result[i+1]+"</option>");
                                	    	$("#county").append(op);
                            	    	}
                            	    }
                            	);
                    });
            
            
            $("#a1").click(function(){
                var flag=true;
                var name=$("#username").val();
                var phone=$("#phone").val();
                var address=$("#detail").val();
                var add=$("#add").val();
                if(""==name){
                    $("#t1").html("此项不能为空");
                    $("#a1sub").css("display","block");
                    flag=false;
                }
                if(""==phone){
                    $("#t2").html("此项不能为空");
                    $("#a1sub").css("display","block");
                    flag=false;
                }
                if(""==address){
                    $("#t4").html("此项不能为空");
                    $("#a1sub").css("display","block");
                    flag=false;
                }
                if(""==add){
                    $("#t3").html("此项不能为空");
                    $("#a1sub").css("display","block");
                    flag=false;
                }
                if(flag==true){
                    $("#address").submit();
                }
            });
        });
    </script>
    <style type="text/css">
        *{
            margin:0 auto;
            padding:0;
            font-family: "微软雅黑";
        }
        .fa{
            width:100%;
            height:462px;
            background-color: #F2F2F2;
        }
        .add_left{
            width: 265px;
            height:402px;
            margin-left: 91px;
            margin-top:30px;
            background-color: white;
            float: left;
            border-radius: 4px;
            line-height: 45px;

        }
        table{
            padding-top: 13px;
            padding-left:60px;

        }
        table a{
            text-decoration: none;
            color:#76838F;
            font-size: 14px;
        }
        table a:hover{
            color:black;
        }
        #a{
            color:#93A8EB;
        }
        .add_right{
            width:852px;
            height:402px;
            margin-left: 42px;
            margin-top:30px;
            float: left;
            background-color: white;
            border-radius: 4px;
        }
        #b{
            text-decoration: none;
            display: block;
            width:114px;
            height:36px;
            background-color: #46BE8A;
            color:white;
            margin-left: 30px;
            margin-top:31px;
            line-height: 36px;
            text-align: center;
            font-size: 15px;
            cursor: pointer;
            -webkit-transition: background-color 0.5s;
            -moz-transition: background-color 0.5s;
            -o-transition: background-color 0.5s;
            transition: background-color 0.5s;
        }
        #b:hover{
            background-color: #49dca5;
        }
        .address{
            width:210px;
            height:99px;
            border:1px solid #E4EAEC;
            margin-left:30px;
            margin-top:20px;
            line-height: 26px;
            padding:17px;
            position: relative;
        }
        .sel{
            position: absolute;
            width:60px;
            height:32px;
            left:185px;
            top:0;
            display: none;
        }
        .sel a{
            text-decoration: none;
            font-size: 12px;
        }
        .address:hover{
            border-color: #F96868;
        }
        .address:hover .sel{
            display: block;
        }
        #addform{
            width:100%;
            height:100%;
            background-color: rgba(0,0,0,0.3);
            position:absolute;
            left:0;
            top:0;
            display: none;
        }
        .parent{
             width:303px;
             height:450px;
             border-radius: 2px;
             margin-top: 8px;
             background-color: white;
             animation: cartoon 0.3s ease-in;
         }
        @keyframes cartoon {
            from{
                opacity: 0;
                transform: translateY(-98px);
            }
            to{
                opacity: 1;
                transform: translateY(0);
            }
        }
        .parent_top{
            width:303px;
            height:58px;
            background-color: #62A8EA;
            line-height: 58px;
            color:white;
            font-size: larger;
        }
        #pad{
            width:303px;
            height:21px;
            background-color: white;
        }
        #username,#phone{
            width:248px;
            height:36px;
            border-radius: 3px;
            display: block;
            padding-left: 12px;
            border:1px solid green;
        }
        #t1,#t2,#t3,#t4{
            color:#F96868;
            padding-left: 30px;
            line-height: 27px;
            font-size: 12px;
            margin-left:0;
        }
        #t1,#t2,#t3{
            width:170px;
            padding-bottom:21px;
            background-color: white;
        }
        #t4{
            width:273px;
            padding-bottom:27px;
            background-color: white;
        }
        #t5{
            height:21px;
            width:303px;
            background-color: white;
        }
        select{
            width:264px;
            height:36px;
            border-radius: 3px;
            display: block;
            padding-left: 8px;
            border:1px solid green;
        }
        .paad{
            width:303px;
            height:10px;
            background-color:white;
        }
        #paaa{
            display:none;
        }
        textarea{
            width:252px;
            height:70px;
            border-radius: 3px;
            display: block;
            padding-left: 10px;
            padding-top:10px;
            border:1px solid green;
        }
        #a1fa{
            position: relative;
            width:282px;
            height:37px;
            padding-left: 21px;
            background-color: white;
        }
        #a1fa a{
            display: block;
            width:59px;
            height:37px;
            float:left;
            text-decoration: none;
            line-height: 37px;
            text-align: center;
            cursor: pointer;
        }
        #a1{
            background-color: #62A8EA;
            color:white;
        }
        #a2{
            background-color: #E4EAEC;
            margin-left: 10px;
            color:#76838F;
        }
        #a1:hover{
            background-color: #8ed2ff;
        }
        #a2:hover{
            background-color: #f2f8fa;
        }
        #a1sub{
            position: absolute;
            left: 21px;
            top:0;
            background-color: #9bcaff;
            color:white;
            display:none;
            width:59px;
            height:37px;
            line-height: 37px;
            text-align: center;
        }
    </style>
</head>
<body>
   <div class="fa">
        <div style="height:1px;"></div>
        <div class="add_left">
            <table width="140" border="0" cellpadding="0" cellspacing="0" align="left">
                <tr align="left">
                    <th>订单中心</th>
                </tr>
                <tr>
                    <td><a href="#">个人中心</a></td>
                </tr>
                <tr>
                    <td><a href="#">我的订单</a></td>
                </tr>
                <tr>
                    <td><a href="#">我的收藏</a></td>
                </tr>
                <tr>
                    <td><a href="#">我的优惠券</a></td>
                </tr>
                <tr>
                    <td><a id="a" href="#">收货地址</a></td>
                </tr>
                <tr>
                    <td><a href="#">消费明细</a></td>
                </tr>
                <tr>
                    <td><a href="#">账户设置</a></td>
                </tr>
            </table>
        </div>
        <div class="add_right">
            <a id="b">添加收货地址</a>
            <c:forEach items="collection" var="name" varStatus="status">
                <div class="address">
                <div class="sel">
                    <a href="#">编辑</a>
                    <a href="#">删除</a>
                </div>
                张坤<br/>
                18234010216<br/>
                山西省 太原市 尖草坪区 中北大学
            </div>
            </c:forEach>
        </div>
    </div>
    <div id="addform">
        <div class="parent">
            <div class="parent_top">
                &nbsp;&nbsp;&nbsp;收货地址
            </div>
            <div id="pad"></div>
            <form id="address" action="collection.html">
                <input type="text" id="username" placeholder="收货人姓名"/>
                <div id="t1"></div>
                <input type="text" id="phone" placeholder="收货人电话"/>
                <div id="t2"></div>
                <select id="add" name="">
                    <option value="">请选择所在地区</option>
				</select>
				<div id="paaa">
				    <div class="paad"></div>
				    <select id="city" name="city"></select>
				    <div class="paad"></div>
				    <select id="county" name="county"></select>
				</div>
                <div id="t3"></div>
                <div style="width:303px;height:82px;background-color:white;">
                    <textarea id="detail" placeholder="详细地址"></textarea>
                </div>
                <div id="t4"></div>
                <div id="a1fa">
                    <a id="a1">保存</a>
                    <a id="a2">取消</a>
                    <div id="a1sub">保存</div>
                </div>
                <div id="t5"></div>
            </form>
        </div>
    </div>
</body>
</html>