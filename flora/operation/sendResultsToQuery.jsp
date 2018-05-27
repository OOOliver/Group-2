<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String newList = request.getParameter("newList");
if (newList==null)
	newList = "";
String merge = request.getParameter("merge");
if (merge==null)
	merge = "";

if (!newList.equals("")){
	if (merge.equals("0"))
		session.setAttribute("chartList", newList);
	else {
		String oldList = (String)session.getAttribute("chartList");
		session.setAttribute("chartList", oldList+":"+newList);
	} 
}

response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
response.sendRedirect("../query.jsp");
 %>
