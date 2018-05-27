<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.PlantDetails"%>
<%@page import="database.hibernate.PlantDetail"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="database.hibernate.Plantname"%>

<%
String plantId = request.getParameter("plantId");
PlantDetails details = new PlantDetails();
PlantDetail detail = details.getPlantDetail(plantId);
String mainDetails = detail.getDetail();
if (mainDetails.equals("null"))
	mainDetails = "";
String plantSource = detail.getSource();
if (plantSource.equals("null"))
	plantSource = "";

PlantnameDatabase findname = new PlantnameDatabase();
Plantname plant = findname.queryId(plantId);
String latinName = plant.getNameLatin();
String CPNI = plant.getCPNI();
findname.closeDB();
details.closeDB();
out.clear();
%>
<p>
<div>
	<div style="display:inline; float:right">访问次数：<%=detail.getvisit() %></div>
	<div style="display:inline"><h4>来源：<%=plantSource %></h4></div>
</div>
</p>

<font color="#000000">
<%=mainDetails.replace("<font color=\"#333333\">","").replace("</font>","")%>
</font>

<p>
<h4><font color="#22c800">在其它网站中查看：</font></h4>
<div>
	<a class="linklogo" target="_blank" href="http://frps.eflora.cn/frps/<%=latinName %>" title="中国植物志">
		<img src="img/linklogo/frps.png"/>
	</a>
	<a class="linklogo" target="_blank" href="http://foc.eflora.cn/search.aspx?k=<%=latinName %>&id=1" title="Flora of China">
		<img src="img/linklogo/foc.png"/>
	</a>
	<a class="linklogo" target="_blank" href="http://db.kib.ac.cn/eflora/view/search/Chs_contents.aspx?CPNI=<%=CPNI %>" title="中国植物物种信息数据库">
		<img src="img/linklogo/dcp.png"/>
	</a>
	<a class="linklogo" target="_blank" href="http://www.cvh.ac.cn/search/<%=latinName %>?n=1" title="中国数字植物标本馆">
		<img src="img/linklogo/cvh.png"/>
	</a>
	<a class="linklogo" target="_blank" href="http://bk.iplant.cn/bk/<%=latinName %>" title="植物百科">
		<img src="img/linklogo/bk.png"/>
	</a>
	<a class="linklogo" target="_blank" href="http://www.plantphoto.cn/list?latin=<%=latinName %>" title="中国植物图像库">
		<img src="img/linklogo/pp.png"/>
	</a>
</div>
</p>