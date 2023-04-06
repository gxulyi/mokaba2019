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
		<title>新增收货地址</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myteam.css" />
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/receiving-address.css" />
		
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		
		<script type="text/javascript" src="js/zdialog/js/zdialog.js"></script>
		<link rel="stylesheet" href="js/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="js/zdialog/css/zdialog.css" type="text/css"></link>
		
	</head>

	<body>
		<!--搜索框-->
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">新增收货地址</h1>
		</header>
		<div class="mui-content">
			<input type="hidden" id="refreshed" value="no">
			<div class="mui-input-group">
				<div class="mui-input-row">
					<label>收件人：</label>
					<input type="text" id="name" placeholder="收件人姓名">
				</div>
				<div class="mui-input-row">
					<label>联系电话：</label>
					<input type="text" id="tel" placeholder="电话号码">
				</div>
				<ul class="mui-table-view order-ul-li">
			        <li class="mui-table-view-cell">
		                <label style="font-size: 14px;">收货地址：</label>
		                 <div class="mui-pull-right">
		                 	<select id="cmbProvince"></select>
							<select id="cmbCity"></select>
							<select id="cmbArea"></select>
		                 </div>
			        </li>
			        <li class="mui-table-view-input">
			            <input type="text" id="address" value=""  placeholder="请输入详细地址：如门牌号、小区、单元室等" />
			        </li>
			    </ul>
			</div>
			<div class="address-btn" onclick="addre();">保存收货地址</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/jsAddress.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			window.onload = function() {
				// 省市县三级联动
				addressInit('cmbProvince', 'cmbCity', 'cmbArea', '北京', '市辖区', '东城区');
				
				var refreshedId = document.getElementById("refreshed");
				
				if(refreshedId.value == "no") {
					refreshedId.value = "yes";
				} else {
					refreshedId.value = "no";
					location.reload();
				}
			};

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

				var cmbProvince = $("#cmbProvince option:selected"); //获取选中的项
				var cmbCity = $("#cmbCity option:selected"); //获取选中的项
				var cmbArea = $("#cmbArea option:selected"); //获取选中的项	    
				var name = $("#name").val();
				var tel = $("#tel").val();

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

				var address = cmbProvince.val() + ";" + cmbCity.val() + ";" + cmbArea.val() + ";" + $("#address").val();
				//var send=name+"*"+tel+"*"+address;
				//  var user_basics_id=$.cookie('cookieName');	   
				var paramData = {
					tel_phone: tel,
					user_name: name,
					order_addr: address
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/addOrderAddr", object, "json", "json", addOrderAddr);

				function addOrderAddr(data) {
					if(data.state == 0) {
						$.DialogByZ.Alert({
							Title: "提示",
							Content: "添加成功",
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
						//    alert("");
					}
				}
			}
		</script>

	</body>

</html>