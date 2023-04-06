<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>网页访问不鸟</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../css/404/error_all.css">
</head>
<body class="error-404">
<div id="doc_main" class="doc_main" >
	<form action="" method="post" name="agree">
	<section class="bd clearfix" >
		<div class="module-error">
		<div style="width:320px;height:250px;margin: 0 auto; min-width: 320px;max-width: 1500px;">
				<div class="info" style=" float:left;">
				<!-- 左边放图片的div -->	
				<div style="width: 30%;height: 250px; float:left;">
					<div class="label" style="width: 150px; height:150px;">
				          <img src="../css/404/b.gif" width="100%" height="100%">
				    </div>
				</div>
				<!-- 右边放文字的div -->
				<div style="width: 60%;height: 250px; float:right;margin-top: 0px">
				<h3 class="title" style="width: auto;">啊哦 ! 登录超时，也有可能是断网了</h3>
					<div class="reason" style="width: 100%;height: auto;">
						<p>可能的原因：</p>
						<p>1.链接过了保质期。</p>
						<p>2.系统正在维护更新中。</p>
						<p>
						3.我们将在
			            <input  type="submit" value="10秒" name="agreeb" style="color: red; font-size: 20px;border-style:none">
						后为你自动返回。
						</p>
				    </div>
					
						<br>
						<div class="oper">
						<p><a href="<%=basePath%>HomeController/home">马上回到首页&gt;&gt;&gt;</a></p>
					    </div>
					 </div>
				</div>
				</div>
		</div>
	</section>
</div>
	</form>

<SCRIPT language=javascript>
<!--
var secs = 10;
document.agree.agreeb.disabled=true;
for(i=1;i<=secs;i++) {
 window.setTimeout("update(" + i + ")", i * 1000);
}
function update(num) {
 if(num == secs) {
window.location.href="<%=basePath%>HomeController/home"; 
 }
else {
 printnr = secs-num;
 document.agree.agreeb.value =printnr+"秒";
 }
}
//-->
</SCRIPT>
</body>
</html>