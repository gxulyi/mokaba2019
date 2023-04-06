<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>新增收货地址</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/receiving-address.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">新增收货地址</h1>
		</header>
		<div class="mui-content">
			<div class="mui-input-group">
				<div class="mui-input-row">
					<label>收件人：</label>
					<input type="text" placeholder="收件人姓名">
				</div>
				<div class="mui-input-row">
					<label>联系电话：</label>
					<input type="text" placeholder="电话号码">
				</div>
				<ul class="mui-table-view order-ul-li">
			        <li class="mui-table-view-cell">
			            <a class="mui-navigate-right">
			                收货地址：
			                 <label class="mui-pull-right" style="padding-right: 20px;">请选择</label>
			            </a>
			        </li>
			        <li class="mui-table-view-input">
			            <input type="text" id="" value=""  placeholder="请输入详细地址：如门牌号、小区、单元室等" />
			        </li>
			    </ul>
			</div>
			<div class="address-btn">保存收货地址</div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script>
			mui.init({
				swipeBack: true //启用右滑关闭功能
			});
		</script>
	</body>

</html>