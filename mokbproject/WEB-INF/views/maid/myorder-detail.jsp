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
		<title>订单详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myorder-detail.css" />
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			<div style="display:none">
				<input id="order_id" value="${order_id}" disabled>
			</div>

			<div class="mdfd-content">
				<!--寄送地址-->
				<div class="logistics-address-box" style="display:none;">
					<div class="logistics-address-logo">
						<i class="iconfont icon-address shade"></i>
					</div>
					<div class="default-text-color logistics-address">
						<label style="display: block;">
							<span>收货人：<span id="user_name">--</span></span>
							<span class="float-r" id="tel_phone">--</span>
						</label>
						<label style="display: block;">
							<span>收货地址：<span id="address">--</span></span>
						</label>
					</div>
				</div>

				<!--订单信息-->
				<div class="order-detail-box">
					<div class="order-detail">
						<div class="order-info">
							<div class="order-img">
								<img id="store_pic" onerror="javascript:this.src='http://via.placeholder.com/100X100 '"/>
							</div>
							<div class="default-text-color store-title" id="store_name"></div>
							<label style="display: block;">
								<span class="float-l" id="all_price" style="color:#62bca3;"></span>
								<span class="float-r" id="num">X1</span>
							</label>
							<!-- 
							<p class="float-r">
								<span class="order-btn">退款</span>
							</p> 
							-->
						</div>
					</div>
				</div>

				<!--订单总价-->
				<div class="order-money-box">
					<div style="border-bottom: 1px solid #f0f0f0;line-height: 40px;">
						<label style="display: none;">运险费 <span class="float-r" style="font-size:15px;">卖家赠送</span></label>
						<label style="display: none;">运费 <span class="float-r" style="font-size:15px;">卖家赠送</span></label>
					</div>
					<div style="line-height: 40px;">
						实付款<span class="float-r" id="true_price" style="color:#62bca3;"></span>
					</div>
				</div>

				<!--订单编号-->
				<div class="order-number-box">
					<div style="line-height: 40px;">
						<label style="display: block;">
							订单编号:<span id="order_id1"></span>
						</label>
						<label style="display: block;">
							下单时间:<span id="order_add_date"></span>
						</label>
						<label style="display: block;">
							付款时间:<span id="pay_date"></span>
						</label> 
						<label style="display: block;">
							发货时间:<span id="send_date"></span>
						</label>
					</div>

				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<script type="text/javascript">
			
			window.onload = function() {
				var order_id = document.getElementById("order_id").value;
				var paramData = {
					order_id: order_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>order_weixin/findOrderOne", object, "json", "json", showOrder);
			};
		
			function showOrder(vor) {
				console.log(JSON.stringify(vor));
				var sup = vor.orderSupplementData.orderSupplement;
				var orderBasics = vor.basicsOrderData.orderBasics;
				
				var store = vor.allData.order;
				var pic = store.store_picture.split(";");
				var store_picture = 'file/store/img/' + pic[0];
				document.getElementById("store_pic").src = store_picture;
				
				document.getElementById("store_name").innerHTML = store.store_name;
				document.getElementById("all_price").innerHTML = '￥' + orderBasics.all_price.toFixed(2);
				document.getElementById("num").innerHTML = 'X' + orderBasics.store_amount;
				document.getElementById("true_price").innerHTML = '￥' + orderBasics.all_price.toFixed(2);
				document.getElementById("user_name").innerHTML = sup.user_name;
				document.getElementById("tel_phone").innerHTML = sup.tel_phone;
				document.getElementById("address").innerHTML = sup.order_addr;
				
				document.getElementById("order_id1").innerHTML = orderBasics.order_id;
				var order_add_date = orderBasics.order_add_date;
				document.getElementById("order_add_date").innerHTML = formatDateTimeStr(order_add_date,1);
				var orderStatus = orderBasics.order_status;
				if(orderStatus != 2){
					var send_date = orderBasics.payment_date;
					document.getElementById("pay_date").innerHTML = formatDateTimeStr(send_date,1);
					if(orderStatus == 4){
						var send_date = sup.send_date;
						document.getElementById("send_date").innerHTML = formatDateTimeStr(send_date,1);
					}else{
						document.getElementById("send_date").parentNode.style.display = 'none';
					}
				}else{
					document.getElementById("pay_date").parentNode.style.display = 'none';
					document.getElementById("send_date").parentNode.style.display = 'none';
				}
				
				
				
				
			}
			
		</script>
	</body>

</html>