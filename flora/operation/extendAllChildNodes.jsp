<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.LowerTaxa"%>
<%
String plantId = request.getParameter("plantId");
String chartList = request.getParameter("chartList");
LowerTaxa lower = new LowerTaxa();
String lowerTemp[] = lower.getLowerTaxa(plantId);
String temp = "";
for (int i=0;i<lowerTemp.length;i++)
	temp = temp+":"+lowerTemp[i];
chartList = chartList+temp;
if (chartList.charAt(0)==':')
	chartList = chartList.substring(1);
lower.closeDB();
session.setAttribute("chartList", chartList);
out.clear();
out.print(chartList);%>