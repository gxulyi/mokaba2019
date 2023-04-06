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
		<title>身份证信息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<style type="text/css">
			/*自定义TableView*/
			
			.mui-table-view {
				background-color: #fff !important;
				border: none;
			}
			/*自定义tableview样式*/
			
			.mui-content>.mui-table-view:first-child {
				margin-top: 0px !important;
			}
			/*自定义cell样式*/
			
			.custom-table-view-cell {
				border-bottom: 1px solid #f0f0f0;
				padding: 11px 15px;
				position: relative;
				color: #000;
			}
			
			.custom-table-view-cell>a:not(.mui-btn) {
				position: relative;
				display: block;
				overflow: hidden;
				margin: -11px -15px;
				padding: inherit;
				white-space: nowrap;
				text-overflow: ellipsis;
				color: #000;
				font-size: 16px;
			}
			/*修改tableview背景色*/
			
			.mui-table-view::before {
				background-color: #f0f0f0 !important;
			}
			
			.mui-table-view::after {
				background-color: #f0f0f0 !important;
			}
			
			.submit-add-idinfo-box {
				position: relative;
				clear: all;
				overflow: hidden;
				text-align: center;
				line-height: 1.8;
				margin-top: 20px;
			}
			
			.submit-add-idinfo-box input[type=button] {
				background-color: #62bca3;
				color: white;
				border: none;
				border-radius: 5px;
			}
			
			.custom-table-view-cell span {
				font-size: 14px;
				color: #666;
			}
		</style>
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">

				<ul class="mui-table-view">
					<li class="custom-table-view-cell">
						<a>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span id="user_name"></span></a>
					</li>

					<li class="custom-table-view-cell">
						<a>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<span id="ages"></span></a>
					</li>
					<li class="custom-table-view-cell">
						<a>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<span id="sex"></span></a>
					</li>
					<li class="custom-table-view-cell">
						<a>手机号码：<span id="telNum"></span></a>
					</li>
					<li class="custom-table-view-cell">
						<a>身份证号码：<span id="id_card"></span></a>
					</li>
					<li class="custom-table-view-cell" style="display: none;">
						<a>有&nbsp;&nbsp;&nbsp;&nbsp;效&nbsp;&nbsp;&nbsp;期：<span id="end_date"></span></a>
					</li>

					<li class="custom-table-view-cell">
						<a>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<span id="address"></span></a>
					</li>
				</ul>

				<div class="submit-add-idinfo-box">
					<input type="button" onclick="window.location.href='./maid/personAddIdentityCard'" value="增改身份信息">
				</div>

			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var paramData;
				var paramData = {
					"1": "1"
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>user_weixin/findUserInformOne", object, "json", "json", showinfomart);
			};

			function showinfomart(vc) {
				if(vc.state == 0){
					var vc = vc.object;
					if(vc) {
						var sex = "";
						if(vc.information_sex == 1) {
							sex = "男";
						} else if(vc.information_sex == 0) {
							sex = "女";
						} else {
							sex = "未知";
						}
						document.getElementById("user_name").innerHTML = vc.information_compellation;
						document.getElementById("ages").innerHTML = vc.information_age;
						document.getElementById("sex").innerHTML = sex;
						document.getElementById("telNum").innerHTML = formatTelNumber(vc.information_phone);
						document.getElementById("id_card").innerHTML = formatBankNumber(vc.information_card);
						document.getElementById("end_date").innerHTML = vc.card_end;
						document.getElementById("address").innerHTML = vc.registered_address;
					}
				}else{
					mui.alert("请求数据异常，请稍后重试...");
					return;
				}
			}

			// 隐藏银行卡号
			function formatBankNumber(bankNumber) {
				return bankNumber.substr(0, 4) + "********" + bankNumber.substr(-4);
			}
			
			// 隐藏手机号
			function formatTelNumber(telNum) {
				return telNum.substr(0, 3) + "********" + telNum.substr(-4);
			}
		</script>
	</body>

</html>