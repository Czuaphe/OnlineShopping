<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function validate(){
	 	
		var uname = $("#uname").val();
		if(uname==null || uname==""){
			$("#unameDiv").html("用户名不能为空！");
		}else{
			//1.创建XMLHttpRequest对象
			xmlHttpRequest = createXmlHttpRequest();
			//2.设置回调函数
			xmlHttpRequest.onreadystatechange = callBack;
			//3.初始化XMLHttpRequest组件
			var url = "register.jsp";
			xmlHttpRequest.open("post",url,true);//get方式
			xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//4.发送请求
			var data="uname="+uname;//需要发送的数据信息，name为用户名输入框获取的值
			xmlHttpRequest.send(data);
		}
	}
	
	/*
	 *创建XMLHttpRequest对象
	 */
	function createXmlHttpRequest(){
		if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else{//返回值为false时说明是老版本IE浏览器（IE5和IE6）
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	//Ajax 回调函数
	function callBack(){
		if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){
			var data = xmlHttpRequest.responseText;
			if($.trim(data) == "true"){
				$("#unameDiv").html("用户名已被使用！");
		    }else{
				$("#unameDiv").html("用户名可以使用！");
		    } 
		}
	}
</script>
<body>
	<form action="" id="form1" >
		<table>
			<tr>
				<td>用 户 名：</td>
				<td>
					<input type="text" name="uname" id="uname" onblur="validate();" />&nbsp;<font color="#c00fff">*</font>
				</td>
				<td>
					<div id="unameDiv" style="display: inline"></div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>