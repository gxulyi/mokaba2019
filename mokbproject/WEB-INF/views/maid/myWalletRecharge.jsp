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
		<title>充值</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myWalletRecharge.css" />
		<link rel="stylesheet" type="text/css" href="css/radioAndCheckbox.css" />
		
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
				<div class="wallet-box">
					<div class="tableview-box">
						<ul class="tableview">
							<li class="tableview-cell" >
								<div class="select-type">
									<div class="select-bank">
										<input type="radio" checked="checked" name="walletrecharge" value="0">&nbsp;&nbsp;<label>银行卡充值</label>
									</div>
									<div id="selectedBankCard" class="bank" onclick="selectBankCard();"></div>
								</div>
								<div class="select-type">
									<input type="radio" name="walletrecharge" value="1">&nbsp;&nbsp;<label>微信余额充值</label>
								</div>
							</li>
							<li class="tableview-cell">
								<span class="money-tip">充值金额</span>
								<div class="money-box">
									<div>￥</div>
									<div>
										<input id="rechargeMoney" type="number" placeholder="充值金额"/>
									</div>
								</div>
							</li>
							<li class="tableview-cell">
								<div class="btn-box">
									<input id="rechargeBtn" type="button" value="充值">
								</div>
							</li>
						</ul>
					</div>
					
				</div>
				<div id="bankCardList" class="bank-list-box">
					<span class="bank-list-tip">选择银行卡</span>
					<div class="bank-list">
						<ul class="tableview">
							<!-- <li class="tableview-cell" onclick="userBankCard(this);">
								<div class="select-type">
									工商银行(7401)
								</div>
							</li> -->
							
							<li id="bankCard" class="tableview-cell">
								<div onclick="addBankCard();" class="select-type">
									<label>使用新卡充值</label>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				
				var paramData={};                               
	      		var object = JSON.stringify(paramData);
	      		ajaxPost("<%=basePath%>weixin_bank/findAllBank",object,"json","json",getbankCardList);
	      		
			};
			
			// 获取银行卡列表
			function getbankCardList(data){
				var bankCardData = data.bankEntityData.bankEntityList;
				if(bankCardData == []){
					document.getElementById('selectedBankCard').innerHTML = '使用新卡充值';
				}else{
					document.getElementById('selectedBankCard').innerHTML = bankCardData[0].affiliated_bank + '(' + bankCardData[0].bank_card.slice(bankCardData[0].bank_card.length - 4,bankCardData[0].bank_card.length) +')';
					var html = '';
					for(var i = 0; i < bankCardData.length; i++){
						html += '<li class="tableview-cell" onclick="userBankCard(this);">'+
								'	<div class="select-type">'+ bankCardData[i].affiliated_bank + '(' + bankCardData[i].bank_card.slice(bankCardData[i].bank_card.length - 4,bankCardData[i].bank_card.length) +')' +'</div>'+
								'</li>';
					}
					document.getElementById('bankCard').insertAdjacentHTML('afterbegin',html);
				}
			}
			
			// 打开选择列表
			function selectBankCard(){
				document.getElementById('bankCardList').setAttribute('style', 'display: block;');
			}
			
			// 选择银行卡并赋值
			function userBankCard(elements){
				document.getElementById('selectedBankCard').innerHTML = elements.children[0].innerText;
				document.getElementById('bankCardList').setAttribute('style', 'display: none;');
			};
			
			function addBankCard(){
	      		window.location.href='<%=basePath%>maid/personAddBankCard';
			}
			
		</script>
	</body>

</html>