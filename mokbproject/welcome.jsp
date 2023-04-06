<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <meta charset="UTF-8">
		<title>脉谛富德</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="css/mui.min.css" rel="stylesheet" />
	</head>
	<style type="text/css">
		.welcome{position: fixed;top: 0;bottom: 0;left:0;right: 0;}
		img{width: 100%;height: 100%;}
		.btn{position: absolute;top: 0.5rem;right: 0.5rem;background: black;line-height: 1.8;padding: 0.2rem;opacity: 0.5;color: #FFFFFF;border-radius: 10px;}
		.btn span{color: #FF0000;}
	</style>
	
	<body>
		<div class="welcome">
			<img src="file/jointly/images/welcome.png"/>
		</div>
		<div class="btn">
			<span id="time">2</span>s跳过
		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				$.ready(function(){
					SetTimer();
				});
				
				// 跳过按钮点击事件
				$('body').on('tap','.btn',function(){
			      	var page_url = './HomeController/home';
			      	var page_id = 'home';
			      	var argument = '';
			      	window.location.href = page_url;
				});
				
				// 倒计时方法
				var count = 2;
				var timer = null;
				function SetTimer(){
					timer = setInterval(function () {
					    if (count > 0) {
					      	count = count - 1;
							document.getElementById('time').innerHTML = count;
						}else {
					      	clearInterval(timer);
					      	var page_url = './HomeController/home';
					      	var page_id = 'home';
					      	var argument = '';
					      	window.location.href = page_url;
					    }
					}, 1000);
				}
			})(mui,document);
		</script>
	</body>

</html>
