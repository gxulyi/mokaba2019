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

		<title>评价</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/evaluate.css" />

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
				<!--退款-->
				<div class="outset-border">
					<!--订单信息-->
					<div class="evaluate border-b-8F8F94">
						<div class="order-detail">
							<div class="order-img">
								<img src="file/store/img/" id="store_picture" />
							</div>
							<div class="order-info">
								<h5 class="default-text-color" id="store"></h5>
								<p>
									<span class="float-l" id="price"></span>
									<span class="float-r" id="num"></span>
								</p>
							</div>
						</div>
					</div>
					<div style="display:none">
						<input id="store_id" value="${store_id}" disabled>
					</div>
					<div style="display:none">
						<input id="order_id" value="${order_id}" disabled>
					</div>
					<!--评价内容-->
					<div class="evaluate">
						<!--输入文本域-->
						<textarea name="evaluate" id="evaluation_value" rows="5" placeholder="宝贝能满足你的期待么？说说你的使用心得，分享给想买的他们吧！！！"></textarea>
						<!--添加照片
						<div class="evaluate-img-box">
							<div class="img-box">
								<img src="file/jointly/images/banner/home/banner1.jpg"/>
							</div>
							<div class="img-box">
								<img src="file/jointly/images/banner/home/banner2.jpg"/>
							</div>
							<div class="img-box">
								<img src="file/jointly/images/banner/home/banner2.jpg"/>
							</div>
							<div class="img-box">
								<img src="file/jointly/images/banner/home/banner2.jpg"/>
							</div>
							<div id="camera" class="img-box">
								<img src="file/jointly/images/icon/icon-camera.png"/>
								<input id="takepicture" type="file" accept="image/*">
							</div>
						</div>-->
					</div>
				</div>

				<!--提交按钮-->
				<div class="submit-box">
					<input type="button" value="发布评价" onclick="addEvaluation()" />
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			function showOrder(vsi) {
				if(vsi.state == 0) {
					alert("评价成功！");
					var page_url = './maid/myorder';
					var page_id = 'myorder';
					var argument = '';
					OpenPage(page_url, page_id, argument);
				}
			}

			function addEvaluation() {
				var store_id = document.getElementById("store_id").value;
				var evaluation_value = document.getElementById("evaluation_value").value;
				var order_id = document.getElementById("order_id").value;
				if(evaluation_value == null || evaluation_value == '') {
					mui.alert('请输入您的看法或意见...');
					return;
				} else if(isEmojiCharacter(evaluation_value)) {
					mui.alert('包含非法字符，请重新输入...');
					document.getElementById('evaluation_value').value = null;
					return false;
				}
				var paramData;
				var paramData = {
					store_id: store_id,
					evaluation_value: evaluation_value,
					order_id: order_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>wenxin_store/addEvaluation", object, "json", "json", showOrder);
			}

			// 屏蔽表情
			function isEmojiCharacter(substring) {
				for(var i = 0; i < substring.length; i++) {
					var hs = substring.charCodeAt(i);
					if(0xd800 <= hs && hs <= 0xdbff) {
						if(substring.length > 1) {
							var ls = substring.charCodeAt(i + 1);
							var uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
							if(0x1d000 <= uc && uc <= 0x1f77f) {
								return true;
							};
						};
					} else if(substring.length > 1) {
						var ls = substring.charCodeAt(i + 1);
						if(ls == 0x20e3) {
							return true;
						};
					} else {
						if(0x2100 <= hs && hs <= 0x27ff) {
							return true;
						} else if(0x2B05 <= hs && hs <= 0x2b07) {
							return true;
						} else if(0x2934 <= hs && hs <= 0x2935) {
							return true;
						} else if(0x3297 <= hs && hs <= 0x3299) {
							return true;
						} else if(hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 ||
							hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b ||
							hs == 0x2b50) {
							return true;
						};
					};
				};
			}

			function showStore(vsi) {
				var src = document.getElementById("store_picture").src;
				//alert(JSON.stringify(vsi.sbd.storeBasics));
				var storeBasics = vsi.sbd.storeBasics;
				var picture = storeBasics.store_picture;
				var pic = picture.split(";");
				//alert(pic[0]);
				store_picture = src + pic[0];
				document.getElementById("store_picture").src = store_picture;
				//alert(store_picture);
				document.getElementById("store").innerHTML = storeBasics.store_name;
				document.getElementById("price").innerHTML = storeBasics.store_price;

			}

			function onloadd() {
				var store_id = document.getElementById("store_id").value;

				var paramData;
				var paramData = {
					store_id: store_id,
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>wenxin_store/findStore", object, "json", "json", showStore);
			};
			window.onload = function() {
				onloadd();
			};
		</script>
	</body>

</html>