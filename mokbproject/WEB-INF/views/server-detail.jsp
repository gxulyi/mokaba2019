



<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
		<title>服务介绍</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<script type="text/javascript" src="js/jquery-form.js" ></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	</head>
		
	<body>
		<!--主体-->
		<div class="mui-content">
			<div class="search border-knowledge">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			<!--服务详情-->
			<div class="detail">
				<!-- <div class="title" style="border-bottom: none;">
					<img id="pic" src="" onerror="javascript:this.src='http://via.placeholder.com/216X120'"/>
				</div> -->
				<div id="server_intro"></div>
			</div>
		</div>
		<input id="server_id" value="${ server_id}" type="hidden">
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
		var server_id=document.getElementById("server_id").value;
		
		function showSvr(vsi){
			var server=vsi.personalServerData.personalServer;
			document.getElementById("server_intro").innerHTML=server.server_intro;
			var server_picture=server.server_picture;
			server_picture=server_picture.split(";");
			var pic=server_picture[0];
			pic='file/store/img/'+pic;
			// document.getElementById("pic").src=pic;
		}
		function findSvr(){
			server_id=document.getElementById("server_id").value;
			var paramData={server_id:server_id};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>weixin_personal/findPersonalSverOne",object,"json","json",showSvr);
		}
		window.onload=function(){
	   		findSvr();
		};
		</script>
	</body>

</html>