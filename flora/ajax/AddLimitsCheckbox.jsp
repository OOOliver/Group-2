<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String retrieveLimits = request.getParameter("retrieveLimits");

out.clear();
 %>

<div class="modal-header">
	<h3>添加查询等级范围</h3>
</div>
<div class="modal-body" id="main-limits" style="min-height:480px">
	<label class="checkbox<%if (retrieveLimits.indexOf("Divisio")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="门 Divisio" id="Divisio" <%if (retrieveLimits.indexOf("Divisio")!=-1)out.print("checked=\"checked\""); %>/>门 Divisio
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subdivisio")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚门 Subdivisio" id="Subdivisio" <%if (retrieveLimits.indexOf("Subdivisio")!=-1)out.print("checked=\"checked\""); %>/>亚门 Subdivisio
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Classis")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="纲 Classis" id="Classis" <%if (retrieveLimits.indexOf("Classis")!=-1)out.print("checked=\"checked\""); %>/>纲 Classis
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subclassis")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚纲 Subclassis" id="Subclassis" <%if (retrieveLimits.indexOf("Subclassis")!=-1)out.print("checked=\"checked\""); %>/>亚纲 Subclassis
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Ordo")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="目 Ordo" id="Ordo" <%if (retrieveLimits.indexOf("Ordo")!=-1)out.print("checked=\"checked\""); %>/>目 Ordo
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subordo")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚目 Subordo" id="Subordo" <%if (retrieveLimits.indexOf("Subordo")!=-1)out.print("checked=\"checked\""); %>/>亚目 Subordo
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Familia")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" <%if (retrieveLimits.indexOf("Familia")!=-1)out.print("checked=\"checked\""); %> value="科 Familia" id="Familia"/>
       	<strong>科 Familia</strong>
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subfamilia")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚科 Subfamilia" id="Subfamilia" <%if (retrieveLimits.indexOf("Subfamilia")!=-1)out.print("checked=\"checked\""); %>/>亚科 Subfamilia
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Tribus")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="族 Tribus" id="Tribus" <%if (retrieveLimits.indexOf("Tribus")!=-1)out.print("checked=\"checked\""); %>/>族 Tribus
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subtribus")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚族 Subtribus" id="Subtribus" <%if (retrieveLimits.indexOf("Subtribus")!=-1)out.print("checked=\"checked\""); %>/>亚族 Subtribus
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Genus")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="属 Genus" id="Genus" <%if (retrieveLimits.indexOf("Genus")!=-1)out.print("checked=\"checked\""); %>/>
       	<strong>属 Genus</strong>
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Subgenus")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="亚属 Subgenus" id="Subgenus" <%if (retrieveLimits.indexOf("Subgenus")!=-1)out.print("checked=\"checked\""); %>/>亚属 Subgenus
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Sectio")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="组 Sectio" id="Sectio" <%if (retrieveLimits.indexOf("Sectio")!=-1)out.print("checked=\"checked\""); %>/>组 Sectio
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Series")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="系 Series" id="Series" <%if (retrieveLimits.indexOf("Series")!=-1)out.print("checked=\"checked\""); %>/>系 Series
    </label>
    
    <label class="checkbox<%if (retrieveLimits.indexOf("Species")!=-1)out.print(" checked"); %>" for="checkbox1">
	<span class="icon"></span><span class="icon-to-fade"></span>
       <input type="checkbox" value="种 Species" id="Species" <%if (retrieveLimits.indexOf("Species")!=-1)out.print("checked=\"checked\""); %>/>
       		<strong>种 Species</strong>
    </label>
</div>
<div class="modal-footer">
	 <button class="btn btn-primary"  data-dismiss="modal" aria-hidden="true" onclick="saveLimits()" >确定</button>
	 <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
</div>
