
var xhrSP; // 定义一个全局对象
var plantNameHTML;

function createxhrSP() {
	if (window.ActiveXObject) {
		xhrSP = new ActiveXObject('Microsoft.XMLHTTP');
	} else if (window.XMLHttpRequest) {
		xhrSP = new XMLHttpRequest();
	}
}
function getPlantDetailPre(plantName){
	createxhrSP();
	var url = "operation/getPlantName.jsp?plantName="+plantName;
	url = encodeURI(url);
	url = encodeURI(url);
	xhrSP.open("POST", url, false);
	xhrSP.onreadystatechange = returnPlantHTML;
	xhrSP.send(null);
	var detail = plantNameHTML;
	var names = detail.split("]]");
	getPlantDetail(names[0],names[1],names[2]);
}

function returnPlantHTML(){
	if (xhrSP.readyState == 4) {
		if (xhrSP.status == 200 || xhrSP.status == 0) {
			plantNameHTML = xhrSP.responseText;
		}
	}
}

