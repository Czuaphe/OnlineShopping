        var uaid=0;
        var deal="";
        function addframe(){
        	var num=$(".add_right").children(".address").length-6;
        	var row=0;
        	if(num>=0){
        		if(num%3==0){
            		row=num/3;
            	}else{
            		row=num/3+1;
            	}
        	}
        	var addH=402+row*155;
        	var addF=462+row*155;
        	$(".add_right").height(addH+"px");
        	$(".fa").height(addF+"px");
        }
            
        $(function(){
        	addframe();
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
                $("#addform").fadeOut(500);
            });
            /* 点击“增加收货地址” */
            $("#b").click(function(){
            	deal="insert";
                $("#addform").css("display","block");
                $("#username").val("");
                $("#phone").val("");
                $("#add").val("");
                $("#detail").val("");
                $("#paaa").css("display","none");
                $("#t1").html("");
                $("#t2").html(""); 
                $("#t4").html(""); 
                $("#t3").html("");
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
                        } else if(phone.length>11) {
                            $("#t2").html("输入的号码不正确");
                        }else{
                        	$("#t2").html("");
                        }
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
                if(phone.length>11){
                	$("#t2").html("输入的号码不正确");
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
                if(flag==true&&deal=="insert"){
                	var province=$("#add").find("option:selected").text();
                    var city=$("#city").find("option:selected").text();
                    var county=$("#county").find("option:selected").text();
                    var _uid=$("#hi").val();
                    $.getJSON(
                    	    "/OnlineShopping/AddressServlet",	
                    	    {"userid":_uid,"name":name,"phone":phone,"province":province,"city":city,"county":county,"details":address,"flag":"add"},
                    	    function(result){
                    	        if(result[0]=="true"){
                    	        	$(".add_right").append($("<div class='address' id='"+result[1]+"'><div class='sel'><a class='edit' onclick='edit("
                    	        			+result[1]+")'>编辑&nbsp;</a><a class='delete' onclick='del("+result[1]+
                    	        			")'>删除</a></div><span class='mingzi' id='name"+result[1]+"'>"+name
                    	        			+"</span><br/><span class='others' id='phone"+result[1]+"'>"+
                    	        			phone+"</span><br/><span class='others' id='details"+result[1]+"'>"
                    	        			+province+"&nbsp;"+city+"&nbsp;"+county+"&nbsp;"+address+"</span></div>"));
                    	        	addframe();
                    	        	$("#addform").css("display","none");
            						$(".flash").html("保存成功");
            						$(".flash").css("display","block");
            						$(".flash").fadeOut(2500);
                    	        }
                    	    }
                    	);
                }
                if(flag==true&&deal=="edit"){
                	var province=$("#add").find("option:selected").text();
                    var city=$("#city").find("option:selected").text();
                    var county=$("#county").find("option:selected").text();
                    var _uid=$("#hi").val();
                    $.get(
                    		"AddressServlet",
                    		{"uaid":uaid,"userid":_uid,"name":name,"phone":phone,"province":province,"city":city,"county":county,"details":address,"flag":"alter"},
                    		function(result){
                    	        if(result=="true"){
                    	        	$("#name"+uaid).html(name);
                    	        	$("#phone"+uaid).html(phone);
                    	        	$("#details"+uaid).html(province+"&nbsp;"+city+"&nbsp;"+county+"&nbsp;"+address);
                    	        	$("#addform").css("display","none");
            						$(".flash").html("保存成功");
                    	        }else if(result=="false"){
                    	        	$("#addform").css("display","none");
            						$(".flash").html("保存失败");
                    	        }
                    	        $(".flash").css("display","block");
        						$(".flash").fadeOut(2500);
        			});
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
                            $.getJSON(
                            	    "/OnlineShopping/DivisionServlet",	
                            	    {"flag":"2","pid":add},
                            	    function(result){
                            	    	$("#city").children().remove();
                            	    	for(var i=0;i<result[0].length;i+=2){
                            	    		var op=$("<option value='"+result[0][i]+"'>"+result[0][i+1]+"</option>");
                                	    	$("#city").append(op);
                            	    	}
                            	    	$("#county").children().remove();
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
            
            
            
            
            $("#con").click(function(){
            	$.ajax({
    				url:"AddressServlet",
    				type:"get",
    				data:{"uaid":uaid,"flag":"del"},
    				success:function(result){
    					if($.trim(result) == "true"){
    						$("#"+uaid).remove();
    						addframe();
    						$(".delfrom").css("display","none");
    						$(".flash").html("删除成功");
    						$(".flash").css("display","block");
    						$(".flash").fadeOut(2500);
    				    }
    				},
    				error:function(){
    					alert("ajax执行失败！");
    				}
    			});
            });
            
            $("#can").click(function(){
            	$(".delfrom").css("display","none");
            });
            
        });
        
        function del(id){
        	uaid=id;
        	$(".delfrom").css("display","block");
        }
        
        function edit(id){
        	uaid=id;
        	deal="edit";
        	$("#addform").css("display","block");
    		$("#paaa").css("display","block");
    		$("#t1").html("");
    		$("#t2").html("");
    		$("#t3").html("");
    		$("#t4").html("");
    		$.getJSON(
            	    "/OnlineShopping/AddressServlet",	
            	    {"flag":"edit","uaid":id},
            	    function(result){
            	    	$("#username").val(result[0].name);
            	    	$("#phone").val(result[0].phone);
            	    	$("#add").val(result[0].province);
            	    	$("#city").children().remove();
            	    	for(var i=0;i<result[1].length;i+=2){
            	    		var op=$("<option value='"+result[1][i]+"'>"+result[1][i+1]+"</option>");
                	    	$("#city").append(op);
            	    	}
            	    	$("#city").val(result[0].city);
            	    	$("#county").children().remove();
            	    	for(var i=0;i<result[2].length;i+=2){
            	    		var op=$("<option value='"+result[2][i]+"'>"+result[2][i+1]+"</option>");
                	    	$("#county").append(op);
            	    	}
            	    	$("#county").val(result[0].block);
            	    	$("#detail").val(result[0].details);
            	    }
            	);
        }