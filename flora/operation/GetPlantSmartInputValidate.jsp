<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File,java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.PlantDetails"%>
<%@page import="database.hibernate.PlantDetail"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="database.hibernate.Plantname"%>

<%
	String plantName = request.getParameter("plantname");
	String plantSelected = request.getParameter("selected");
	plantName = new String(plantName.getBytes("ISO8859-1"), "utf-8"); //转换乱码
	plantSelected = new String(plantSelected.getBytes("ISO8859-1"),"utf-8");
	PlantnameDatabase db = new PlantnameDatabase();

	String plantId = db.getPlantId(plantName);
	String[] plants = plantSelected.split("#");
	System.out.println(plants.length + "\nplantname:" + plantName + "\nselected:" + plantSelected);

	if (plantId.trim().equals("")) {//去掉！
		out.clear();
		out.print("0找不到植物"+plantName);
		db.closeDB();
		return;
	}
	database.LowerTaxa taxa = new database.LowerTaxa();

	if (!plants[0].equals("")){
		for (int i = 0; i < plants.length; i++) {
			String id=db.getPlantId(plants[i]);
			if(id.equals(plantId)){
				out.clear();
				out.print("0"+plantName+"与"+plants[i]+"属于同种植物，不能产生检索表");
				db.closeDB();
				taxa.closeDB();
				return;
			}
			if (taxa.isInPath(id, plantId)||taxa.isInPath(plantId, id)) {
				out.clear();
				out.print("0"+plantName+"与"+plants[i]+"具有上下级关系，不能建立检索表");
				db.closeDB();
				taxa.closeDB();
				return;
			} 
		}
	}
	Plantname pname= db.queryId(plantId);
	System.out.println();
	taxa.closeDB();
	db.closeDB();
	out.clear();
	out.print(pname.getNameCN()+" "+pname.getNameLatin());
	out.flush();
%>