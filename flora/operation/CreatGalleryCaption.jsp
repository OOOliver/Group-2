<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.GalleryDatabase"%>
<%
String plantId = request.getParameter("plantId");
GalleryDatabase gallery = new GalleryDatabase();
out.clear();
 %>
 <div class="gallary-caption-animation" id="gallery-caption-innerhtml">
	 <div style="width:80%;margin-left:30"  >
	 	<br/>
		<h1 class="gallery-name-link">
			<a target="_blank" href="query.jsp?search_name=<%=gallery.getSpeciesName(plantId) %>">
				<%=gallery.getSpeciesName(plantId) %>
			</a>
		</h1>
		<h3 class="gallery-name-link">
			<a target="_blank" href="query.jsp?search_name=<%=gallery.getFamiliaName(plantId) %>">
				<%=gallery.getFamiliaName(plantId) %>
			</a>&nbsp;
			<a target="_blank" href="query.jsp?search_name=<%=gallery.getGenusName(plantId) %>">
				<%=gallery.getGenusName(plantId) %>
			</a>
		</h3>
		<p align="left" style="font-size: 18px">
			<%=gallery.QueryId(plantId).getDescription()%>
		</p>
	</div>
</div>
<%gallery.closeDB();%>