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
		<title>提现</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myWalletWithdraw.css" />
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
										<input type="radio" name="walletwithdraw" value="2" onchange="selectPayType(this);">&nbsp;&nbsp;<label>提现到银行卡</label>
									</div>
									<!-- <div id="selectedBankCard" class="bank" onclick="selectBankCard();"></div> -->
								</div>
								<div class="select-type">
									<input type="radio" checked="checked" name="walletwithdraw" value="1" onchange="selectPayType(this);">&nbsp;&nbsp;<label>提现到微信余额</label>
								</div>
							</li>
							<li class="tableview-cell">
								<span class="money-tip">提现金额</span>
								<div class="money-box">
									<div class="money-icon">￥</div>
									<div class="money-input">
										<input id="withdrawMoney" type="number" placeholder="提现金额"/>
									</div>
								</div>
							</li>
							<li class="tableview-cell">
								<div class="btn-box">
									<input id="withdrawMoneyBtn" onclick="applyForBtn();" type="button" value="提现">
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
		<script type="text/javascript">

			window.onload = function() {
				
				var paramData={};                               
	      		var object = JSON.stringify(paramData);
	      		ajaxPost("<%=basePath%>weixin_bank/findAllBank",object,"json","json",getbankCardList);
	      		
			};
			
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}
			
			// 申请提现操作
			function applyForBtn(){
				var withdrawMoney = document.getElementById('withdrawMoney').value;
				if(withdrawMoney<=0){
					mui.alert('您的提现金额不正确，请重新输入...');
					return;
				}else if(getUrlParam('user_money')<withdrawMoney){
					/*  
					alert(getUrlParam('user_money'));
					alert(withdrawMoney);
					*/
					mui.alert('您的余额不足...');
					return;
				}
				var apply_receipt_type = getRadioButtonCheckedValue('walletwithdraw');
				var paramData={"apply_value":withdrawMoney,"apply_receipt_type":apply_receipt_type};                             
	      		var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>maid/addWithdrawalApply",object,"json","json",applyForCallBank);
			}
			
			/**
			 * 获取input = radio 单选框中选中的值
			 * @param tagNameAttr string  radio组中input的name属性值
			 * return 返回被选中radio的值
			 */
			function getRadioButtonCheckedValue(tagNameAttr){
			    var radio_tag = document.getElementsByName(tagNameAttr);
			    for(var i=0;i<radio_tag.length;i++){
			        if(radio_tag[i].checked){
			            var checkvalue = radio_tag[i].value;            
			            return checkvalue;
			        }
			    }
			}
			
			// 申请提现返回数据处理
			function applyForCallBank(data){
				// alert(data.message);
				//document.getElementById('withdrawMoney').value = '';
				//mui.back();
				//window.location.reload();//刷新
				window.location.href="maid/myWallet";//重定向并刷新
				//self.location=document.referrer;//返回上一页并刷新
			}
			
			// 判断选择提现方式
			function selectPayType(ele){
				if(ele.value == 2){
					mui.alert('暂未开通...');
					ele.checked = false;
				}
			}
			
			// 获取银行卡列表
			function getbankCardList(data){
				var bankCardData = data.bankEntityData.bankEntityList;
				if(bankCardData == '' || bankCardData == null || bankCardData == []){
					// document.getElementById('selectedBankCard').innerHTML = '使用新卡充值';
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