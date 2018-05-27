<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="database.hibernate.Plantname"%>
<%@page import="java.net.URLEncoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String newList = request.getParameter("newList");
System.out.println("idList= "+newList);
String[] plants = newList.split(":");
String lists = "";
PlantnameDatabase plantDatabase = new PlantnameDatabase();
for (int i=0;i<plants.length;i++){
	Plantname tempPlant = plantDatabase.queryId(plants[i]);
	lists = lists + "#" + tempPlant.getNameCN()+" "+tempPlant.getNameLatin();
}
if (lists.length()>0)
	lists = lists.substring(1);
plantDatabase.closeDB();

lists = URLEncoder.encode(lists,"utf-8");

String url = "../smartsearch.jsp?import=1&newList="+lists;
System.out.println(url);
response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
response.sendRedirect(url);
 %>
