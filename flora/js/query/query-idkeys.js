//搜索自动补全

var xhr; // 定义一个全局对象

var a;// 检索表数组

function createXhr() {
	if (window.ActiveXObject) {
		xhr = new ActiveXObject('Microsoft.XMLHTTP');
	} else if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	}
}

function getContent() {
	createXhr();
	// str = encodeURIComponent(searchName);
	var url = "operation/GetPlantIDKey.jsp?plantname="
			+ encodeURIComponent($("input#search_name").val());

	// alert(url);
	xhr.open("POST", url, true);
	xhr.onreadystatechange = answer;
	xhr.send(null);

}

function answer() {
	var textHTML; // 返回值
	if (xhr.readyState == 4) {
		if (xhr.status == 200 || xhr.status == 0) {
			textHTML = xhr.responseText;
			if (textHTML == "") {
				return;
			}
			//alert(textHTML);
			if(!preProgress(textHTML)) return;

			document.getElementById("jiansuo").innerHTML=
			'<a class="linkToRed" href="javascript:void(0)" onclick="getPlantDetailPre(\''+$("input#search_name").val()+'\')">'+
				$("input#search_name").val()+'</a>  检索表';
			var part3 = textHTML.split("##");
			document.getElementById("plantpath").innerHTML=getPlantPath(part3[0]);
			//document.getElementById("plantdetail").innerHTML=part3[1];
			var aaa = part3[1].split("@@");
			// alert(aaa.length);

			a = new Array();

			a[0] = new Object();
			a[0].orgin = 0;
			var i = 1;
			for (i = 1; i < aaa.length; i++) {
				if (aaa[i] == "")
					continue;
				var tmp = aaa[i].split("&&");
				var order = tmp[0];
				a[order] = new Object();
				a[order].desc = tmp[3];
				a[order].to = parseInt(tmp[1]);
				a[order].orgin = parseInt(tmp[2]);
				if (tmp[4] != 'null')
					a[order].name = tmp[4];
			}

			var k;
			for (k = 1; k < a.length; k++) {
				if (a[k].orgin == a[k - 1].orgin) {
					//alert(k+'    ='+a[k].orgin);
					a[k].parent = a[k - 1].parent;
					a[a[k].parent].rchild = k;
				} else if (a[k].orgin > a[k - 1].orgin) {
					//alert(k+'    >'+a[k].orgin);
					a[k].parent = k - 1;
					if(a[a[k].parent].lchild==null)  a[a[k].parent].lchild= k;
					else a[a[k].parent].rchild= k;
				} else {
					//alert(k+'    hee'+a[k].orgin);
					a[k].parent = a[a[k].to].parent;
					a[a[k].parent].rchild = k;
				}
			}
			showInit();
		}
	}
}

function getPlantPath(text){
	var paths = text.split(":");
	var plantpath='';
	var i=0;
	if(paths[0]=='植物界') {
		plantpath+='<p style="padding-left:'+i*7+'px"><font color="black">'+paths[i]+'</font></p>';
		i++;
	}
	for(;i<paths.length;i++){
		if(paths[i]!='') plantpath+='<p style="padding-left:'+i*7+'px"><a href="#" class="linkToRed" onclick="getPlantDetailPre(\''+paths[i].split(" ")[0]+'\')">'+paths[i]+'</a></p>';
	}	
	return plantpath;
}
function preProgress(text){//预处理
	var i=parseInt(text);
	if(i==1) alert('没有该植物');
	else if(i==2) alert('该类无分类检索表');
	else return true;
	return false;
}

function show(id){
	if(id==0) showInit();
	var historyR='';
	var s='';
	var i;
	c=[];
	var p=id;
	while(a[p].parent!=0) {c.push(p);p=a[p].parent;}
	c.push(p);
	if(a!=null){
	    for(i=c.length-1;i>=0;i--){	       
	    	//s+=formatOutput(c[i]);
	    	historyR+=formatOutput(c[i]);
	    }
		
		p=a[id].lchild;
		s+=formatOutputSelect(p);
		p=a[id].rchild;
		s+=formatOutputSelect(p);
	}
	resultSetClass(id);
	document.getElementById("show").innerHTML=s;
	document.getElementById("history").innerHTML=historyR;
	document.getElementById("PlantsA").innerHTML=setA;
	document.getElementById("PlantsB").innerHTML=setB;
}
var setA;
var setB;
var clickitem;
function resultSetClass(id){
	clickitem=id;
	setA='';
	setB='';
	if(id>=0){
		setResultA(id,'badge-info');
		setResultB(0,'badge-success');
	}
	else{
		setResultB(0,'badge-info');
	}
}

function setResultA(order,type){	
	if(a[order].name!=null && a[order].name.trim()!='') setA+='<span class="badge '+type+'"><a href="javascript:void(0)" onclick="show('+ a[order].parent +')" > ' + a[order].name +' </font></a></span>   ';
	if(a[order].lchild!=null) setResultA(a[order].lchild,type);
	if(a[order].rchild!=null) setResultA(a[order].rchild,type);	
}

function setResultB(order,type){
	if(order==clickitem) return;
	if(a[order].name!=null && a[order].name.trim()!='') setB+='<span class="badge '+type+'"><a href="javascript:void(0)" onclick="show('+ a[order].parent +')" > ' + a[order].name +' </font></a></span>    ';
	if(a[order].lchild!=null) setResultB(a[order].lchild,type);
	if(a[order].rchild!=null) setResultB(a[order].rchild,type);
}

function showAll(){	
	var s="<br/>";
	c=[];
	if(a !=null){
		var i;
	    for(i=1;i<a.length;i++){
	        s+=formatOutput(i);
	    }
	}
	
	clickitem=-1;
	resultSetClass(-1);
	document.getElementById("show").innerHTML = s;
	document.getElementById("history").innerHTML='选择检索内容';
	document.getElementById("PlantsA").innerHTML=setB;
	document.getElementById("PlantsB").innerHTML='';
}

function showInit() {
	var s = '';
	var p = a[0].lchild;
	s += formatOutputSelect(p);
	p = a[p].to;
	s += formatOutputSelect(p);
	
	clickitem=-1;
	resultSetClass(-1);
	document.getElementById("show").innerHTML = s;
	document.getElementById("history").innerHTML='选择检索内容';
	setA=setB;
	document.getElementById("PlantsA").innerHTML=setB;
	document.getElementById("PlantsB").innerHTML='';
	document.getElementById("addToGraph").style.visibility = "visible";
}

function formatOutput(order) {
	if (a[order].lchild != null) {
		return '<div>' + a[order].orgin
				+ '    <a href="javascript:void(0)" class="taxaDescription" onclick="show('
				+ order + ')" >' + '' + a[order].desc + "("
				+ a[a[order].lchild].orgin + ")" + '</a></div>';
	} else {
		return '<div>' + a[order].orgin + '    ' + a[order].desc
				+ '---'+a[order].name+'</div>';
	}
}

function formatOutputSelect(order) {
	var items=a[order].desc.split("；");
	var s='';
	for(var i=0;i<items.length;i++){
		s+='<p>('+(i+1)+')'+items[i]+"</p>";
	}
	//alert(s);
	if (a[order].lchild != null) {
		return '<div><h3>' + a[order].orgin
				+ '    跳转号('+a[a[order].lchild].orgin +')</h3><a href="javascript:void(0)" class="taxaDescription" onclick="show('
				+ order + ')" >' + '' + s  + '</a></div>';
	} else {
		return '<div><h3>' + a[order].orgin + '    <a href="#" class="linkToRed" onclick="getPlantDetailPre(\''+a[order].name+'\')">'+a[order].name+'</a></h3>' + s
				+ '</div>';
	}
}

function addToQueryPre(){
	var s=setA.split('</font></a></span>');
	var result='';
	for(var i=0;i<s.length-1;i++)
		result+=s[i].substring(s[i].lastIndexOf('>')+1)+":";
//	alert(result.substring(0, result.length-1));
	return result.substring(0, result.length-1);
}