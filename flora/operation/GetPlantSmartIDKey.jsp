<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="database.Taxonomy"%>
<%@page import="database.hibernate.PlantDetail"%>
<%@page import="database.PlantnameDatabase"%>
<%@page import="database.hibernate.Plantname"%>

<%
	String plants = request.getParameter("plants");
	plants = new String(plants.getBytes("ISO8859-1"), "utf-8"); //转换乱码
	
	PlantnameDatabase pndb = new PlantnameDatabase();
	String [] pathname=plants.substring(0,plants.length()-1).split("#");
	String [] pathid=new String[pathname.length];
	System.out.println("\n"+pathname.length);
	for(int i=0;i<pathname.length;i++){
		pathid[i] = pndb.getPlantId(pathname[i]);
		System.out.println(pathid[i]+":::"+pathname[i]);
	}
	pndb.closeDB();
	
	Taxonomy taxonomy = new Taxonomy(pathid);
	taxonomy.creatTaxonomyText();
	String result= taxonomy.taxonomyTextString;
	
	for(int i=0;i<pathname.length;i++){
		result = result.replace(pathid[i], pathname[i]);
	}
	result = result.replace("\n", "@@").replace("\t", "&&");
	result = "@@"+result;
	result = result.substring(0,result.length()-2);
	//System.out.println("\n"+result);
	//System.out.println(plants);
	//String plantId = pndatabase.getPlantId(plantName);
	taxonomy.closeDB();
	out.clear();
	out.print(result);
%>