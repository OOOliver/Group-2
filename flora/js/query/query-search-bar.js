//搜索自动补全
var search_name=document.getElementById('search_name');	
var tagsul = document.getElementById("tags");
var current_li = -1;
var enterPressed = 0;
var preSearchName = "";

var XHR; //定义一个全局对象 
var textHTML; //返回值
function createXHR(){ 
	if(window.ActiveXObject){
		XHR=new ActiveXObject('Microsoft.XMLHTTP');
	}else if(window.XMLHttpRequest){
		XHR=new XMLHttpRequest(); 
	} 
}

function autoComplete(){
	var searchName=document.getElementById('search_name').value;
	if (preSearchName==searchName)
		return;
	preSearchName = searchName;
	if (searchName==""){
		document.getElementById("auto").style.visibility = "hidden";
		return;
	}
	if (enterPressed == 1){
		enterPressed = 0;
		return;
	}	
	current_li = -1;
	
	createXHR();
	str = encodeURIComponent(searchName);
	url = "operation/AutoCompleteSearch.jsp?name="+str;
	XHR.open("POST", url, false);
	XHR.onreadystatechange = ans;
	XHR.send(null);
	return false;
}
function ans(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			textHTML=XHR.responseText;
			if (textHTML==""){
				document.getElementById("auto").style.visibility = "hidden";
				return;
			}
			
			var items = textHTML.split("==");
			var auto = document.getElementById("auto");
   			var tags = document.getElementById("tags");
   			var len = tags.childNodes.length;
   			$("#tags li").remove();
   			for(var i=0;i<items.length;i++){
   				comp = items[i].split("++");
    			var li= document.createElement("li");
    			li.setAttribute("class","searchList");
    			li.style.width = search_name.style.width;
    			li.innerHTML = "<a href=\"#\" onclick='clickItem("+i+");'><div style='display:inline'>"+comp[0]
    				+"</div><div style='display:inline;float:right;'>"+comp[1]+"</div></a>";
    			tags.appendChild(li);
   			}

   				auto.style.width = search_name.style.width; 
   				tags.style.width = search_name.style.width;
   				auto.style.left = search_name.offsetLeft - 1; 
				auto.style.top = search_name.offsetTop + search_name.offsetHeight;
   				auto.style.visibility = "visible";
		} 
	} 
}

$(function(){    
    $("#search_name").keydown(function(e){
    	var keycode = 0;
    	if (navigator.appName == "Microsoft Internet Explorer"){
    		keycode = window.event.keyCode
    	}else {
			 keycode = e.which;
    	}
    	var len = tagsul.childNodes.length;
    	if (keycode == 40&&len>0){
    		if (current_li==-1){

    			current_li = 1;    			
    		}else if (current_li<len-1){

    			current_li = current_li+1;
    		}
    		//tagsul.style.background = "#406488";
	   		for (var i=1;i<len;i++){
    			temp = tagsul.childNodes[i].getElementsByTagName("a");
    			temp[0].style.background = "";
    		}
    		txt = tagsul.childNodes[current_li].getElementsByTagName("a");
    		txt[0].style.background = "#00f31f";
    		$("#search_name").focus();
    		return false;
    	}
    	
    	if (keycode == 38&&len>0){
    		if (current_li==-1){
    			current_li = 1;    			
    		}else if (current_li>1){

    			current_li = current_li-1;
    		}
    		for (var i=1;i<len;i++){
    			temp = tagsul.childNodes[i].getElementsByTagName("a");
    			temp[0].style.background = "#406488";
    		}
    		txt = tagsul.childNodes[current_li].getElementsByTagName("a");
    		txt[0].style.background = "#00f31f";
    		$("#search_name").focus();
    		return false;
    	} 
    	
    	if (keycode == 13&&len>0){
			document.getElementById("originClick").value = "1";
    		if (current_li!=-1){ 
    			if (document.getElementById("auto").style.visibility == "hidden"){
    				document.getElementById("search_form").submit();
    			}
    			document.getElementById("auto").style.visibility = "hidden";
    			txt = tagsul.childNodes[current_li].getElementsByTagName("a");
    			divss = txt[0].getElementsByTagName("div");
    			document.getElementById("search_name").value = divss[0].innerHTML;    			
    			enterPressed = 1;
    			document.getElementById("originClick").value = "0";
    			return false;
    		}
    	}
    	
    	
    });      
    $("#tags").mouseover(function(e){
    	len = tagsul.childNodes.length;
    	for (var i=1;i<len;i++){
    		temp = tagsul.childNodes[i].getElementsByTagName("a");
    		temp[0].style.background = "";
    	}
    	current_li = -1;
    	return false;
    });
    
    $("html").click(function(e){
    	document.getElementById("auto").style.visibility = "hidden";
    });
    
});

function clickItem(i){
	document.getElementById("auto").style.visibility = "hidden";
	i=i+1;
	txt = tagsul.childNodes[i].getElementsByTagName("a");
	divss = txt[0].getElementsByTagName("div");
	document.getElementById("search_name").value = divss[0].innerHTML;
    
    enterPressed = 1;
	autoComplete();
	return false;
}