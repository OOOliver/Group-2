<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<div id="aboutNavBarMenu">
	<div class="voice {}" align="center">
		<a class="label" href="#about-website" onclick="scrollMenu()">关于网站</a>
	</div>
	<div class="voice {}" align="center">
		<a class="label" href="#about-function" onclick="scrollMenu()">关于功能</a>
	</div>
	<div class="voice {}" align="center">
		<a class="label" href="#about-data" onclick="scrollMenu()">关于数据</a>
	</div>
	<div class="voice {}" align="center">
		<a class="label" href="#about-author" onclick="scrollMenu()">关于作者</a>
	</div>
</div>
</html>