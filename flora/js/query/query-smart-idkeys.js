//搜索自动补全
var orderdiv = 0;
var num = 0;
var xhr; // 定义一个全局对象

var a;// 检索表数组

function getSelect() {
	var lls = $("div#plantlist").children();
	var i = 0;
	var result = '';
	for (i = 0; i < lls.length; i++) {
		var t = lls[i].innerHTML;
		var s = lls[i].innerHTML.substring(t.indexOf('</i>') + 5,t.indexOf('</font>'));
		result += s.split(' ')[0] + '#';
	}
	//alert(result);
	return result;
}

function funrem(order) {
	//document.getElementById("show").innerHTML=s;
	var s=document.getElementById("order" + order).innerHTML;
	s=s.substring(s.indexOf('</i>')+5,s.indexOf('</font>'));
	if (!window.confirm('确定要删除 '+s+'?')) return;
	if ($("div#order" + order) == null)
		return;
	$("div#order" + order).remove();
	num--;
	if (num < 2) {
		document.getElementById("btnClear").style.visibility = "hidden";
		document.getElementById("btnList").style.visibility = "hidden";
	}
}

function clearList() {
//	location.reload();
	
	for ( var i = 0; i < orderdiv; i++) {
		if ($("div#order" + i) != null)
			$("div#order" + i).remove();
	}
	orderdiv = 0;
	num = 0;
	document.getElementById("btnClear").style.visibility = "hidden";
	document.getElementById("btnList").style.visibility = "hidden";
}

function createXhr() {
	if (window.ActiveXObject) {
		xhr = new ActiveXObject('Microsoft.XMLHTTP');
	} else if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	}
}

function addPlant() {
	var lls = $("div#plantlist").children();
	var i = 0;
	for (i = 0; i < lls.length; i++) {
		var t = lls[i].innerHTML;
		var s = lls[i].innerHTML.substring(t.indexOf('</i>') + 5,t.indexOf('</font>'));
		var namecn=s.split(' ')[0];
		if ($("input#search_name").val() == namecn||$("input#search_name").val() == s.substring(namecn.length+1)) {
			alert($("input#search_name").val() + '已经选中，请添加其它植物');
			return;
		}
	}
	createXhr();
	var url = "operation/GetPlantSmartInputValidate.jsp?plantname="
			+ encodeURIComponent($("#search_name").val()) + "&selected="
			+ encodeURIComponent(getSelect());
	//alert(url);
	xhr.open("POST", url, true);
	xhr.onreadystatechange = ansaddplant;
	xhr.send(null);

}

function ansaddplant() {
	var textHTML; // 返回值
	// alert(XHR.readyState+' '+XHR.status);

	
	if (xhr.readyState == 4) {
		if (xhr.status == 200 || xhr.status == 0) {
			textHTML = xhr.responseText;
			if (textHTML == "") {
				return;
			}
			var i=parseInt(textHTML.substring(0, 1));
			if(i!=null) {
				if(i==0) {
				alert(textHTML.substring(1));
				return;
				}
			}

			var tmp = '<div class="accordion-group" style="background-color:rgba(184, 231, 240, 0.28)" id="order'
					+ orderdiv
					+ '" onclick=funrem('
					+ orderdiv
					+ ')><div class="accordion-heading"><a class="accordion-toggle"><font color="black"><i class="icon-trash"></i> '
					+ textHTML + '</font></a></div></div>';
				
			$("div#plantlist").append(tmp);
			orderdiv++;
			num++;
			if (num >= 2) {
				document.getElementById("btnClear").style.visibility = "visible";
				document.getElementById("btnList").style.visibility = "visible";
			}
		}
		showInit();
	}
}

function getSmartIDs() {
	createXhr();
	var url = "operation/GetPlantSmartIDKey.jsp?plants="+ encodeURIComponent(getSelect());

	// alert(url);
	xhr.open("POST", url, true);
	xhr.onreadystatechange = answer;
	xhr.send(null);

}

function answer() {
	var textHTML; // 返回值
	//alert(XHR.readyState+' '+XHR.status);
	if (xhr.readyState == 4) {
		if (xhr.status == 200 || xhr.status == 0) {
			textHTML = xhr.responseText;
			if (textHTML == "") {
				return;
			}
			var aaa = textHTML.split("@@");
			//alert(aaa.length);

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
				if (tmp[6] != 'null')
					a[order].name = tmp[6];
				//alert(a[order].desc+'  '+a[order].to+'  '+a[order].orgin);
			}

			var k;
			for (k = 1; k < a.length; k++) {
				if (a[k].orgin == a[k - 1].orgin) {
					// alert(k+' ='+a[k].orgin);
					a[k].parent = a[k - 1].parent;
					a[a[k].parent].rchild = k;
				} else if (a[k].orgin > a[k - 1].orgin) {
					// alert(k+' >'+a[k].orgin);
					a[k].parent = k - 1;
					if (a[a[k].parent].lchild == null)
						a[a[k].parent].lchild = k;
					else
						a[a[k].parent].rchild = k;
				} else {
					// alert(k+' hee'+a[k].orgin);
					a[k].parent = a[a[k].to].parent;
					a[a[k].parent].rchild = k;
				}
			}
			/*
			 * var r = ''; for (k = 1; k < a.length; k++) r = r + k + ' p:' +
			 * a[k].parent + ' l:' + a[k].lchild + ' r:' + a[k].rchild + '\n';
			 * alert(r);
			 */
			showInit();
		}
	}
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
	if(a[order].name!=null && a[order].name.trim()!='') 
		setA+='<span class="badge '+type+'"><a href="javascript:void(0)" onclick="show('+ a[order].parent +')" > ' + a[order].name +' </font></a></span>   ';
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
	document.getElementById("PlantsA").innerHTML=setB;
	setA=setB;
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

//说明
function initaddplants(plants) {
	orderdiv = 0;
	num = 0;
	var items = '';
	var plant = plants.split('#');
	for (; orderdiv < plant.length; orderdiv++, num++) {
		items += '<div class="accordion-group" style="background-color:rgba(184, 231, 240, 0.28)" id="order'
				+ orderdiv
				+ '" onclick=funrem('
				+ orderdiv
				+ ')><div class="accordion-heading"><a class="accordion-toggle"><font color="black"><i class="icon-trash"></i> '
				+ plant[orderdiv] + '</font></a></div></div>';
	}
	document.getElementById("plantlist").innerHTML = items;
	if (orderdiv>=1)
		document.getElementById("btnClear").style.visibility = "visible";
		document.getElementById("btnList").style.visibility = "visible";
}