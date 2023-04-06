<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>收货地址</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" href="file/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="file/zdialog/css/zdialog.css" type="text/css"></link>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="file/zdialog/js/zdialog.js"></script>
		<style type="text/css">
				.address {
					position: relative;
					clear: all;
					overflow: hidden;
					background-color: white;
					line-height: 40px;
					padding-left: 10px;
					margin-top: 20px;
					text-align: center;
				}
				
				.address div {
					padding: 10px 15px
				}
				
				.address>div>span {
					border-radius: 10px;
					background:#04757d;
					color: white;
					border: none;
					padding: 10px 20px;
					line-height: 1.5;
				}
				
				p {
					margin: 0;
				}
				.address-list {
					position: relative;
					clear: all;
					overflow: hidden;
					padding: 10px;
				}
				
				.address-box {
					background-color: #F6F8F7;
					position: relative;
					clear: all;
					overflow: hidden;
					margin-bottom: 5px;
					border-radius: 5px;
				}
				
				.address-info {
					position: relative;
					clear: all;
					overflow: hidden;
					padding: 10px;
					border-bottom: 1px solid #D5D6D6;
				}
				
				.address-info h4,
				.address-info p {
					position: relative;
					clear: all;
					overflow: hidden;
					line-height: 1.5;
				}
				
				.address-btn {
					font-size: 16px;
					padding: 10px;
					width: 100%;
					position: relative;
					clear: all;
					overflow: hidden;
				}
				
				.address-default {
					width: 50%;
					float: left;
				}
				
				.address-editor {
					width: 25%;
					float: left;
				}
				
				.address-delet {
					width: 25%;
					float: left;
				}
				
				.user-order {
					position: relative;
					margin-top:5px;
					clear: all;
					overflow: hidden;
					text-align: center;
				}
				
				.order {
					float: left;
					width: 25%;
					font-size: 12px;
				}
				
				.order i,
				.order span {
					display: block;
				}
				
				div input,
				div span,
				div i {
					vertical-align: middle;
				}
				.iconfont{
					color: #8f8f94;
					font-size: 16px;
				}
				.icon-xiugai{
					font-size: 14px;
				}
				.default-text-color span{
					color:#333;
				}
				.default-text-color{
					color:#666;
				}
				.address-default  span{
					font-size: 12px;
					color: #8f8f94;
				}
				.address-editor  span{
					font-size: 12px;
					color: #8f8f94;
				}
				.address-delet  span{
					font-size: 12px;
					color: #8f8f94;
				}
				
			</style>
	</head>

	<body style="background: #fff">
		<header class="mui-bar mui-bar-nav" style="background: #04757d;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">收货地址</h1>
		</header>
		<div class="mui-content">
			<div class="mdfd-content">
				<div class="address-list" id="dizhi">

					<!--  <div class="address-box">
						<div class="address-info">
							<h4 class="default-text-color">
								<span class="float-l">李四 </span>   
								<span class="float-r">12345678910</span>
							</h4>
							<p class="default-text-color">贵州省贵阳市云岩区北京路22号</p>
						</div>
						<div class="address-btn">
							<div class="address-default default-text-color">
								<input type="radio" name="address"/>
								<span >设为默认地址</span>
							</div>
							<a class="address-editor default-text-color">
								<i class="iconfont icon-xiugai shade"></i>
								<span>编辑</span>
							</a>
							<a class="address-delet default-text-color">
								<i class="iconfont icon-shanchuguanbicha shade"></i>
								<span>删除</span>
							</a>
						</div>
					</div>-->

				</div>
				<div class="address">
					<div onclick="javascript:{window.location='order_weixin/newaddress';};"><span>添加收货地址</span> </div>
				</div>
			</div>

		</div>
		

		<script type="text/javascript">
			function toBack() {
				window.location = "<%=basePath%>HomeController/home";
			}
			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			var htmls = "";

			function findOrderAddr(data) {
				var listOrderAddr = data.orderAddrData.listOrderAddr;
				var reg = new RegExp(";", "g"); //g,表示全部替换。

				for(var i = 0; i < listOrderAddr.length; i++) {

					htmls += '<div class="address-box">' +
						'				<div class="address-info">' +
						'					<h4 class="default-text-color">' +
						'						<span class="float-l">' + listOrderAddr[i].user_name + ' </span>   ' +
						'						<span class="float-r">' + listOrderAddr[i].tel_phone + '</span>' +
						'					</h4>' +
						'					<p class="default-text-color">' + (listOrderAddr[i].order_addr).replace(reg, "") + '</p>' +
						'				</div>' +
						'				<div class="address-btn">' +
						'					<div class="address-default default-text-color"  onclick="updateLevel(' + listOrderAddr[i].address_id + ',this)">' +
						'						<input type="radio" name="address"/>' +
						'						<span >设为默认地址</span>' +
						'					</div>' +
						'					<a class="address-editor default-text-color" href="maid/editAddress?address_id=' + listOrderAddr[i].address_id + '">' +
						'						<i class="iconfont icon-xiugai shade"></i>' +
						'						<span>编辑</span>' +
						'					</a>' +
						'					<a class="address-delet default-text-color" onclick="delectaddr(' + listOrderAddr[i].address_id + ')">' +
						'						<i class="iconfont icon-shanchuguanbicha shade"></i>' +
						'						<span>删除</span>' +
						'					</a>' +
						'				</div>' +
						'			</div>';

				}

				$("#dizhi").append(htmls);

			}
			//查询
			var paramData = {};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>order_weixin/findOrderAddr", object, "json", "json", findOrderAddr);

			//默认
			function updateLevel(address_id, idhtml) {

				var paramData = {
					address_id: address_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/updateLevel", object, "json", "json", updateLevelBack);

				function updateLevelBack(data) {

					if(data.state == 0) {
						$.DialogByZ.Alert({
							Title: "提示",
							Content: "设置默认成功",
							BtnL: "确定"
						});
					}
				}
			}

			//删除
			function delectaddr(address_id) {
				$.DialogByZ.Confirm({
					Title: "",
					Content: "确定要删除吗？",
					FunL: confirmL,
					FunR: Immediate
				});
			}
			
			// 点击确定按钮
			function confirmL() {
				$.DialogByZ.Close();

				var paramData = {
					address_id: address_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/deleteOrderAddr", object, "json", "json", deleteOrderAddr);
			}
			
			// 点击取消按钮
			function Immediate() {
				$.DialogByZ.Close();
			}
			
			// 删除地址成功回调
			function deleteOrderAddr(data) {
				if(data.state == 0) {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "删除成功",
						BtnL: "确定",
						FunL: location.reload()
					});
				} else {
					$.DialogByZ.Alert({
						Title: "提示",
						Content: "删除失败，服务器繁忙",
						BtnL: "确定"
					});
				}
			}
			
		</script>
		<script src="js/mui.min.js"></script>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
		</script>
	</body>

</html>