<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.hibernate.Gallery"%>
<%@page import="database.GalleryDatabase"%>
<% out.clear();%>
<%
GalleryDatabase gallery = new GalleryDatabase();
String temp = request.getParameter("pic_num");
int pic_num = Integer.parseInt(temp);
List<Gallery> list = gallery.QueryRandom(pic_num);
 %>
		<div align="center" class="gallery-animation" id="gallery-body"> 
 			<div class="carousel slide" id="photograph" style='height:600px;width:940px'>

				<ol class="carousel-indicators" id="gallery-bar">
					<% for (int i=0;i<list.size();i++){ %>
						<li <%if (i==0)out.print("class=\"active\""); %> data-slide-to="<%=i%>" data-target="#photograph"></li>
					<%} %>
				</ol>

				<div class="carousel-inner" >
				<% for (int i=0;i<list.size();i++){
						String plantId = list.get(i).getPlantId(); %>
					<div class="item<%if (i==0)out.print(" active"); %>">
						<img alt="" src="img/gallery/<%=list.get(i).getPhotopath() %>"  
							style="max-height:600px;max-width:940px;opacity:1" onmouseover="MM_over(this)" onmouseout="MM_out(this)"/>
						<div class="carousel-caption gallery-text-shadow" style="background: rgba(47, 107, 24, 0.59)" >
							<h4>
								<%=gallery.getSpeciesName(plantId) %>：
								<%=gallery.getFamiliaName(plantId) %>&nbsp;
								<%=gallery.getGenusName(plantId) %>
							</h4>
							<p align="left" style="font-size: 14px">
								<%=list.get(i).getDescription() %>
							</p>
						</div>
						
					</div>
				<%} %>
				
				</div> 
				<a data-slide="prev" href="#photograph" class="carousel-control left" id="left_click">‹</a> 
				<a data-slide="next" href="#photograph" class="carousel-control right" id="right_click">›</a>
					
			</div>
			
		</div>
	<div align="right" style="margin-right:200px;">
		<a href="javascript:" style="color: #000000" onclick="change_gallery()"  style="display:inline-block;" id="test">&nbsp;</a>
	</div>
<% gallery.closeDB(); %>