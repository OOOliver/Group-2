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
	plantName = new String(plantName.getBytes("ISO8859-1"), "utf-8"); //转换乱码
	//System.out.println("\n"+plantName);
	PlantnameDatabase pndatabase = new PlantnameDatabase();
	String plantId = pndatabase.getPlantId(plantName);
	String path = request.getSession().getServletContext()
			.getRealPath("/")
			+ "IDKeys\\";
	BufferedReader reader = null;
	if (plantId.trim().equals("")) {
		out.clear();
		out.print("1");
		pndatabase.closeDB();
		return;
	}

	String plantPath = pndatabase.getNamePath(plantId);
	File myfile = new File(path + plantId + ".txt");
	if (!myfile.exists()) {
		out.clear();
		out.print("2");
		pndatabase.closeDB();
		return;
	}
	InputStreamReader read = null;
	try {
		read = new InputStreamReader(new FileInputStream(myfile),
				"utf-8");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("没有检索表");
		pndatabase.closeDB();
		return;
	}
	reader = new BufferedReader(read);
	String result = "";
	String tmp = null;
	String tmp2 = "aadcs";
	while ((tmp = reader.readLine()) != null) {
		if (!tmp.equals(tmp2)) {
			result += tmp + "@@";
		}
		tmp2 = tmp;
	}

	String fpath="";
	String []paths=plantPath.split(":");
	Plantname name;
	for(int i=0;i<paths.length;i++){
		name=pndatabase.queryId(paths[i]);
		if(!paths[i].equals("")) fpath=name.getNameCN()+" "+name.getNameLatin()+":"+fpath;
	}
	pndatabase.closeDB();
	//System.out.println("hdhdh"+fpath+"\n"+detail);
	result = result.replace("\t", "&&");
	//System.out.print("\n" + result);
	
	//String detail = new PlantDetails().getTextDetails(plantId);
	//detail = detail.substring(detail.indexOf("<font"));
	
	reader.close();
	out.clear();
	out.print(fpath.substring(0,fpath.length()-1)+"##"+/*detail+"##"+*/result);
%>