<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.LowerTaxa"%>
<%
String plantId = request.getParameter("plantId");
String chartList = (String)session.getAttribute("chartList");
String deleteType = request.getParameter("deleteType");
LowerTaxa delete = new LowerTaxa();
String newChartList = delete.deleteTreeNode(plantId, chartList, deleteType);
delete.closeDB();
session.setAttribute("chartList",newChartList);
out.clear();
out.print(newChartList);%>