<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="retrieve.RetrieveStat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String retrieveLimits = request.getParameter("retrieveLimits");
retrieveLimits = new String(retrieveLimits.getBytes("ISO8859-1"),"utf-8");   //转换乱码

String inputInfo = request.getParameter("inputInfo");
inputInfo = new String(inputInfo.getBytes("ISO8859-1"),"utf-8");   //转换乱码

String score = request.getParameter("score");

String retrieveMark = request.getParameter("retrieveMark");

RetrieveStat stat = new RetrieveStat();
stat.ratingRetrieve(retrieveMark, Integer.parseInt(score));

 %>
