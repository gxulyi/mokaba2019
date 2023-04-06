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
		<title>编辑收货地址</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myteam.css" />
		<link rel="stylesheet" href="file/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="file/zdialog/css/zdialog.css" type="text/css"></link>

		<style type="text/css">
			input[type=text],
			input[type=number],
			select {
				line-height: 1.5;
				width: 100%;
				height: 40px;
				margin-bottom: 0px;
				padding: 5px 10px;
				-webkit-user-select: text;
				border: none;
				border-radius: none !important;
				outline: 0;
				background-color: #F0F2F1;
				-webkit-appearance: none;
			}
			
			.newaddress {
				position: relative;
				clear: all;
				overflow: hidden;
				padding: 10px;
				text-align: center;
			}
			
			.newaddress-single {
				position: relative;
				clear: all;
				overflow: hidden;
				border-radius: 5px;
				width: 80%;
				background: #F0F2F1;
				display: block;
				left: 10%;
				line-height: 1.5;
				margin-top: 10px;
			}
			
			.newaddress-left {
				position: relative;
				clear: all;
				overflow: hidden;
				width: 20%;
				float: left;
				height: 40px;
				padding: 5px;
			}
			
			.newaddress-left i {
				vertical-align: middle;
			}
			
			.newaddress-right {
				position: relative;
				clear: all;
				overflow: hidden;
				width: 80%;
				float: left;
			}
			
			.newaddress-right select {
				width: 33%;
				float: left;
			}
			
			.address-sublimte {
				position: relative;
				clear: all;
				overflow: hidden;
				width: 80%;
				left: 10%;
				margin-top: 50px;
				text-align: center;
			}
			
			.address-sublimte button {
				padding: 10px 20px;
				border: none;
				background: #62bca3;
				color: white;
			}
		</style>

	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">
				<div class="newaddress">
					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-person shade"></i>
						</div>
						<div class="newaddress-right">
							<input type="text" id="name" placeholder="请输入姓名" />
						</div>
					</div>

					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-shouji shade"></i>
						</div>
						<div class="newaddress-right">
							<input type="number" id="tel" placeholder="请输入联系方式" />
						</div>
					</div>

					<div class="newaddress-single">
						<div class="newaddress-left">
							<i class="iconfont icon-address shade"></i>
						</div>
						<div class="newaddress-right">
							<select id="cmbProvince"></select>
							<select id="cmbCity"></select>
							<select id="cmbArea"></select>
							<input type="text" id="address" placeholder="请输入详细地址" />
						</div>

					</div>
				</div>

				<div class="address-sublimte" onclick="addre()">
					<button>确定</button>
				</div>

			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="file/zdialog/js/zdialog.js"></script>
		<script src="js/jsAddress.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			(function($, doc) {
				$.init();

				$.ready(function() {
					var afterUrl = window.location.search.substring(1);
					var arguments = decodeURI(afterUrl).split('=');
					var argument = arguments[1].split(',');

				});

				// 省市县三级联动
				addressInit('cmbProvince', 'cmbCity', 'cmbArea', '贵州', '贵阳市', '南明区');

			})(mui, document);

			function GetSelectVal(id) {
				var obj = document.getElementById(id); //定位id
				var index = obj.selectedIndex; // 选中索引
				var value = obj.options[index].value; // 选中值
				return value;
			}

			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			function addre() {
				function updateAddressOne(data) {

					if(data.state == 0) {
						$.DialogByZ.Alert({
							Title: "提示",
							Content: "修改成功",
							BtnL: "确定",
							FunL: alerts
						});

						function alerts() {

							self.location = document.referrer; //返回上一页并刷新
							//  window.history.back(-1);
							//  window.location.href="login.jsp?backurl="+window.location.href; 
						}
						// window.location.href="maid/address";  
					} else {

						$.DialogByZ.Alert({
							Title: "提示",
							Content: "服务器繁忙请稍后再试",
							BtnL: "确定"
						});
					}

				}

				var cmbProvince = $("#cmbProvince option:selected"); //获取选中的项
				var cmbCity = $("#cmbCity option:selected"); //获取选中的项
				var cmbArea = $("#cmbArea option:selected"); //获取选中的项	    
				var name = $("#name").val();
				var tel = $("#tel").val();
				var address = cmbProvince.val() + ";" + cmbCity.val() + ";" + cmbArea.val() + ";" + $("#address").val();
				//var send=name+"*"+tel+"*"+address;
				//  var user_basics_id=$.cookie('cookieName');	   
				if(cmbProvince.val().length == 0 || cmbCity.val().length == 0 || cmbArea.val().length == 0) {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "请选择好收货地址",
						BtnL: "确定"
					});
					return false;
				}
				if(name.length == 0) {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "姓名不能为空",
						BtnL: "确定"
					});
					return false;
				}
				if(tel.length == 0) {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "电话不能为空",
						BtnL: "确定"
					});
					return false;
				}

				if($("#address").val().length == 0) {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "详细地址不能为空",
						BtnL: "确定"
					});
					return false;
				}
				//修改
				var address_id1 = getUrlParam("address_id");
				var paramData = {
					tel_phone: tel,
					user_name: name,
					order_addr: address,
					address_id: address_id1
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/updateAddressOne", object, "json", "json", updateAddressOne);
			}

			function findOrderAddrOne(data) {
				var orderAddr = data.orderAddrData.orderAddr;
				var arrOrderAddr = orderAddr.order_addr.split(';');
				$("#cmbProvince  option[value='" + arrOrderAddr[0] + "'] ").attr("selected", true);
				$("#cmbCity  option[value='" + arrOrderAddr[1] + "'] ").attr("selected", true);
				$("#cmbArea  option[value='" + arrOrderAddr[2] + "'] ").attr("selected", true);
				$("#name").val(orderAddr.user_name);
				$("#tel").val(orderAddr.tel_phone);
				$("#address").val(arrOrderAddr[3]);
			}
			//查询
			var address_id = getUrlParam("address_id");
			var paramSelect = {
				address_id: address_id
			};
			var objectparamSelect = JSON.stringify(paramSelect);
			ajaxPost("<%=basePath%>order_weixin/findOrderAddrOne", objectparamSelect, "json", "json", findOrderAddrOne);
		</script>
	</body>

</html>