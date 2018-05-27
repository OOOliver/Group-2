
<%@page import="database.LoginStatistics"%><%@ taglib  uri="http://www.opensymphony.com/sitemesh/decorator"  prefix="decorator" %> 
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<head>   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="img/logo4-small.ico" />
<link rel="icon" href="img/logo4-small.ico" />

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">  
<link href="css/bootstrap-tagsinput.css" rel="stylesheet" media="screen">

<link href="css/custom.css" rel="stylesheet" media="screen" />
<link href="css/buttons.css" rel="stylesheet" media="screen" />
<link href="css/font-awesome-ie7.min.css" rel="stylesheet" media="screen" />
<link href="css/font-awesome.min.css" rel="stylesheet" media="screen" />
<link href="css/animation/my-animation-chenli.css" rel="stylesheet" media="screen" />

<!-- link href="css/pin-style.css" rel="stylesheet" media="screen"/-->

<link href="css/grumble.min.css" rel="stylesheet" >
<link href="css/flat/my-flat-ui.css" rel="stylesheet" media="screen" />

<link href="css/inc/mbExtruder.css" media="all" rel="stylesheet" type="text/css">

<!--  script type="text/javascript" src="http://dw-resources.qiniudn.com/js/jquery-1.9.1.min.js"></script-->
<script src="js/jquery.min.js"></script>

<script src="js/bootstrap-tooltip.js"></script>
<script src="js/bootstrap-tagsinput.js"></script>
<script src="js/bootstrap-angular/angular.min.js"></script>
<script src="js/bootstrap-angular/bootstrap-tagsinput-angular.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/buttons.min.js"></script>
<script src="js/jquery.grumble.min.js?v=7"></script>
<script src="js/jquery.raty.js"></script>
<script src="js/raphael.js"></script>


<script src="js/flat-ui/bootstrap-select.js"></script>
<script src="js/flat-ui/bootstrap-switch.js"></script>
<script src="js/flat-ui/flatui-checkbox.js"></script>
<script src="js/flat-ui/flatui-radio.js"></script>

<script src="js/check-input/checkinput.js"></script>

<script src="js/pin/jquery.pin.js"></script>

<script type="text/javascript" src="js/inc/jquery.hoverIntent.min.js"></script>
<script type="text/javascript" src="js/inc/jquery.mb.flipText.js"></script>
<script type="text/javascript" src="js/inc/mbExtruder.js"></script>

<script src="js/query/query-common.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="http://dw-resources.qiniudn.com/js/html5.js"></script> 
<![endif]-->

<title>       
植物助手 -         
<decorator:title default="首页" />    
 </title>      
 <decorator:head />   
 </head>   
 <!--  body background="img/background/backgroundPic02.png"-->   
 <!--  body style="background-color: rgb(206, 219, 189);" -->
  <!-- body background="img/background/bg.jpg" -->   
   <body background="img/background/bg7.jpg">   
 <%
 String ip = request.getRemoteAddr();
 String loginStatus = (String)session.getAttribute("loginStatus");
 if (loginStatus==null){
 	LoginStatistics logins = new LoginStatistics();
 	logins.insertVisitWebsite(ip);
 	logins.closeDB();
 	session.setAttribute("loginStatus","1");
 }
 
  %>

<div id="navbar" class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">

      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span></a> 
						 <a href="index.jsp" class="brand">植物助手</a>
						 <div class="nav-collapse collapse">
							<ul class="nav">
								<li class="active" ><a href="index.jsp">首页</a></li>
								<li><a href="query.jsp">分类图</a></li>
								<li class="dropdown">
									 <a data-toggle="dropdown" class="dropdown-toggle" href="#">检索表<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="search.jsp">下级分类检索表</a></li>
										<li><a href="smartsearch.jsp">自定义检索表</a></li>
									</ul>
								</li>
								<li><a href="retrieve.jsp">智能查询</a></li>
							</ul>
							<ul class="nav pull-right">
								<li><a id="system-feedback" href="#system-feedback-container" role="button"  data-toggle="modal">联系我们</a></li>
								<li><a target="blank" href="about.jsp">关于</a></li>
								<li class="divider-vertical"></li>
								
							</ul>
						</div>
						
					</div>
				</div>
				
			</div>

		<div id="system-feedback-container" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" 
				aria-hidden="true" style="width: 500px; align:center">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					 <h3>联系我们</h3>
					
				</div>
				<div class="modal-body" id="system-feedback-details">
				<form>
					<dl>
						<dd><input type="text" id="userName" placeholder="您的姓名" style="width: 300px;height:30px" value="">
						<span style="color: #ff0000">*</span></dd>
						<dd><span id="error_userName" style="color: #ff0000"></span></dd>
					</dl>
					<dl>
						<dd><input type="text" id="userEmail" placeholder="您的邮箱" style="width: 300px;height:30px" value="">
						<span style="color: #ff0000">*</span></dd>
						<dd><span id="error_userEmail" style="color: #ff0000"></span></dd>
					</dl>
					<dl>
						<dd><input type="text" id="title" placeholder="标题" style="width: 300px;height:30px" value="">
						<span style="color: #ff0000">*</span></dd>
						<dd><span id="error_title" style="color: #ff0000"></span></dd>
					</dl>
					<dl>
						<textarea placeholder="正文内容, 请不要超过1000字" id="description" style="width: 400px;height:90px;margin-left:10px"></textarea>
						<span style="color: #ff0000">*</span>
						<dd><span id="error_description" style="color: #ff0000"></span></dd>
					</dl>
					<dl>
					请输入验证码：<input type="text" id="verifyCode" name="verifyCode"  style="width: 100px;height:30px" value="">
					<img id="validationCode" alt="验证码图片" title="验证码图片" src="<%=path %>/verification.png"  />
					<a href="#" onclick="changeValidationImg()" style="color: #009c38">换一换</a>
						<dd><span id="error_verifyCode" style="color: #ff0000">
						</span></dd>
						
					</dl>
				</form>
				<span id="sendingRemind" style="color: #ff3100"></span>
				</div>
				<div class="modal-footer">
					 <button class="btn btn-primary" onclick="sendFeedback()">发送</button>
					 <button class="btn" data-dismiss="modal" aria-hidden="true" id="backFeedback">返回</button>
				</div>
			</div>
<a id="success-remind" href="#success-remind-container" role="button"  data-toggle="modal" style="display: none"></a>
<div id="success-remind-container" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" 
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>消息提示</h3>
				</div>
				<div class="modal-body" id="success-remind-details">
					
				</div>
				<div class="modal-footer">
					 <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
				</div>
			</div>
<script>
$('#system-feedback').click(function(){
	changeValidationImg();
});
function changeValidationImg(){
	var url = document.getElementById('validationCode').src;
	if (url.indexOf("?")==-1)
		document.getElementById('validationCode').src = url + "?"+Math.random();
	else document.getElementById('validationCode').src = url + Math.random();
}
var XHR_Deco; //定义一个全局对象 
var textHTML_Deco;
function createXHR_Deco(){ 
	if(window.ActiveXObject){
		XHR_Deco = new ActiveXObject('Microsoft.XMLHTTP');
	}else if(window.XMLHttpRequest){
		XHR_Deco = new XMLHttpRequest(); 
	} 
} 
function ans_Deco(){
	if(XHR_Deco.readyState == 4){
		if(XHR_Deco.status == 200){ 
			textHTML_Deco = XHR_Deco.responseText; 
		} 
	} 
}
function sendFeedback(){
	var userName = document.getElementById('userName').value;
	var userEmail = document.getElementById('userEmail').value;
	var title = document.getElementById('title').value;
	var description = document.getElementById('description').value;
	var verifyCode = document.getElementById('verifyCode').value;
	var flag = true;
	document.getElementById('error_verifyCode').innerHTML = '';
	if (userName==''){
		document.getElementById('error_userName').innerHTML = '请输入您的姓名';
		flag = false;
	} else {
		document.getElementById('error_userName').innerHTML = '';
	}
	if (title==''){
		document.getElementById('error_title').innerHTML = '请输入标题';
		flag = false;
	} else {
		document.getElementById('error_title').innerHTML = '';
	}
	if (userEmail==''){
		document.getElementById('error_userEmail').innerHTML = '请输入您的邮箱';
		flag = false;
	} else {
		document.getElementById('error_userEmail').innerHTML = '';
		if (!checkEmail(userEmail)){
			document.getElementById('error_userEmail').innerHTML = '您输入的邮箱格式错误';
			flag = false;
		}
		else {
			document.getElementById('error_userEmail').innerHTML = '';
		}
	}
	if (description==''){
		document.getElementById('error_description').innerHTML = '请输入您的问题描述';
		flag = false;
	} else {
		document.getElementById('error_description').innerHTML = '';
		if (description.length>1000){
			document.getElementById('error_description').innerHTML = '问题描述的字数不能超过1000';
			flag = false;
		}else{
			document.getElementById('error_description').innerHTML = '';
		}
	}
	if (!flag)
		return false;
	document.getElementById('sendingRemind').innerHTML = "正在发送信息……";
	createXHR_Deco();
	textHTML_Deco = "";
	var url = "ajax/sendEmail.jsp?type=1&userName="+userName+"&userEmail="+userEmail+"&title="+title+"&description="+description+"&verifyCode="+verifyCode+"&type=1";
	url = encodeURI(url);
	url = encodeURI(url);
	XHR_Deco.open("POST",url,false);
	XHR_Deco.onreadystatechange = ans_Deco;
	XHR_Deco.send(null);
	if (textHTML_Deco=='1'){
		document.getElementById('backFeedback').click();
		document.getElementById('userName').value = '';
		document.getElementById('userEmail').value = '';
		document.getElementById('title').value = '';
		document.getElementById('description').value = '';
		document.getElementById('verifyCode').value = '';
		document.getElementById('error_userName').innerHTML = '';
		document.getElementById('error_userEmail').innerHTML = '';
		document.getElementById('error_title').innerHTML = '';
		document.getElementById('error_description').innerHTML = '';
		document.getElementById('error_verifyCode').innerHTML = '';
		document.getElementById('sendingRemind').innerHTML = '';
		document.getElementById('success-remind-details').innerHTML = '信息发送成功！感谢您对本网站关注，我们会及时处理您的信息并尽快向您答复。'
		document.getElementById('success-remind').click();
	} else {
		document.getElementById('sendingRemind').innerHTML = '';
		document.getElementById('error_verifyCode').innerHTML = '验证码错误';
	}
}
</script>		
		
			 <div style="margin-top:80px"></div>
<!--[if lt IE 9]>
    <div class="alert alert-block ie-alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>浏览器版本过低</h4>
        <br>
        <p>你知道不？你还在用十年前的浏览器！这个网页上的有很多好看的东西和动画效果都显示不了！</p>
        <p>建议赶快<a href="http://windows.microsoft.com/zh-cn/internet-explorer/downloads/ie-10/worldwide-languages" target="_blank">升级</a>你的浏览器版本或使用 <a href="http://www.google.com/intl/zh-CN/chrome/browser/" target="_blank">Chrome</a> 或 <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> 等高级浏览器。</p>
    </div>
<![endif]-->		

			<decorator:body/>
			
		<div align="center" >
			<address class="footnoteLink"><hr id="hrline"/>
				<a target="_blank" href="http://www.ib.cas.cn/">中国科学院植物研究所</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://www.kib.ac.cn/">中国科学院昆明植物研究所</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://herbarium.scib.ac.cn/">中国科学院华南植物园</a>
				<br/>
				<a target="_blank" href="http://frps.eflora.cn/">中国植物志</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://db.kib.ac.cn/eflora/Default.aspx">中国植物物种信息数据库</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://www.etaxonomy.ac.cn/">中国高等植物信息系统</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://www.eflora.cn/">中国在线植物志</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://www.cvh.ac.cn/">中国数字植物标本馆</a>&nbsp;|&nbsp;
				<a target="_blank" href="http://www.plantphoto.cn/">中国植物图像库</a>
				<p class="footnoteDescription">版权所有©
					<!--a target="_blank" href="http://www.iscas.ac.cn/">中国科学院软件研究所</a>&nbsp;
					<a target="_blank" href="http://nfs.iscas.ac.cn/">基础软件国家工程研究中心</a>&nbsp;  -->
					<a target="_blank" href="http://www.ucas.ac.cn/">中国科学院大学 </a>
					<a id="system-feedback" href="#system-feedback-container" role="button"  data-toggle="modal">AmiciPlantae团队</a></p>
					<p>最后更新时间: 2013-12-31</p>
			</address>
		</div>	
<script>
document.getElementById('hrline').style.width = document.body.scrollWidth;
</script>
   
</body>
 </html>