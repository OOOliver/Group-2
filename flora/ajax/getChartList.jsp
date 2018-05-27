<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String chartList = (String)session.getAttribute("chartList");
if (chartList==null)
	chartList = "";
out.clear();
out.print(chartList);
%>