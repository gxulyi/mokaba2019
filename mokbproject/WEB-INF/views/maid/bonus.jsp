<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="dateValue" class="java.util.Date" />
<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>奖金管理</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/bonus.css" />
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css" />
		<script src="js/pop/custom-pop.js"></script>

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
				<!-- <div class="search-right">
					<span class="iconfont icon-tishishuoming float-r"></span>
				</div> -->
			</div>

			<div class="mdfd-content">
				<!--奖励信息显示-->
				<div class="bonus-box">
					<div class="bonus-show default-text-color">
						<span style="color:#ffa954;font-size: 60px;" id="integralBonus">${integral_bonus}</span><br/>
						<span style="color:#fff;font-size: 18px;">累计奖金</span>
					</div>
					<div class="bonus-mange-box default-text-color">
<!-- 						<div class="bonus-mange-single"><label class="bonus-mange-single-active">奖金池</label></div> -->	
				        <div class="bonus-mange-single"><label class="bonus-mange-single-active">奖金明细</label></div>
				        <div class="bonus-mange-single"><label>申请兑换</label></div>
					    <div class="bonus-mange-single"><label>提现记录</label></div>
					</div>
				</div>

				<!--明细-->
				<div id="record" class="detail-box">
					<!-- 
					<div class="detail-single">
						<h5 class="default-text-color"><span>null购买商品--非正式会员无法获取奖励</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>3500.0</span></h5>
						<div class="detail-base">
							<span>2018-04-29 13:15</span>
							<span class="float-r">
						 		<span class="detail-money">订单号：14279</span>
							</span>
						</div>
					</div>
					
					<div class="detail-single">
						<h5 class="default-text-color"><span>null购买商品</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="detail-money">3500.0</span></h5>
						<div class="detail-base">
							<span>2018-04-29 13:15</span>
							<span class="float-r">
						 		<span class="detail-money">订单号：14279</span>
							</span>
						</div>
					</div> 
					-->
				</div> 
				<!-- 奖金池 -->
				<!-- <div id="dataGrid">
					<div class="jjc_time">
						<span id="getNowDate"></span>
						<input id="datetimepicker" type="button" placeholder="请选择日期">
					</div>
					<table class="jjc_tab">
						<thead>
							<tr class="jjc_title">
								<td>
									<div class="jjc_title_nr_tit">奖金池类别</div>
								</td>
								<td>
									<div class="jjc_title_nr_tit" style="border-left: 1px solid #fff;">当月分红数</div>
								</td>
								<td>
									<div class="jjc_title_nr_tit" style="border-left: 1px solid #fff;">奖金累计(元)</div>
								</td>
								<td>
									<div class="jjc_title_nr_tit" style="border-left: 1px solid #fff;">分红人数</div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="clear: both;"></div>
								</td>
							</tr>
						</thead>
						<tbody id="bonusPoolTable"></tbody>
					</table>
					<div class="fgborder"></div>
					<p class="pfotter">加油哦！你还差9个积分就能拿到“绿卡巴”奖金了</p>
				</div> -->

			</div>
			<input id="recordKye" type="hidden" value=1>
		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/ajax.js"></script>
		<script src="js/medicinefood/uitl.js"></script>
		<script type="text/javascript">
		
			/*数据加载*/
			window.onload = function() {
				bonusDetails();
				// 首次加载奖金池数据
				//loadBonusPool();
				//首次加载奖金明细数据
				//alert(222);
				
			};
			
			mui('.search-right').on('tap', '.icon-tishishuoming', function() {
				var html = '<table border="1px" frame="box" border-collapse="collapse" width="100%" style="background: transparent;color: #666;text-align: center;border-color: #666;">' +
					'	<tr><td colspan="2">会员</td><td>生命美学会员年费</td></tr>' +
					'	<tr><td>直接推荐人</td><td>第一代</td><td>3500</td></tr>' +
					'	<tr><td>间接推荐人</td><td>第二代</td><td>1750</td></tr>' +
					'</table>';
				var popInfo = {
					title: '提示',
					content: html
				};
				popShowAndHidden(popInfo);
			});
			
			// 奖励管理操作点击事件
			var bonussingles = mui('.bonus-mange-single');
			bonussingles.each(function(i, btn) {
				btn.addEventListener('tap', function() {
					switch(i) {
					/* 	case 0:
							// 奖金池
							selectActive(this);
							document.getElementById('record').setAttribute('style', 'display: none;');
							document.getElementById('dataGrid').setAttribute('style', 'display: block;');
							loadBonusPool();
							break; */
						case 0:
							// 奖金明细
							//alert(1111);
							selectActive(this);
							document.getElementById('record').setAttribute('style', 'display: block;');
							//document.getElementById('dataGrid').setAttribute('style', 'display: none;');
							// 获取奖金明细
							bonusDetails();
							break;
						case 1:
							// 申请提现
							selectActive(this);
							var paramData;
							var paramData = {
								currentPage: 1
							};
							var object = JSON.stringify(paramData);
							ajaxPost("<%=basePath%>user_weixin/findUserInformOne", object, "json", "json", isCheckedIdentify);
							break;
						case 2:
							// 提现记录
							selectActive(this);
							document.getElementById('record').setAttribute('style', 'display: block;');
							//document.getElementById('dataGrid').setAttribute('style', 'display: none;');
							getWithdrawDeposit(null);
							break;
					}
				}, false);
			});
			
			// 获取提现记录数据
			function getWithdrawDeposit(param) {
				var receive_name = param;
				var paramData = {
					receive_name: receive_name
				};
				var object = JSON.stringify(paramData);
				var url = "integra_weixin/userFindBonusExtractApply";
				ajaxPost("<%=basePath%>" + url, object, "json", "json", loadApplyHtml);
			}
			
			// 激活项切换文字颜色
			function selectActive(element){
				element.getElementsByTagName('label')[0].className = 'bonus-mange-single-active';
				for(var j = 0; j < siblings(element).length ; j ++){
					siblings(element)[j].getElementsByTagName('label')[0].className = '';
				}
			}
			
			
			// 获取当前节点兄弟节点（当前节点除外）
			function siblings(elm) {
				var a = [];
				var p = elm.parentNode.children;
				for(var i = 0, pl = p.length; i < pl; i++) {
					if(p[i] !== elm) a.push(p[i]);
				}
				return a;
			}
			
			/***
			 * 去除字符串中所有的空格
			 * @param {Object} str 目标字符串
			 * @param {Object} is_global  定义方式  g
			 */
			function Trim(str, is_global) {
				var result;
				result = str.replace(/(^\s+)|(\s+$)/g, "");
				if(is_global.toLowerCase() == "g") {
					result = result.replace(/\s/g, "");
				}
				return result;
			}
			
			// YYYYMM   YYYYMMDD HHmmss
			function getNowFormatDate(format) {
				var currentdate; // 时间字符串
				var date = new Date();
				var year = date.getFullYear(); // 获取当前年份
				var month = date.getMonth() + 1; // 获取当前月份
				month >= 10 ? month = month : month = '0' + month;
				var day = date.getDate(); //获取当前日(1-31)
				day >= 10 ? day = day : day = '0' + day;
				var hours = date.getHours(); //获取当前小时数(0-23)
				hours >= 10 ? hours = hours : hours = '0' + hours;
				var minutes = date.getMinutes(); //获取当前分钟数(0-59)
				minutes >= 10 ? minutes = minutes : minutes = '0' + minutes;
				
				if(format == 'YYYYMM'){
					currentdate = year + month;
				}else if(format == 'YYYYMMDD HHmmss'){
					currentdate = year + '年' + month + '月' + day + '日 ' + hours + ':' + minutes;
				};
				return currentdate;
			}

			/*用户是否进行实名认证过*/
			function isCheckedIdentify(data) {
				if(data.object == null) {
					alert("暂无此数据");
					return;
				}
				if(data.object.information_compellation != null && data.object.information_card != null && data.object.information_compellation != "" && data.object.information_card != "") {
					var btnArray = ['取消', '确定'];
					mui.prompt('', '请输入使用的奖金数量...', '申请兑换', btnArray, function(e) { //输入使用奖金数量的弹框
						if(e.index == 1) {
							var useBonusNum; //  提现金额
							if(e.value > 0) {
								if(e.value > (parseInt("${integral_bonus}"))) {
									mui.alert('余额不足！');
									return;
								}
								useBonusNum = e.value;
								// 去掉所有空格
								useBonusNum = Trim(useBonusNum, 'g');
								var reg = /^[0-9]*$/;
								if(!reg.test(useBonusNum)) {
									mui.alert('您的提现金额只能为整数,请重新输入...');
									return;
								}
								var paramData = {
									useBonusNum: parseInt(useBonusNum)
								};
								var object = JSON.stringify(paramData);
								var url = "integra_weixin/useBonusExtractMoneyApply";
								ajaxPost("<%=basePath%>" + url, object, "json", "json", completeAjax);
							}else{
								mui.alert('提现金额不能为零！');
								return;
							}
						} else {
							mui.toast('取消');
						};
					});
				} else {
					alert("需要进行实名认证");
					window.location.href = '<%=basePath%>maid/personAddIdentityCard';
				}

			}

			// 申请提现返回数据处理
			function completeAjax(data) {
				(function($, doc) {
					mui.alert("已提交申请，申请编号：" + data.object.applyid);
					setTimeout(function() {
						location.reload();
					}, 3000);
				})(mui, document);
			}
			// 加载奖金池数据
			function loadBonusPool(){
				document.getElementById('getNowDate').innerText = getNowFormatDate('YYYYMMDD HHmmss');
				var time = getNowFormatDate('YYYYMM');
				var paramData = {
					month_date: time
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
			}
			
			/*获取各个奖金池数据*/
			function bonusPool(data) {
			    /*奖金池分类*/
			    var type1 = "青卡巴奖金池";
				var type2 = "蓝卡巴奖金池";
				var type3 = "紫卡巴奖金池";
			    /*获取当前日期YYYYMM*/
			    var time = getNowFormatDate('YYYYMM');
				var htmlStr = ""; //加载的html文本
				   if(data.object.comMonthSales!=null){
				   /*获取累计奖金*/
			         document.getElementById('integralBonus').innerHTML = data.object.integral_bonus;
				   /*当月分红数并保留两位小数*/
					var currentMonthCount1 = (data.object.comMonthSales.indigo_kaba*0.3).toFixed(2) ;
				    var currentMonthCount2 = (data.object.comMonthSales.blue_violet_kaba*0.3).toFixed(2);
					var currentMonthCount3 = (data.object.comMonthSales.purple_kaba*0.3).toFixed(2);
				     /*判断当前日期是否为当前月*/
				   	if(data.object.comMonthSales.month_date == time){
							htmlStr = "<tr>"  +
									  "	<td>" + type1 + "</td>" +
									  "	<td>" +currentMonthCount1 + "</td>" +
									  "	<td>" + data.object.comMonthSales.indigo_kaba.toFixed(2) + "</td>" +
									  "	<td>" + data.object.comMonthSales.indigoKabaCount + "</td>" +
									  "</tr>" +
									  "<tr>"  +
									  "	<td>" + type2 + "</td>" +
									  "	<td>" +currentMonthCount2 + "</td>" +
									  "	<td>" + data.object.comMonthSales.blue_violet_kaba.toFixed(2) + "</td>" +
									  "	<td>" + data.object.comMonthSales.blueVioletKabaCount + "</td>" +
									  "</tr>" +
									  "<tr>"  +
									  "	<td>" + type3 + "</td>" +
									  "	<td>" +currentMonthCount3+ "</td>" +
									  "	<td>" + data.object.comMonthSales.purple_kaba.toFixed(2) + "</td>" +
									  "	<td>" + data.object.comMonthSales.purpleKabaCount + "</td>" +
									  "</tr>";
				   		
				   		}else{
				   			htmlStr = "<tr>"  +
									  "	<td>" + type1 + "</td>" +
									  "	<td>" +currentMonthCount1 + "</td>" +
									  "	<td>" + data.object.comMonthSales.indigo_kaba.toFixed(2) + "</td>" +
									  "	<td>" + '-' + "</td>" +
									  "</tr>" +
									  "<tr>"  +
									  "	<td>" + type2 + "</td>" +
									  "	<td>" +currentMonthCount2 + "</td>" +
									  "	<td>" + data.object.comMonthSales.blue_violet_kaba.toFixed(2) + "</td>" +
									  "	<td>" + '-' + "</td>" +
									  "</tr>" +
									  "<tr>"  +
									  "	<td>" + type3 + "</td>" +
									  "	<td>" +currentMonthCount3+ "</td>" +
									  "	<td>" + data.object.comMonthSales.purple_kaba.toFixed(2) + "</td>" +
									  "	<td>" + '-' + "</td>" +
									  "</tr>";	
				   			}
				   }else{
			   	        htmlStr = "<div class='tonus-detail-single'>" +
							  "	<h5 class='default-text-color'>暂无记录</h5>" +
							  "</div>";
					   }
				document.getElementById("bonusPoolTable").innerHTML = htmlStr; //写入HTML
			}

			/*加载奖金明细页面*/
			/*获取时间控件*/
			/* 通过选择日期回调奖金池分红数据*/
			//日期选择
			$('#datetimepicker').jeDate({
				isinitVal: true,
				// 分隔符可以任意定义，该例子表示只显示年月
				format: 'YYYYMM',
				// 可以将此改为    `format: 'YYYY'`     表示只显示年的插件
				//选中日期后的回调 
				choosefun: function(val) {
					var date = document.getElementById("datetimepicker").value;
					var paramData = {
						month_date: date
					};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
				}, 
				clearfun: function(val) {
					//alert(JSON.stringify(val));
				}, //清除日期后的回调
				okfun: function(val) {
					var date = document.getElementById("datetimepicker").value;
					var paramData = {
						month_date: date
					};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
				}
			});
			
			//奖金明细方法
			 function bonusDetails(){
			 	var paramDataDetail = {1: 1};
				var objectDetail = JSON.stringify(paramDataDetail);
				ajaxPost("<%=basePath%>maid/bonusDetail", objectDetail, "json", "json", getBounsDetail);
			 }
			
			
			// 获取奖金明细
			function getBounsDetail(data){
				var bounsDetailListData = data.object.accountList;
				
				if(bounsDetailListData.length != 0){
					var htmlStr = '';
					for(var i = 0;i < bounsDetailListData.length; i++){
						htmlStr += '<div class="detail-single">'+
								'	<h5 class="default-text-color"><span>'+ bounsDetailListData[i].integral_account_explain +'</span></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="detail-money">'+ bounsDetailListData[i].integral_account_num +'</span></h5>'+
								'	<div class="detail-base">'+
								'		<span>'+ formatDateTimeStr(bounsDetailListData[i].account_add_date, 1) +'</span>'+
								'		<span class="float-r"><span class="detail-money">订单号：'+ bounsDetailListData[i].integral_trigger +'</span></span>'+
								'	</div>'+
								'</div>';
					}
					document.getElementById('record').innerHTML = htmlStr;
				}else{
					document.getElementById('record').innerHTML = '<div class="detail-single"><h5 class="default-text-color">暂无记录</h5></div>';
				}
				
			}
			
			// 提现记录数据填充
			function loadApplyHtml(data) {
				var applyList = data.object; //提现申请集合
				var htmlStr = ""; //加载的html文本
				if(applyList.length >= 1) {
					var apply_status; //订单状态
					for(var i = 0; i < applyList.length; i++) { //遍历提现申请集合
						var d = new Date(applyList[i].apply_add_date); //添加时间（时间戳）
						var date = (d.getFullYear()) + "-" +
							(d.getMonth() + 1) + "-" +
							(d.getDate()) + " " +
							(d.getHours()) + ":" +
							(d.getMinutes()) + ":" +
							(d.getSeconds()); //转为字符串
						switch(applyList[i].apply_status) { //判断订单状态，显示为相应字符串
							case 1:
								apply_status = "审核中";
								break;
							case 2:
								apply_status = "待确认";
								break;
							case 3:
								apply_status = "待打款";
								break;
							case 4:
								apply_status = "已完成";
								break;
							case 5:
								apply_status = "已打款";
								break;
							case 6:
								apply_status = "已删除";
								break;
							case 7:
								apply_status = "商家拒绝打款";
								break;
							case 8:
								apply_status = "审核未通过";
								break;
							default:
								break;
						};
						htmlStr += "<div class='detail-single'>" +
								   "	<h5 class='default-text-color'> &nbsp&nbsp<span>申请编号：" + applyList[i].bonus_extract_apply_id + "</span></h5>" +
								   "	<div class='detail-base'>"+
								   "		<span>" + date + "</span>"+
								   "		<span class='float-r'>"+
								   "			￥: " + applyList[i].apply_sum + "&nbsp(" + apply_status + ")";
						if(applyList[i].apply_status == 4) {
							htmlStr += "		<button  onclick='updateRefuse4(" + applyList[i].bonus_extract_apply_id + ")'>确认收款</button >";
						}
						htmlStr += "		</span>" + 
								   "	</div>" + 
								   "</div>";
					}
				} else {
						htmlStr = "<div class='detail-single'>" +
							  	  "	<h5 class='default-text-color'>暂无记录</h5>" +
								  "</div>";
				}
				document.getElementById("record").innerHTML = htmlStr; //写入HTML
			}
		</script>

	</body>

</html>