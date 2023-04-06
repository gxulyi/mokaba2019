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
		<title>申请退款</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/refund.css" />
		
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
				<!--退款-->
				<div class="refund-box">
					<!--退款原因-->
					<div class="position-relative">
						<div class="refund-cause"><span>*</span>退款原因：</div>
						<div class="refund-cause-select">
							<select id="refund_reason" name="reason">
								<option value="0">请选择退款原因</option>
								<option value="对产品不满意">对产品不满意</option>
								<option value="不想买了">不想买了</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
					<!--退款金额-->
					<div class="position-relative">
						<div class="refund-money">
							退款金额：
						</div>
						<div style="display:none">
							<input id="order_id" value="${order_id}" disabled>
						</div>
						<div class="money">
							<input id="re_money" disabled>
						</div>
					</div>
					<!--退款说明-->
					<div class="position-relative">
						<div class="refund-explain">
							退款说明：
						</div>
						<div class="explain">
							<textarea id="reason_detail" rows="8" placeholder="请描述退款原因..."></textarea>
						</div>
					</div>
				</div>

				<!--提交按钮-->
				<div class="submit-box">
					<input type="button" value="确认退款" onclick="refundTrue()" />
				</div>
			</div>

		</div>
		
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript">
			function successs(vor) {
				if(vor.state == 0) {
					window.location = "<%=basePath%>maid/myorder";
				} else {
					alert("申请退款失败！");
				}
			}

			function refundTrue() {
				var refund_reason = document.getElementById("refund_reason").value;
				if(refund_reason == 0) {
					alert("请选择退款原因！");
					return false;
				}
				var order_id = document.getElementById("order_id").value;
				var refund_money = document.getElementById("re_money").value;
				var reason_detail = document.getElementById("reason_detail").value;
				var paramData;
				var paramData = {
					order_id: order_id,
					refund_reason: refund_reason,
					refund_money: refund_money,
					reason_detail: reason_detail
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/refund", object, "json", "json", successs);
			}

			function showMoney(vor) {
				//alert(JSON.stringify(vor));
				//alert(JSON.stringify(vor.basicsOrderData.orderBasics));
				//alert(JSON.stringify(vor.basicsOrderData.orderBasics.all_price));
				var all_price = vor.basicsOrderData.orderBasics.all_price;
				document.getElementById("re_money").value = all_price;
			}

			function onloadd() {
				var order_id = document.getElementById("order_id").value;
				var paramData;
				var paramData = {
					order_id: order_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/findOrderOne", object, "json", "json", showMoney);
			};
			window.onload = function() {
				onloadd();
			};
		</script>
	</body>

</html>