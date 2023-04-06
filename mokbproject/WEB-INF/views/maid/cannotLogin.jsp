<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>错误页面</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<link href="css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
</head>

<body>

	<div class="mui-content">

		<div class="mdfd-content">
		<h4>无推荐人，不能注册！</h4>
			
		</div>

	</div>

</body>

</html>


