<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/jquery-form.js" ></script> 
  	<script type="text/javascript" src="js/ajax.js"></script>
   <meta charset="UTF-8">
		<title>申请退货</title>
		<script type="text/javascript">
			function addRestore(){
			debugger;
				var re_reason=document.getElementById("re_reason").value;
				if(re_reason==0){
      				alert("请选择退款原因！");
      				return false;
      			}
				var order_id=document.getElementById("order_id").value;
				//alert(order_id);
				var re_addr=document.getElementById("address").value;
				var waybill_num=document.getElementById("addnum").value;
				var reason_detail=document.getElementById("reason_detail").value;
				var restore_money=document.getElementById("all_price").innerHTML;
				//alert(restore_money);
				var paramData;
	  			var paramData={order_id:order_id,re_addr:re_addr,waybill_num:waybill_num,re_reason:re_reason,reason_detail:reason_detail,restore_money:restore_money};                               
	 			var object = JSON.stringify(paramData);
	  			ajaxPost("<%=basePath%>order_weixin/addOrderSales",object,"json","json",backFindOrder);
			}
			function backFindOrder(vor){
				if(vor.state==0){
					window.location="<%=basePath%>maid/myorder";
				}else{
					alert("退货失败");
				}
			}
			function onloadd(){
      			var order_id=document.getElementById("order_id").value;
      			//alert(order_id);
				var paramData;
	 			var paramData={order_id:order_id};
	  			var object = JSON.stringify(paramData);
	  			ajaxPost("<%=basePath%>order_weixin/findOrderOne",object,"json","json",showMoney);
			};
			window.onload=function(){
	  			onloadd();
			};
			function showMoney(vor){
				var all_price=vor.basicsOrderData.orderBasics.all_price;
     		 	document.getElementById("all_price").innerHTML=all_price;
			};
		</script>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
	</head>
	<style type="text/css">
		select {line-height: none !important;width: 90% !important;margin-top: none !important;margin-bottom: 0;padding: 5px 10px !important;border: 2px solid #D5D5D3 !important;border-radius:none !important;}
		textarea {line-height: none !important;width: 90% !important;margin-top: none !important;margin-bottom: 0;padding: 5px 10px !important;border: 2px solid #D5D5D3 !important;border-radius:none !important;}
		input[type=text], input[type=number]{line-height: 1.5;width: 90% !important; line-height: 40px; margin-bottom: 0px; padding: 5px 10px !important;-webkit-user-select: text;border: 2px solid #D5D5D3 !important;border-radius:none !important;outline: 0;-webkit-appearance: none;}
		.sales-box{position: relative;clear: all;overflow: hidden;padding: 5px;}
		
		/*退货原因*/
		.refund-cause{position: relative;clear: all;overflow: hidden;line-height: 40px;text-align: center;float: left;width: 30%;}
		.refund-cause span{color: red;vertical-align: middle;}
		.refund-cause-select{float: left;width: 70%;line-height: 40px;}
		
		/*退货原因*/
		.sales-single-box{position: relative;clear: all;overflow: hidden;margin-bottom: 10px;}
		.sales-single-tip{float: left;width: 30%;position: relative;clear: all;overflow: hidden;line-height: 40px;text-align: center;}
		.sales-single-content{position: relative;clear: all;overflow: hidden;float: left;width: 70%;line-height: 40px;}
		.start{color: red;vertical-align: middle;}
		
		/*提交数据*/
		.submit-box{margin-top: 50px;text-align: center;margin-bottom: 50px;}
		input[type=button]{background: linear-gradient(to bottom, #FEADBA, #BF9ADD);color: white;border: none;}
	</style>
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
				<div class="sales-box">
					
					<!--退款原因-->
					<div class="position-relative">
						<div class="refund-cause"><span class="start"></span>退货原因：</div>
						<div class="refund-cause-select">
							<select name="reason" id="re_reason">
								<option value="0">请选择退货原因</option>
								<option value="对产品不满意">对产品不满意</option>
								<option value="不想买了">不想买了</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
					<!--商品价格-->
					<div class="sales-single-box">
						<div class="sales-single-tip">
							<span class="start" ></span>商品价格：
						</div>
						<div class="sales-single-content">
							<span id="all_price"></span>
						</div>
					</div>
				
					<!--运单号码-->
					<div class="sales-single-box">
						<div class="sales-single-tip">
							<span class="start"></span>运单号码：
						</div>
						<div class="sales-single-content">
							<input type="text" id="addnum" placeholder="请输入运单号" />
						</div>
					</div>
					
					<!--退货原因-->
					<div class="sales-single-box">
						<div class="sales-single-tip">
							<span class="start"></span>退货地址：
						</div>
						<div class="sales-single-content">
							<input type="text" id="address" placeholder="请输入详细地址" />
						</div>
					</div>
					<div  style="display:none">
						<input id="order_id" value="${order_id}" disabled>
					</div>
					
					<!--退货说明-->
					<div class="sales-single-box">
						<div class="sales-single-tip">
							<span class="start"></span>退货说明：
						</div>
						<div class="sales-single-content">
							<textarea name="explain" rows="8" placeholder="请描述退货原因..." id="reason_detail"></textarea>
						</div>
					</div>
					
				</div>
				
				<!--提交按钮-->
				<div class="submit-box">
					<input type="button" value="确认退货" onclick="addRestore()"/>
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
		</script>
	</body>

</html>