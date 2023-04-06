<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    
  <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>

 <base href="<%=basePath%>">
<title>网页访问不鸟</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="file/error/404/error_all.css" type="text/css"></link>

</head>
<body class="error-404">
<div id="doc_main">
	
	<section class="bd clearfix">
		<div class="module-error">
			<div class="error-main clearfix">
				<div class="label"><img src="file/error/404/error.png"></div>
				<div class="info">
					<h3 class="title">啊哦，系统繁忙，请稍后再试哦</h3>
					<div class="reason">
						<p>可能的原因：</p>
						<p>1.手抖打错了。</p>
						<p>2.链接过了保质期。</p>
					</div>
					<div class="oper">
						<p><a href="HomeController/home">回到网站首页&gt;</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body></html>
  