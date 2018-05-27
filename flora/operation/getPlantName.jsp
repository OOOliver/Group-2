<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="database.hibernate.Plantname"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String plantName = request.getParameter("plantName");
plantName = URLDecoder.decode(plantName,"utf-8");
plantName = plantName.trim();
System.out.println(plantName);
plantName = plantName.split(" ")[0];
System.out.println(plantName);
//System.out.println(plantName);
//plantName = new String(plantName.getBytes("ISO8859-1"), "utf-8"); //转换乱码

PlantnameDatabase plantDatabase = new PlantnameDatabase();
String plantId = plantDatabase.getPlantId(plantName);
Plantname plant = plantDatabase.queryId(plantId);
String nameCN = plant.getNameCN();
String nameLatin = plant.getNameLatin();

plantDatabase.closeDB();
//System.out.println(plantId+"]]"+nameCN+"]]"+nameLatin);
out.clear();
out.print(plantId+"]]"+nameCN+"]]"+nameLatin); 
 %>