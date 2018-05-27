<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.EmailDatabase"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
out.clear();
String verifyCode = request.getParameter("verifyCode");
String codeKey = (String)session.getAttribute("captcha");

if (verifyCode.equalsIgnoreCase(codeKey)){
	String userName = request.getParameter("userName");
	userName = java.net.URLDecoder.decode(userName,"utf-8");   //转换乱码 from js
	
	String userEmail = request.getParameter("userEmail");
	userEmail = java.net.URLDecoder.decode(userEmail,"utf-8");   //转换乱码 from js
	
	String title = request.getParameter("title");
	title = java.net.URLDecoder.decode(title,"utf-8");   //转换乱码 from js
	
	String description = request.getParameter("description");
	description = java.net.URLDecoder.decode(description,"utf-8");   //转换乱码 from js
	
	String type = request.getParameter("type");
	type = java.net.URLDecoder.decode(type,"utf-8");   //转换乱码 from js
	
	
	EmailDatabase send = new EmailDatabase();
	send.insertEmail(userName,userEmail,title,description,type);
	send.closeDB();
	out.print("1");
} else{
	out.print("0");
}
%>