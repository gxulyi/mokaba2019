<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//response.sendRedirect("toPayFinal?appid="+appid2+"&timeStamp="+timestamp+"&nonceStr="+nonceStr2+"&package="+packages+"&sign="+finalsign+"&orderNo="+orderNo+"&money="+money+"&body="+body);
	  
String appId = request.getParameter("appid");
String timeStamp = request.getParameter("timeStamp");
String nonceStr = request.getParameter("nonceStr");
String packageValue = request.getParameter("package");
String paySign = request.getParameter("sign");

String userId = request.getParameter("userId");
String money = request.getParameter("money");
String openId = request.getParameter("openId");
String orderNo = request.getParameter("orderNo");
String body = java.net.URLDecoder.decode(request.getParameter("body"),"iso-8859-1");//new String(request.getParameter("body").getBytes("iso-8859-1")); //request.getParameter("body");

String store_id = request.getParameter("store_id");

String jsonString="{\"appId\":\""+appId+"\",\"timeStamp\":\""+timeStamp+"\",\"nonceStr\":\""+nonceStr+"\",\"packageValue\":\""+packageValue+"\",\"paySign\":\""+paySign+"\",\"userId\":\""+userId+"\",\"money\":\""+money+"\",\"openId\":\""+openId+"\",\"body\":\""+body+"\",\"store_id\":\""+store_id+"\",\"orderNo\":\""+orderNo+"\"}";

Cookie jsonStringCokie = new Cookie("jsonStringPay"+orderNo,jsonString);
jsonStringCokie.setPath("/");
response.addCookie(jsonStringCokie);

%>
<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">

		<title>微信支付</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta charset="UTF-8">

		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<style type="text/css">
			.order-form-box {
				position: relative;
				clear: all;
				overflow: hidden;
				padding: 5px;
			}
			
			.custom-table-view-cell {
				border-bottom: 1px solid #E5E5E5;
			}
			
			.line-height-35 {
				line-height: 35px;
			}
			
			.order-submit {
				position: relative;
				clear: all;
				overflow: hidden;
				padding-top: 20px;
			}
			
			.order-submit input {
				position: relative;
				clear: all;
				overflow: hidden;
				width: 50%;
				left: 25%;
				color: white;
				background-color: green;
				border: none;
			}
			
			.order-num {
				padding: 5px 0;
				position: relative;
				clear: all;
				overflow: hidden;
			}
		</style>
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

			<!--确定订单-->
			<div class="mdfd-content">
				<form action="" method="post" class="order-form-box">
					<ul class="mui-table-view" style="border-bottom: 10px solid #E7E7E7;">
						<li class="custom-table-view-cell">
							<div class="" style="position: relative;clear: all;overflow: hidden;padding: 5px;" id="shangping">

							</div>
						</li>
						<li class="custom-table-view-cell">
							<div class="" style="position: relative;clear: all;overflow: hidden;padding: 5px;">
								订&nbsp;&nbsp;单&nbsp;&nbsp;号：<span><%=orderNo %></span>
							</div>
						</li>
						<li class="custom-table-view-cell">
							<div class="" style="position: relative;clear: all;overflow: hidden;padding: 5px;">
								应付金额：<span style="color: red;">￥<%=money %></span>
							</div>
						</li>
					</ul>
					<h5 class="default-text-color" style="font-size: 17px;padding-left: 5px;">支付方式</h5>
					<ul class="mui-table-view">
						<li class="custom-table-view-cell">
							<div class="mui-input-row mui-radio">
								<label>微信支付</label>
								<input name="pay" type="radio">
							</div>
						</li>
					</ul>
					<div class="order-submit" onclick="callpay()">
						<input type="submit" value="确认支付">
					</div>
				</form>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
			function callpay() {
				WeixinJSBridge.invoke('getBrandWCPayRequest', {
					"appId": "<%=appId%>",
					"timeStamp": "<%=timeStamp%>",
					"nonceStr": "<%=nonceStr%>",
					"package": "<%=packageValue%>",
					"signType": "MD5",
					"paySign": "<%=paySign%>"
				}, function(res) {
					WeixinJSBridge.log(res.err_msg);
					// 				alert(res.err_code + res.err_desc + res.err_msg);
					if(res.err_msg == "get_brand_wcpay_request:ok") {
						alert("微信支付成功!");
						setTimeout(function() { //两秒后跳转  
							//location.href = "index.php";//PC网页式跳转  
							//$.mobile.changePage("http://www.shmedifood.com/HomeController/maid"); //手机网页式跳转  
							window.location.href = "<%=basePath%>HomeController/maid";
						}, 20);
					} else if(res.err_msg == "get_brand_wcpay_request:cancel") {
						alert("用户取消支付!");
					} else {
						alert("支付失败!" + res.err_msg);
					}
				});
			}
			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			var store_id = getUrlParam('store_id');

			function function_product(data) {
				var storeBasics = data.sbd.storeBasics;
				$("#shangping").html("商品名称：" + storeBasics.store_name);
				//private Integer store_id;//商品ID
				//private Double store_price;//商品价格
				//private String store_picture;//商品图片
				//private String store_intro;//商品简介
				//private Integer user_basics_id;//添加人ID
				//private Long add_date;//添加时间
				//private String store_name;//商品名称

			}

			var paramData = {
				store_id: store_id
			};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>wenxin_store/findStore", object, "json", "json", function_product);
		</script>
	</body>

</html>