<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">

		<meta charset="UTF-8">
		<title>我的钱包</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myWallet.css" />
		
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<link type="text/css" rel="stylesheet" href="js/tplugins/jedate.css">
		<script src="js/tplugins/jeDate.js"></script>
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content default-text-color">
				<div class="wallet-box">
					<div class="wallet">
						<div class="wallet-tip">余额：</div>
						<div class="wallet-money" id="user_money">${money}0</div>
						<div class="wallet-btn-ground">
							<div class="wallet-btn" onclick="is_identifyRecharge();">
								<img src="file/jointly/images/icon/recharge-icon.png">&nbsp;&nbsp;充值
							</div>
							<div class="wallet-btn" onclick="is_identifyWithdraw();">
								<img src="file/jointly/images/icon/withdraw-icon.png">&nbsp;&nbsp;提现
							</div>
						</div>
					</div>
				</div>
				<div class="detail-box">
					<div class="detail-tip">
						<span style="font-size: 16px;color:#333;font-weight: none;">明细</span>
						<!-- <input id="datetimepicker" type="button" placeholder="请选择日期"> -->
					</div>
					<div id="integralAccount">
						<!-- 
						<div class="detail-single">
							<h5 class="default-text-color">提现12000元</h5>
							<div class="detail-base">
								<span>2018-04-29 13:15</span>
							</div>
						</div> 
						-->
					</div>
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<script type="text/javascript">
		     
			window.onload = function() {
			
			   ajaxPost("<%=basePath%>maid/findUserMoneyAccount","","json","json",getWalletDetail);
			};
		
			//日期选择
			$('#datetimepicker').jeDate({
				isinitVal: true,
				// 分隔符可以任意定义，该例子表示只显示年月
				format: 'YYYYMM',
				// 可以将此改为    `format: 'YYYY'`     表示只显示年的插件
				choosefun: function(val) {
					var date = document.getElementById("datetimepicker").value;
					var paramData = {
						month_date: date
					};
					var object = JSON.stringify(paramData);
					// ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
				}, //选中日期后的回调 
				clearfun: function(val) {
					//alert(JSON.stringify(val));
				}, //清除日期后的回调
				okfun: function(val) {
					var date = document.getElementById("datetimepicker").value;
					var paramData = {
						month_date: date
					};
					var object = JSON.stringify(paramData);
					// ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
				}
			});
			
			/* 充值认证 */
		  	function  is_identifyRecharge(){
		  		mui.alert('暂未开放...');
		  		return;
 	  		  	var paramData;
		  		var paramData={currentPage:1};                               
		  		var object = JSON.stringify(paramData);
		  		ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",findBankDetailInfo1);
		  	  }
			 /*获取用户信息实名,用户id*/
			  function findBankDetailInfo1(data){
			   	if(data.object.information_compellation ==""){
			   	 if(confirm("是否立即实名认证？")){
				    window.location.href='<%=basePath%>maid/personAddIdentityCard';
				 }else{
				    return false;
				 }
			   	}else if(data.object.information_compellation !=""){
			   		window.location.href='<%=basePath%>maid/myWalletRecharge';
			   	}
			  }
			  
			/*提现认证*/
		  	function  is_identifyWithdraw(){
 	  		  	var paramData;
		  		var paramData={currentPage:1};                               
		  		var object = JSON.stringify(paramData);
		  		ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",findBankDetailInfo2);
		  	  }
			 /*获取用户信息实名,用户id*/
			  function findBankDetailInfo2(data){
			   	if(data.object.information_compellation ==""){
			   	 if(confirm("是否立即实名认证？")){
				    window.location.href='<%=basePath%>maid/personAddIdentityCard';
				 }else{
				    return false;
				 }
			   	}else if(data.object.information_compellation !=""){
			   		window.location.href='<%=basePath%>maid/myWalletWithdraw?user_money='+document.getElementById("user_money").innerHTML;
			   	}
			  }
			  
			  function getWalletDetail(data){
			  	var walletDeatail = data.object;
			  	// alert(JSON.stringify(walletDeatail)); 
			  	var html = '';
			  	for(var i = 0;i < walletDeatail.length; i++){
			  		html += '<div class="detail-single">'+
			  				'	<h5 class="default-text-color">'+ walletDeatail[i].account_explain +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>'+ walletDeatail[i].account_value +'</span></h5>'+
			  				'	<div class="detail-base"><span>'+ formatDateTimeStr(walletDeatail[i].account_add_date, 1) +'</span></div>'+
			  				'</div> ';
			  	}
			  	document.getElementById('integralAccount').insertAdjacentHTML('afterbegin',html);
			  }
		</script>
	</body>

</html>