<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.LowerTaxa"%>
<%@page import="database.PlantnameDatabase"%>
<%
String plantId = request.getParameter("plantId");
String language = request.getParameter("language");

PlantnameDatabase plant = new PlantnameDatabase();
LowerTaxa lower = new LowerTaxa();

String lowerId[] = lower.getLowerTaxa(plantId);
String temp = "";
for (int i=0;i<lowerId.length;i++){
	if (language.equals("cn"))
		temp = temp+":"+plant.queryId(lowerId[i]).getNameCN()+"+"+plant.queryId(lowerId[i]).getNameLatin();
	else temp = temp+":"+plant.queryId(lowerId[i]).getNameLatin()+"+"+plant.queryId(lowerId[i]).getNameCN();
}
if (temp.length()>=1)
	temp = temp.substring(1);

lower.closeDB();
plant.closeDB();
out.clear();
out.print(temp);%>