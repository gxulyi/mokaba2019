<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>提交订单</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/product_pay.css" />
		
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css" />
		<script type="text/javascript" src="js/pop/custom-pop.js"></script>
	</head>

	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<!--提交订单-->
			<div class="mdfd-content">
				<form action="" method="post" class="order-form-box">
					<ul class="mui-table-view" id="htmlli">
						<li class="custom-table-view-cell">
							<h5 class="default-text-color line-height-35" id="productname"></h5>
						</li>
						<li class="custom-table-view-cell">
							<div class="order-num">
								<span class="default-text-color line-height-35">缴纳年数</span>
								<div class="mui-numbox float-r" data-numbox-min="1">
									<button id="sign" class="mui-btn mui-btn-numbox-minus" type="button">-</button>
									<input id="num" class="mui-input-numbox" type="number" />
									<button id="add" class="mui-btn mui-btn-numbox-plus" type="button">+</button>
								</div>
							</div>
						</li>
						<li class="custom-table-view-cell">
							<h5 class="default-text-color line-height-35">
								<span>合计</span><span class="float-r">￥<span id="money"></span></span>
								<input hidden="hidden" type="number" name="money-val" id="money-val" value="21800.00"/>
							</h5>
						</li>
					</ul>
					<div class="check-row">
						<input id="protocol" name="checkbox" type="checkbox">
						<span class="lable">提交订单即代表阅读并同意<span style="color: blue;" onclick = "getProtocolData()">《注册会员条款》</span></span>
					</div>
					<div class="order-submit">
						<input id="button" type="button" disabled="disabled" value="提交订单" onclick="tijiao()">
					</div>
				</form>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
			var store_id = getUrlParam('store_id');
			(function($, doc) {
				$.init();
				
				if(store_id==73){
					doc.getElementById('num').parentNode.setAttribute('data-numbox-max',1);
				}
				
				doc.getElementById('add').addEventListener('tap', function() {
					if(store_id==73){
						mui.alert('每人只能购买一个体验包！');
						return;
					}else{
						var num = doc.getElementById('num').value;
						num = parseInt(num);
						calculativePrice(num, 'add');
					}
				}, false);

				doc.getElementById('sign').addEventListener('tap', function() {
					var num = doc.getElementById('num').value;
					num = parseInt(num);
					calculativePrice(num, 'sign');
				}, false);

				// 监听协议复选框
				doc.getElementById('protocol').addEventListener('change', function() {
					if(this.checked) {
						doc.getElementById('button').disabled = false;
					} else {
						doc.getElementById('button').disabled = true;
					}
				}, false);

			})(mui, document);

			/**
			 * 计算总价
			 * @param {Object} num 数量
			 * @param {Object} method 方法
			 */
			function calculativePrice(num, method) {
				if(method == 'add') {
					num = num + 1;
				} else {
					num = num - 1;
				}
				var price = document.getElementById('price').innerHTML;
				price = parseFloat(price);
				var money = price * num;
				money = money.toFixed(2);
				document.getElementById('money').innerHTML = money;
				document.getElementById('money-val').value = money;
			}

			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			// var store_id = getUrlParam('store_id');
			var address_id = getUrlParam('address_id');
			var num = getUrlParam('num');
			var states = 1;

			function function_product(data) {
				var storeBasics = data.sbd.storeBasics;
				var productname = '<span>' + storeBasics.store_name + '</span><span class="float-r">￥<span id="price">' + storeBasics.store_price.toFixed(2) + '</span></span>';
				$("#productname").append(productname);
				$("#money").html(storeBasics.store_price.toFixed(2));
			}

			var paramData = {
				store_id: store_id
			};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>wenxin_store/findStore", object, "json", "json", function_product);

			var order_addr = "";
			var user_name = "";
			var tel_phone = "";
			if(address_id == null) {
				//查询默认地址:
				var paramData1 = {};
				var object11 = JSON.stringify(paramData1);
				ajaxPost("<%=basePath%>order_weixin/findOrderAddrDef", object11, "json", "json", findOrderAddrDef);
			} else {
				//查询
				var paramSelect = {
					address_id: address_id
				};
				var objectparamSelect = JSON.stringify(paramSelect);
				ajaxPost("<%=basePath%>order_weixin/findOrderAddrOne", objectparamSelect, "json", "json", findOrderAddrOne);
			}
			
			// 查询默认地址
			function findOrderAddrDef(data) {
				var orderAddr = data.orderAddrData.orderAddr;
				var reg = new RegExp(";", "g"); //g,表示全部替换。
				if(orderAddr != null) {
					user_name = orderAddr.user_name;
					tel_phone = orderAddr.tel_phone;
					order_addr = orderAddr.order_addr.replace(reg, "");
					var htmlli = '<li class="custom-table-view-cell">' +
								 '	<h5 class="default-text-color line-height-35">' +
								 '		<span>收货人：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="user_name">' + user_name + '</a>' +
								 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
								 '	</h5>' +
								 '</li>' +
								 '<li class="custom-table-view-cell">' +
								 '	<h5 class="default-text-color line-height-35">' +
								 '		<span>收货电话：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="tel_phone">' + tel_phone + '</a>' +
								 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
								 '	</h5>' +
								 '</li>' +
								 '<li class="custom-table-view-cell">' +
								 '	<h5 class="default-text-color line-height-35">' +
								 '		<span>收货地址：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="order_addr">' + order_addr + '</a>' +
								 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
								 '	</h5>' +
								 '</li>';
					$("#htmlli").append(htmlli);
				} else {
					var num = $("#num").val();
					var htmlli = '<li class="custom-table-view-cell">' +
								 '	<h5 class="default-text-color line-height-35">' +
								 '		<span></span><a href="maid/newaddressPay?num=' + num + '&store_id=' + store_id + '" class="default-text-color" id="newaddressPay">请添加收货地址</a>' +
								 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
								 '	</h5>' +
								 '</li>';
						states = 0;
						$("#htmlli").append(htmlli);
				}
			}
			
			// 查询单个地址
			function findOrderAddrOne(data) {
				var orderAddr = data.orderAddrData.orderAddr;
				var reg = new RegExp(";", "g"); //g,表示全部替换。
				user_name = orderAddr.user_name;
				tel_phone = orderAddr.tel_phone;
				order_addr = orderAddr.order_addr.replace(reg, "");
				var htmlli = '<li class="custom-table-view-cell">' +
							 '	<h5 class="default-text-color line-height-35">' +
							 '		<span>收货人：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="user_name">' + user_name + '</a>' +
							 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
							 '	</h5>' +
							 '</li>' +
							 '<li class="custom-table-view-cell">' +
							 '	<h5 class="default-text-color line-height-35">' +
							 '		<span>收货电话：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="tel_phone">' + tel_phone + '</a>' +
							 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
							 '	</h5>' +
							 '</li>' +
							 '<li class="custom-table-view-cell">' +
							 '	<h5 class="default-text-color line-height-35">' +
							 '		<span>收货地址：</span><a href="maid/addresspay?store_id=' + store_id + '&address_id=' + address_id + '&num=' + $("#num").val() + '" class="default-text-color" id="order_addr">' + order_addr + '</a>' +
							 '		<input hidden="hidden" type="text" id="address-val" name="address-val" value="" />' +
							 '	</h5>' +
							 '</li>';
					$("#htmlli").append(htmlli);
			}
			
			// 提交订单
			function tijiao() {

				var tijiaoState = document.getElementById("button").disabled;

				if(!tijiaoState) {
					document.getElementById("button").disabled = true;
					if(states == 0) {
						alert("请添加收货地址");
						return;
					}
					
					//    var orderNo=Math.round(900000*Math.random()+100000); 
					//  window.location.href="<%=basePath%>payController/toPay?userId=bdfkjk2255ds&orderNo=wan"+orderNo+"&money=0.01&openId=o340P1hTZQNb3UhIkI54LPy6vT4Q&body=商品支付测试";    

					var num = $("#num").val();
					var user_basics_id = $.cookie('user_basics_id');
					var tijiao = {
						store_id: store_id,
						order_addr: order_addr,
						store_amount: num,
						user_basics_id: user_basics_id,
						user_name: user_name,
						tel_phone: tel_phone
					};
					var tijiaotijiao = JSON.stringify(tijiao);
					ajaxPost("<%=basePath%>order_weixin/addOrder?", tijiaotijiao, "json", "json", function_tijiao);
				}
			}
			
			function function_tijiao(data) {
				if(data.state!=0){
					alert(data.message);
				}else{
					var kkfj = data;
					var orderBasics = data.basicsUserData.orderBasics;
					var weixin_id = $.cookie('weixin_id');
					var price = $("#money").text();
					window.location.href = "<%=basePath%>payController/toPay?userId=" + orderBasics.user_basics_id + "&orderNo=" + orderBasics.order_id + "&money=" + price + "&openId=" + weixin_id + "&store_id=" + orderBasics.store_id;
				}
				
			}
			
			// 获取协议
			function getProtocolData() {
				var paramData = {
					protocol_id: 1
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_protocol/findProtocolById", object, "json", "json", pertocolData);
			}

			// 协议返回数据
			function pertocolData(data) {
				var popInfoData = data.protocolEntityData.protocolEntity;
				var popInfo = {
					title: popInfoData.protocol_title,
					content: popInfoData.protocol_content
				};
				popShowAndHidden(popInfo);
			}

		</script>
	</body>

</html>