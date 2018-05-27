<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="retrieve.BuildRetrieve"%>
<%@page import="extend.RetrieveResult"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="retrieve.PlantRetrieve"%>
<%@page import="color.ColorSmooth"%>
<%@page import="retrieve.RetrieveStat"%>
<%
String inputInfo = request.getParameter("inputInfo");
inputInfo = new String(inputInfo.getBytes("ISO8859-1"),"utf-8");   //转换乱码
String retrieveLimits = request.getParameter("retrieveLimits");
retrieveLimits = new String(retrieveLimits.getBytes("ISO8859-1"),"utf-8");   //转换乱码

RetrieveStat stat = new RetrieveStat();
String retrieveMark = stat.saveRetrieveData(retrieveLimits, inputInfo);
stat.closeDB();

String dir=application.getRealPath(""); // flora\ajax\
dir = dir.replace("ajax","");

String dirSmart = dir+"\\lucene\\indexSmart";
String dirGeneral = dir+"\\lucene\\indexGeneral";

PlantRetrieve retrieve = new PlantRetrieve(true);
List<RetrieveResult> list = retrieve.getResult(inputInfo, dirSmart, dirGeneral, retrieveLimits);

PlantnameDatabase plant = new PlantnameDatabase();
out.clear();
 %>
<input id="retrieveMark" name="retrieveMark" value="<%=retrieveMark %>" type="hidden"/>
 <%
 if (list.size()<=0){
  %>
 <div class="alert alert-error" style="opacity:0.9">
	<button type="button" class="close" data-dismiss="alert">×</button>
		 <strong>对不起，系统未能找到任何与描述相符的植物。</strong>
</div>
  <%}else{ %>
	<div>
	<%
	List<RetrieveResult> present = new ArrayList<RetrieveResult>();
	float maxScore = list.get(0).score;
	for (int i=0;i<list.size();i++){
		if (((maxScore-list.get(i).score<1.0 && maxScore*0.5<list.get(i).score)|| list.get(i).score>=1.0)){
			present.add(list.get(i));
		}
		else break;
	}
	
	//List<String> colorList = (new ColorSmooth()).smoothGreenForRetrieve(present);
	
%>
	
<% if (maxScore<1){ %>
<div class="alert alert-info" style="opacity:0.9">
	<button type="button" class="close" data-dismiss="alert">×</button>
		 <strong>很抱歉，系统未能找到与描述相符的植物，但是，系统为您推荐如下可能的植物</strong>
</div>
<%}else{ %>

<div class="alert alert-success" style="opacity:0.9">
	<button type="button" class="close" data-dismiss="alert">×</button>
		 <strong>系统为您找到如下与描述相符的植物</strong>
</div>	
	
<%} %>
<div style="position: relative">
<div id="result-background" style="padding: 0px;background: rgb(232, 255, 255);opacity: 0.6;width: 100%;position:absolute;top:0;left:0"></div>
<div id="result-text" style="padding: 30px;position:relative">
<div>
	<div style="display: inline">
		<label class="checkbox" for="checkbox2" onclick="selectAllResults()" id="selectAll" style="width: 50px;display: inline">
			<span class="icon"></span><span class="icon-to-fade"></span>
	       	<input type="checkbox" data-toggle="checkbox" value="" id="checkbox2" class="testagAll"/>全选
	    </label>  
	</div>
	<div style="display: inline" class="select_style">&nbsp;&nbsp;&nbsp;&nbsp;将选中结果添加至
				<div class="btn-group" style="margin-left: 0">
          			<button id="selectGoal" type="button" class="button button-flat-primary" data-toggle="dropdown" style="width:100px;margin-top:-5px">
          				<span style="margin-left: -13;" id="goalName">分类关系图</span>
          				<span class="caret" style="margin-top: 12;margin-left:0"></span>
         			 </button>
          			<ul class="dropdown-menu"  role="menu" aria-labelledby="selectGoal"  style="min-width: 100px;">
            			<li align="center"><a href="#" onclick="addToQuery()"><small>分类关系图</small></a></li>
            			<li align="center"><a href="#" onclick="addToTaxa()"><small>分类检索表</small></a></li>
          			</ul>
        		</div>
	</div>
	<div style="display: inline;float:right">
		<div style="display:inline">请对本次检索结果打分：</div><div id="rateRetrieve" style="display:inline"></div>
	</div>
</div>

<br/>
	<table class="table table-hover" id="resultsTable" border="1" style="border-color: #aaaaaa;">
	<thead>
	<tr bgColor="#00afec" style="opacity:0.8">
		<th>选择</th>
		<th>中文名</th>
		<th>拉丁名</th>
		<th>等级</th>
		<th>
			<abbr title="什么是评分？">
			<a style="color: #000000" id="what-is-score" href="#what-is-score-container" role="button"  data-toggle="modal">
				评分</a></abbr>
			</th>
	</tr>
	</thead>
	<tbody class="retrieveTableLine">

<%		
	for (int i=0;i<present.size();i++){
%>
	<tr style="color:#007800">
		<td>
			<label class="checkbox" for="checkbox<%=i%>" onclick="selectOneResults(this)">
				<span class="icon"></span><span class="icon-to-fade"></span>
       			<input type="checkbox" value="<%=present.get(i).plantId%>" id="checkbox<%=i%>" data-toggle="checkbox" class="testag"/>
    		</label>
		</td>
		<td>
			<a href="#" style="color:#007800" 
			onclick="getPlantDetail('<%=present.get(i).plantId%>','<%=plant.queryId(present.get(i).plantId).getNameCN() %>','<%=plant.queryId(present.get(i).plantId).getNameLatin() %>')">
				<%=plant.queryId(present.get(i).plantId).getNameCN() %>
			</a>
		</td>
		<td>
			<a href="#" style="color:#007800" 
				onclick="getPlantDetail('<%=present.get(i).plantId%>','<%=plant.queryId(present.get(i).plantId).getNameCN() %>','<%=plant.queryId(present.get(i).plantId).getNameLatin() %>')">
				<%=plant.queryId(present.get(i).plantId).getNameLatin() %>
			</a>
		</td>
		<td><%=present.get(i).levelCN %>&nbsp;<%=present.get(i).levelLatin %></td>
		<td><%=present.get(i).score %></td>
	</tr>
<%
	if (maxScore>1&&i>10)
		break;
} %>
	</tbody>
	</table>
	</div>
	</div>
</div>
<%
}//   if (list.size()<=0)
%>

<%
plant.closeDB();
retrieve.closeDB();
%>
<div id="what-is-score-container" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" 
				aria-hidden="true" style="width: 30%;align:center">
				<div class="modal-header">
					 <!--button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button-->
					<div>
						<div style="display: inline;">
						<h3>什么是评分？</h3>
						</div>
						<div style="display: inline;float: right"></div>
					</div>
					
				</div>
				<div class="modal-body">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统在根据用户输入内容进行智能检索的过程中，利用相关算法，对植物名称与用户描述的相关性进行定量的打分评价，分数越高，则该植物名与用户的描述越相符。
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="clearText()">返回</button>
				</div>
</div>