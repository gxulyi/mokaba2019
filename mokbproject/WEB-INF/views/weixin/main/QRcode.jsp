<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.medicinefood.entity.weixin.often.QRcodeModel" %>
<% 
QRcodeModel QRcodeModel=new QRcodeModel();
QRcodeModel=(QRcodeModel)request.getAttribute("QRcodeModel");

 %>
<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>二维码</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<style>
			.erweima_div{
				width: 100%;
				height: 100%;
				background: url(images/qrcode/bjts.png) no-repeat;
				background-size: 100% 100%;
				position: fixed;
				top: 0;
				left: 0;
			}
			.erweima_img{
				width: 70%;
				box-shadow: 0 0 0 1px #9be7bf, 0 0 0 2px #0d8544;
				border-radius: 5px;
				position: absolute;
				left: 15%;
				bottom:30%;
				transform: translate(-85% -70%);
			}
			.erweima_img img{
				width: 100%;
				height: 100%;
			}
		</style>
	</head>
	<body>
		<div class="mui-content">
			<div class="erweima_div">
				<div class="erweima_img">
					<img src="<%=QRcodeModel.imageUrl %>"/>
				</div>
				<img style="width:100%;position: absolute;bottom: 0;left: 0;" src="images/qrcode/wenz.png" />
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
		</script>
	</body>

</html>