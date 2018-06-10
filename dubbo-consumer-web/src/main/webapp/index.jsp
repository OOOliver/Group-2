<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#main{
			width: 700px;
			height: 400px;
			text-align: center; 
			margin:100px auto;
			color: white;
			font-size: 30px;
			border: solid 1px red;
		}
		#head{
			height: 50px;
			background-color: black;
		}
	</style>
  </head>
  
  <body>
  	<div id="main" >
  		<div id="head">
  			Dubbo基础服务平台V1.0版
  		</div>
		 
		<div>
			<form action="service1.do" style="color: black; font-size: 20px" action="">
				大写转小写：<input type="text" name="word" value="${yword1 }">
				<input type="submit" value="转换"/>
				<input type="text" value="${word1 }">
			</form>
			<form action="service2.do" style="color: black; font-size: 20px" action="">
				小写转大写：<input type="text" name="word" value="${yword2 }">
				<input type="submit" value="转换" />
				<input type="text" value="${word2 }">
			</form>
			<form action="service3.do" style="color: black; font-size: 20px" action="">
				首字母大写：<input type="text" name="word" value="${yword3 }">
				<input type="submit" value="转换"/>
				<input type="text" value="${word3 }">
			</form>
		</div>  	
  	</div>
  	
  </body>
</html>
