<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.hibernate.Plantname"%>
<%@page import="database.PlantnameDatabase"%>
<% 
String name = request.getParameter("name");
name = new String(name.getBytes("ISO8859-1"),"utf-8");   //转换乱码
PlantnameDatabase search = new PlantnameDatabase();
List<String[]> list = search.autoComplete(name);

String temp = "";
for (int i=0;i<list.size();i++){
	temp = temp+"=="+list.get(i)[0]+"++"+list.get(i)[1];
}
if (temp.length()>2)
	temp = temp.substring(2);

search.closeDB();
out.clear();
out.print(temp);%>